<?php


namespace app\api\service;


use app\api\model\UserIntegral;
use app\lib\enum\ScopeEnum;
use app\lib\exception\TokenException;
use app\lib\exception\WeChatException;
use think\Exception;
use app\api\model\User as UserModel;

class UserToken extends Token
{

    protected $code;
    protected $wxAppId;
    protected $wxAppSecret;
    protected $wxLoginUrl;

    function __construct($code)
    {
        $this->code = $code;
        $this->wxAppId = config('wx.app_id');
        $this->wxAppSecret = config('wx.app_secret');
        $this->wxLoginUrl = sprintf(config('wx.login_url'),$this->wxAppId,
            $this->wxAppSecret,$this->code);
    }

    public function get(){
        $result = curl_get($this->wxLoginUrl);
        $wxResult = json_decode($result,true);
        if(empty($wxResult)){
            throw new Exception('获取session_key及openId时异常，微信内部错误');
        }else{
            $loginFail = array_key_exists('errcode',$wxResult);
            if($loginFail){
                $this->processLoginFail($wxResult);
            }
            else{
                return $this->grantToken($wxResult);
            }
        }
    }

    private function processLoginFail($wxResult){
        throw new WeChatException([
           'msg'=> $wxResult['errmsg'],
           'errorCode'=>$wxResult['errcode'],
        ]);
    }

    private function grantToken($wxResult){//颁发令牌
        // 从$wxResult里面取到openid
        // 到数据库中看一眼，是否已经存在
        // 如果已经存在，则不做处理，如果不存在，则新增一条User记录
        // 生成令牌，准备缓存数据，写入缓存(key:令牌 value:wxResult,uid,scope)
        // 把令牌返回到客户端去
        $openid = $wxResult['openid'];
        $user = UserModel::getByOpenId($openid);
        if($user){
            $uid = $user->id;
        }else{
            $uid = $this->newUser($openid);
        }
        $cachedValue = $this->prepareCachedValue($wxResult,$uid);
        $token = $this->saveToCache($cachedValue);
        return $token;
    }

    private function newUser($openid){
        //创建一个用户并且存入openid
        $user = UserModel::create([
           'openid'=>$openid
        ]);
        //创建用户的时候，顺便给用户创建初始积分
        $data = ['user_id'=>$user->id, 'user_integral'=>3];
        UserIntegral::create($data);
        return $user->id;
    }

    private function prepareCachedValue($wxResult,$uid){
        $cachedValue = $wxResult;
        $cachedValue['uid'] = $uid;
        //scope等于16代表普通用户的权限数值
        $cachedValue['scope'] = ScopeEnum::User;

        //scope等于32代表CMS用户的权限数值
        //$cachedValue['scope'] = ScopeEnum::Super;
        return $cachedValue;
    }

    private function saveToCache($cachedValue){
        $key = self::generateToken();
        $value = json_encode($cachedValue);
        $expire_in = config('setting.token_expire_in');
        $request = cache($key,$value,$expire_in);
        if(!$request){
            throw new TokenException([
                'msg'=>'服务器缓存异常',
                'errorCode'=>10005
            ]);
        }
        return $key;

    }
}
<?php


namespace app\api\controller\v1;


use app\api\service\AppToken;
use app\api\service\UserToken;
use app\api\Validate\AppTokenGet;
use app\api\Validate\TokenGet;
use app\lib\exception\ParamateException;
use app\api\service\Token as TokenService;


class Token
{

    //获取token令牌
    public function getToken($code=''){
        (new TokenGet())->goCheck();
        $ut = new UserToken($code);
        $token = $ut->get();
        return [
            'token'=>$token
        ];
    }

    //验证token令牌是否有效
    public function verifyToken($token=''){
        if(!$token){
            throw  new ParamateException([
                'token不允许为空'
            ]);
        }
        $valid = TokenService::verifyToken($token);
        return[
            'isValid'=>$valid
        ];
    }


    //CMS系统登录接口
    public function getAppToken($ac='',$se=''){
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
        header('Access-Control-Allow-Methods: GET');
        (new AppTokenGet())->goCheck();
        $app = new AppToken();
        $token = $app->get($ac,$se);;
        return ['token'=>$token];
    }
}
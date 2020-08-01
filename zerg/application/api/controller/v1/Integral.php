<?php


namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\User as UserModel;
use app\api\model\UserIntegral;
use app\api\service\Token as TokenService;
use app\api\Validate\IntegralValidate;
use app\lib\exception\SuccessMessage;
use app\lib\exception\TokenException;
use app\lib\exception\UserException;

class Integral extends BaseController
{
    //前置方法
    protected $beforeActionList = [
        'checkPrimaryScope' => ['only'=>'UpdateIntegral,getUserIntegral']
    ];
    //查询用户积分
    public function getUserIntegral(){
        $uid = TokenService::getCurrentUid();
        $userIntegral = UserIntegral::getIntegralByUid($uid);
        if(!$userIntegral){
            throw new TokenException();
        }
        return $userIntegral;
    }

    //更新用户积分
    public function createOrUpdateIntegral(){
//        (new IntegralValidate())->goCheck(); 积分规则由自己定义不用验证
        $uid = TokenService::getCurrentUid();
        $user = UserModel::get($uid);
        if(!$user) {
            throw new UserException();
        }
        $request = input('post.');
        $integral = $request['integral'];
        $userIntegral = UserIntegral::getIntegralByUid($uid);
        //如果没有就新增
        if(!$userIntegral){
            $data = ['user_id'=>$uid, 'user_integral'=>$integral];
            UserIntegral::create($data);
        }else{//如果有就修改爆显存
            $userIntegral->user_integral = $integral;
            $userIntegral->save();
        }
        return json(new SuccessMessage(),201);
    }
}
<?php


namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\UserAddress;
use app\api\Validate\AddressNew;
use app\api\service\Token as TokenService;
use app\api\model\User as UserModel;
use app\lib\exception\SuccessMessage;
use app\lib\exception\UserException;


class Address extends BaseController
{
    //前置方法
    protected $beforeActionList = [
        'checkPrimaryScope' => ['only'=>'createOrUpdateAddress,getUserAddress']
    ];


    public function createOrUpdateAddress(){
        $validate = new AddressNew();
        $validate->goCheck();
        //根据token获取uid
        //根据uid来查找用户信息，如果用户不存在，抛出异常
        //获取用户从客户端提交过来的地址信息
        //根据用户地址信息是否存在，从而判断是新增地址还是更新地址

        $uid = TokenService::getCurrentUid();
        $user = UserModel::get($uid);
        if(!$user){
            throw new UserException();
        }

        $dataArray = $validate->getDataByRule(input('post.'));

        $userAddress = $user->address;
        if(!$userAddress){
            //地址不存在，新增地址
            $user->address()->save($dataArray);
        }else{
            //地址存在，更新地址
            $user->address->save($dataArray);
        }
        return json(new SuccessMessage(),201);
    }

    public function getUserAddress(){
        $uid = TokenService::getCurrentUid();
        $userAddress = UserAddress::where('user_id',$uid)->find();
        if(!$userAddress){
            throw new UserException([
                'msg'=>'用户地址不存在',
            'errorCode'=>60001
            ]);
        }
        return $userAddress;
    }
}
<?php


namespace app\api\model;


class UserIntegral extends BaseModel
{
    protected $hidden = ['id'];
    public static function getIntegralByUid($uid){
        //静态调用 复合模型查询
        $result = self::where('user_id',$uid)->find();
        return $result;
    }
}
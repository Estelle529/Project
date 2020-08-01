<?php


namespace app\api\model;


class Order extends BaseModel
{
    protected $hidden = ['delete_time','update_time'];
    protected $autoWriteTimestamp = true;

    //根据用户获取用户的订单
    public static function getSummaryByUser($uid,$pageIndex,$size=5){
        $result = self::where('user_id','=',$uid)
            ->order('create_time desc')
            ->paginate($size,true,['page'=>$pageIndex]);
        return $result;
    }

    //CMS管理员获取所有用户的订单
    public static function getSummaryBySuper($pageIndex,$size=10){
        $result = self::order('create_time desc')
            ->paginate($size,true,['page'=>$pageIndex]);
        return $result;
    }

    //获取一个订单详细信息
    public static function getDetail($id){
        $result = self::where('id','=',$id)->find();
        return $result;
    }

    //定义读取器，返回json对象
    public function getSnapItemsAttr($value){
        if(!$value){
            return null;
        }
        return json_decode($value);
    }
    public function getSnapAddressAttr($value){
        if(!$value){
            return null;
        }
        return json_decode($value);
    }
}
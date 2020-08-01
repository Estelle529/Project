<?php


namespace app\api\model;


use think\Db;
use think\Exception;
use think\Model;

class Banner extends BaseModel
{
    //隐藏一些字段不返回给客户端
    protected $hidden = ['delete_time','update_time'];

    public function items(){
        return $this->hasMany('BannerItem','banner_id','id');
    }
    public static function getBannerById($id){
        //静态调用 复合模型查询
        $result = self::with(['items','items.image'])->find($id);
        return $result;
    }
}
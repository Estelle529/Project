<?php


namespace app\api\model;


class ProductMisundstand extends BaseModel
{
    public static function getMisData($pageIndex,$size){
        $result = self::paginate($size,true,['page'=>$pageIndex]);
        return $result;
    }
}
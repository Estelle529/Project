<?php


namespace app\api\model;


class ProductWorth extends BaseModel
{
    protected $hidden = ['delete_time','update_time'];
    public static function superPageWorth($pageIndex,$size){
        $result = self::paginate($size,true,['page'=>$pageIndex]);
        $total = self::count();
        return [
            'data'=>$result,
            'total'=>$total
        ];
    }
}
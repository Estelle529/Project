<?php


namespace app\api\model;


class ProductImage extends BaseModel
{
    protected $hidden = ['delete_time'];
    public function detailimgUrl(){
        return $this->belongsTo('Image','img_id','id');
    }
    public static function superPageDetailImg($pageIndex,$size=10){
        $result = self::paginate($size,true,['page'=>$pageIndex]);
        $total = self::count();
        return [
            'data'=>$result,
            'total'=>$total
        ];
    }
}
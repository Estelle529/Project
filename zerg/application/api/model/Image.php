<?php


namespace app\api\model;


use think\Model;

class Image extends BaseModel
{
    protected $hidden = ['delete_time','update_time'];
    public function getUrlAttr($value,$data){//模型下的读取器
        return $this->prefixImgUrl($value,$data);
    }

    public static function superPageImg($pageIndex,$size=10){
        $result = self::paginate($size,true,['page'=>$pageIndex]);
        $total = self::count();
        return [
            'data'=>$result,
            'total'=>$total
        ];
    }
}
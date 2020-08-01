<?php


namespace app\api\model;


class ProductStory extends BaseModel
{

    public function image(){
        return $this->belongsTo('Image','img_id','id');
    }

    public static function  getMostRecentStory($count){
        $result = self::with(['image'])->limit($count)->order('id desc')->select();
        return $result;
    }

    public static function getStoryDetail($id){
        $result = self::with(['image'])->where('id','=',$id)->find();
        return $result;
    }

    public static function getAllStory(){
        $result = self::with(['image'])->select();
        return $result;
    }
}
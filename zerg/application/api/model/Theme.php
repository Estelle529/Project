<?php


namespace app\api\model;


class Theme extends BaseModel
{
    protected $hidden = ['delete_time','update_time'];

    public function topicImg(){
        return $this->belongsTo('Image','topic_img_id','id');
    }
    public function headImg(){
        return $this->belongsTo('Image','head_img_id','id');
    }

    public function products(){
        return $this->belongsToMany('Product','theme_product','product_id','theme_id');
    }

    public static function getThemeListById($ids){
        $result = self::with('topicImg,headImg')->select($ids);
        return $result;
    }
    public static function getThemeWithProducts($id){
        $result = self::with('products,headImg,topicImg')->find($id);
        return $result;
    }
}
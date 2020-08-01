<?php


namespace app\api\model;


class Category extends BaseModel
{
    protected $hidden = ['delete_time','update_time'];
    public function img(){
        return $this->belongsTo('Image','topic_img_id','id');
    }
    public function categoryProducts(){
        return $this->hasMany('Product','category_id','id');
    }
    public static function getCategories(){
//        $result = self::with('img')->select();
        //两种方法都可以  查询所有的时候
        $result = self::all([],'img');
        return $result;
    }

    public static function getCategoryProducts($id){
        $result = self::with('categoryProducts,img')->find($id);
        return $result;
    }
}
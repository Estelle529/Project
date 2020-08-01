<?php


namespace app\api\model;


use think\Model;

class BannerItem extends BaseModel
{
    protected $hidden = ['update_time','delete_time'];
    public function image(){
        return $this->belongsTo('Image','img_id','id');
    }
}
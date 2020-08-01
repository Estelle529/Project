<?php


namespace app\api\model;


use think\Model;

class BaseModel extends Model
{
    protected function prefixImgUrl($value,$data){
        if($data['from'] == 1){//图片来源是本地
            //加载自定义的配置文件，给图片的URL加上基地址
            return config('setting.img_prefix').$value;
        }else{
            return $value;
        }
    }
}
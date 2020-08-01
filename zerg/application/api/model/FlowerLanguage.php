<?php


namespace app\api\model;


class FlowerLanguage extends BaseModel
{
    public static function getLanguageByFlower($flower){
        $result = self::where('name','=',$flower)->select();
        return $result;
    }
}
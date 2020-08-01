<?php


namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\FlowerLanguage as FlowerModel;
use think\Exception;

class AllFlowerLanguage extends BaseController
{
    public function getLanguageByFlower($flower=''){
        $result = FlowerModel::getLanguageByFlower($flower);
        if($result->isEmpty()){
            throw new Exception('所查花语不存在','60002');
        }
        $result->hidden(['id','name'])
            ->toArray();
        return $result;
    }
}
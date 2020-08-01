<?php


namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\ProductStory as StoryModel;
use app\api\Validate\Count;
use app\api\Validate\IdMustBePositiveint;
use think\Exception;

class Story extends BaseController
{
    public function getRecentStory($count=3){
        (new Count())->goCheck();
        $recent = StoryModel::getMostRecentStory($count);
        if($recent->isEmpty()){
            throw new Exception('暂无信息');
        }
        $res = $recent->hidden(['paragraph2','paragraph3','paragraph4']);
        return $res;
    }
    public function getStorDetail($id){
        (new IdMustBePositiveint())->goCheck();
        $res = StoryModel::getStoryDetail($id);
        if(!$res){
            throw new Exception('暂无信息');
        }
        return $res;
    }

    public function getAllStory(){
        $all = StoryModel::getAllStory();
        if(!$all){
            throw new Exception('暂无信息');
        }
        $res = $all->hidden(['paragraph2','paragraph3','paragraph4']);
        return $res;
    }
}
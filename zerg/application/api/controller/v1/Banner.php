<?php


namespace app\api\controller\v1;
use app\api\Validate\IdMustBePositiveint;
use app\api\model\Banner as BannerModel;
use app\lib\exception\BannerMissException;
use think\Exception;

class Banner
{
    /**
     * 获取指定id的banner信息
     * @http GET
     * @url banner/:id
     * @id banner的id号
     *
     */
    public function getBanner($id)
    {
        (new IdMustBePositiveint())->goCheck();
        $banner = BannerModel::getBannerById($id);
        if(!$banner){
            throw new BannerMissException();
        }
        return $banner;
    }
}
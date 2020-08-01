<?php


namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\Image as ImageModel;
use app\api\model\Product as ProductModel;
use app\lib\exception\SuccessMessage;
use app\api\model\ProductImage as DetailImageModel;
use app\api\model\ProductPest as PestModel;
use app\api\model\ProductProperty as PropertyModel;
use app\api\model\ProductWorth as WorthModel;




class AdminDelete extends BaseController
{
//    删除图片
    public function deleteImg(){
        $id = input('post.id');
        ImageModel::destroy($id);
        return json(new SuccessMessage(),201);
    }
    //删除植物
    public function deletePlant(){
        $id = input('post.id');
        ProductModel::destroy($id);
        return json(new SuccessMessage(),201);
    }

    //删除植物详情图片
    public function deleteDetail(){
        $id = input('post.id');
        DetailImageModel::destroy($id);
        return json(new SuccessMessage(),201);
    }

    //删除植物病虫害
    public function deletePest(){
        $id = input('post.id');
        PestModel::destroy($id);
        return json(new SuccessMessage(),201);
    }

    //删除植物的属性
    public function deleteProperty(){
        $id = input('post.id');
        PropertyModel::destroy($id);
        return json(new SuccessMessage(),201);
    }

    //删除植物价值
    public function deleteWorth(){
        $id = input('post.id');
        WorthModel::destroy($id);
        return json(new SuccessMessage(),201);
    }
}
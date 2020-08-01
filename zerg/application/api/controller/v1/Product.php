<?php


namespace app\api\controller\v1;


use app\api\Validate\Count;
use app\api\model\Product as ProductModel;
use app\api\Validate\IdCollection;
use app\api\Validate\IdMustBePositiveint;
use app\lib\exception\ProductException;

class Product
{
    public function getHot($count=6){
        (new Count())->goCheck();
        $recent = ProductModel::getMostHotProduct($count);
        if($recent->isEmpty()){
            throw new ProductException();
        }
        return $recent;
    }

    public function getOne($id){
        (new IdMustBePositiveint())->goCheck();
        $product = ProductModel::getOneDetail($id);
        if(!$product){
            throw new ProductException();
        }
        return $product;
    }

    public function getSimpleList($ids=''){
        (new IdCollection())->goCheck();
        $ids = explode(',',$ids);
        $likeList = ProductModel::getLikeList($ids);
        if($likeList->isEmpty()){
            throw new ProductException();
        }
        $res = $likeList->hidden(['from','summary','img_id','price','star','stock','category_id']);
        return $res;
    }

}
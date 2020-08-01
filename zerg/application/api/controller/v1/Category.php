<?php


namespace app\api\controller\v1;
use app\api\model\Category as CategoryModel;
use app\api\Validate\IdMustBePositiveint;
use app\lib\exception\CategoryException;
use app\lib\exception\ProductException;

class Category
{
    public function getAllCategories(){
        $categories = CategoryModel::getCategories();
        if($categories->isEmpty()){
            throw new CategoryException();
        }
        return $categories;
}

    public function getCategoryProduct($id){
        (new IdMustBePositiveint())->goCheck();
        $categoryProducts = CategoryModel::getCategoryProducts($id);
        if(!$categoryProducts){
            throw new ProductException();
        }
        return $categoryProducts;
    }
}
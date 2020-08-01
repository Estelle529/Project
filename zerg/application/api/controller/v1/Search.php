<?php


namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\ProductProperty;
use app\api\Validate\KeyWordCollection;
use think\Db;

class Search extends BaseController
{
    public function getSearchByKey($key = ''){
        $res1=Db('product')->where('name|flower_language','LIKE',"%$key%")->select();
        $res2=Db('product_breeding')->where('detail','LIKE',"%$key%")->select();
        $res3=Db('product_pest')->where('detail','LIKE',"%$key%")->select();
        $res4=Db('product_property')->where('detail','LIKE',"%$key%")->select();
        $res5=Db('product_worth')->where('detail','LIKE',"%$key%")->select();
        $total = [
            'res1'=>$res1,
            'res2'=>$res2,
            'res3'=>$res3,
            'res4'=>$res4,
            'res5'=>$res5,
        ];
        return $total;
    }
}
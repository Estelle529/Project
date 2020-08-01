<?php


namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\ProductMisundstand;
use app\api\Validate\PagingParameter;

class Misund extends BaseController
{
    public function getPageMis($pageIndex,$size = 3){
        (new PagingParameter())->goCheck();
        $pagingOrders = ProductMisundstand::getMisData($pageIndex,$size);
        if($pagingOrders->isEmpty()){
            return [
                'data'=>[],
                'currentPage'=>$pageIndex
            ];
        }
        return $pagingOrders;
    }
}
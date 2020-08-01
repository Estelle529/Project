<?php


namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\Validate\PagingParameter;
use app\api\model\Product as ProductModel;
use app\api\model\Image as ImageModel;
use app\api\model\ProductImage as DetailImageModel;
use app\api\model\ProductPest as PestModel;
use app\api\model\ProductProperty as PropertyModel;
use app\api\model\ProductWorth as WorthModel;




class AdminPlants extends BaseController
{
    //分页获取植物信息
    public function superGetProduct($pageIndex,$size = 10){
        (new PagingParameter())->goCheck();
        $result = ProductModel::superPageProduct($pageIndex,$size);
        if(!$result){
            return [
                'data'=>[],
                'currentPage'=>$pageIndex
            ];
        }
        $data = $result['data']->hidden(['delete_time','create_time','update_time','summary'])
            ->toArray();
        return [
            'data'=>$data,
            'currentPage'=>$pageIndex,
            'total'=>$result['total']
        ];
    }
    //分页获取图片信息
    public function superGetImg($pageIndex,$size = 10){
        (new PagingParameter())->goCheck();
        $result = ImageModel::superPageImg($pageIndex,$size);
        if(!$result){
            return [
                'data'=>[],
                'currentPage'=>$pageIndex
            ];
        }
        $data = $result['data']->hidden(['delete_time','update_time'])
            ->toArray();
        return [
            'data'=>$data,
            'currentPage'=>$pageIndex,
            'total'=>$result['total']
        ];
    }

    //分页获取植物详细图片信息
    public function superGetDetailImg($pageIndex,$size = 10){
        (new PagingParameter())->goCheck();
        $result = DetailImageModel::superPageDetailImg($pageIndex,$size);
        if(!$result){
            return [
                'data'=>[],
                'currentPage'=>$pageIndex
            ];
        }
        $data = $result['data']->hidden(['delete_time','order'])
            ->toArray();
        return [
            'data'=>$data,
            'currentPage'=>$pageIndex,
            'total'=>$result['total']
        ];
    }

    //分页获取植物病虫害
    public function superGetPest($pageIndex,$size = 10){
        (new PagingParameter())->goCheck();
        $result = PestModel::superPagePest($pageIndex,$size);
        if(!$result){
            return [
                'data'=>[],
                'currentPage'=>$pageIndex
            ];
        }
        $data = $result['data']->hidden(['delete_time','update_time'])
            ->toArray();
        return [
            'data'=>$data,
            'currentPage'=>$pageIndex,
            'total'=>$result['total']
        ];
    }


    //分页获取植物属性
    public function superGetProperty($pageIndex,$size = 10){
        (new PagingParameter())->goCheck();
        $result = PropertyModel::superPageProperty($pageIndex,$size);
        if(!$result){
            return [
                'data'=>[],
                'currentPage'=>$pageIndex
            ];
        }
        $data = $result['data']->hidden(['delete_time','update_time'])
            ->toArray();
        return [
            'data'=>$data,
            'currentPage'=>$pageIndex,
            'total'=>$result['total']
        ];
    }

    //分页获取植物价值
    public function superGetWorth($pageIndex,$size = 10){
        (new PagingParameter())->goCheck();
        $result = WorthModel::superPageWorth($pageIndex,$size);
        if(!$result){
            return [
                'data'=>[],
                'currentPage'=>$pageIndex
            ];
        }
        $data = $result['data']->hidden(['delete_time','update_time'])
            ->toArray();
        return [
            'data'=>$data,
            'currentPage'=>$pageIndex,
            'total'=>$result['total']
        ];
    }

}
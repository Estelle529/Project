<?php


namespace app\api\Validate;


use app\lib\exception\ParamateException;
use think\Exception;

class OrderPlace extends BaseValidate
{
    protected $rule = [
      'products'=>'checkProducts'
    ];
    protected $singleRule = [
        'product_id'=>'require|IsPositveInteger',
        'count'=>'require|IsPositveInteger'
    ];
    protected function checkProducts($values){
        if(!is_array($values)){
            throw new ParamateException([
                'msg'=>'商品参数不正确'
            ]);
        }
        if(empty($values)){
            throw new ParamateException([
                'msg'=>'商品列表不能为空'
            ]);
        }
        foreach ($values as $value){
            $this->checkProduct($value);
        }
        return true;
    }
    protected function checkProduct($value){
        $validate = new BaseValidate($this->singleRule);
        $result = $validate->check($value);
        if(!$result){
            throw new ParamateException([
                'msg'=>'商品参数不正确'
            ]);
        }
    }
}
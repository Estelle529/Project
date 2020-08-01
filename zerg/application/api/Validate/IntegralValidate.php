<?php


namespace app\api\Validate;


class IntegralValidate extends BaseValidate
{
    protected $rule = [
        'integral'=> 'require|IsPositveInteger'
    ];
    protected $message = [
        'integral'=>'参数错误'
    ];
}
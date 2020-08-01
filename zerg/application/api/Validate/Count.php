<?php


namespace app\api\Validate;


class Count extends BaseValidate
{
    protected $rule = [
        'count'=>'IsPositveInteger|between:1,15'
    ];
    protected $message = [
        'count'=>'count应该是1到15范围内的正整数'
    ];
}
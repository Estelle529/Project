<?php


namespace app\api\Validate;


class StatusValidate extends BaseValidate
{
    protected $rule = [
        'id'=>'require|IsPositveInteger',
        'status'=>'require|IsPositveInteger'
    ];
}
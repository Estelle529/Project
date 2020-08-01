<?php


namespace app\api\Validate;

class IdMustBePositiveint extends BaseValidate
{
    protected $rule = [
        'id'=> 'require|IsPositveInteger'
    ];
    protected $message = [
        'id'=>'id必须是正整数'
    ];
}
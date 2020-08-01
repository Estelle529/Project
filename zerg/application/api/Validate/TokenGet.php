<?php


namespace app\api\Validate;


class TokenGet extends BaseValidate
{
    protected $rule = [
        'code'=> 'require|isNotEmpty'
    ];
    protected $message = [
        'code'=>'code为空，不能获取Token'
    ];
}
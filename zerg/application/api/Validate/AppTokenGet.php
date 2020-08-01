<?php


namespace app\api\Validate;


class AppTokenGet extends BaseValidate
{
protected $rule = [
    'ac' => 'require|isNotEmpty',
    'se' => 'require|isNotEmpty'
];
}
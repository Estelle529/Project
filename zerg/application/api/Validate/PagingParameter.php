<?php


namespace app\api\Validate;


class PagingParameter extends BaseValidate
{
    protected $rule = [
        'pageIndex'=>'IsPositveInteger',
        'size'=>'IsPositveInteger'
    ];
    protected $message = [
        'pageIndex'=>'分页参数必须是正整数',
        'size'=>'分页参数必须是正整数'
    ];
}
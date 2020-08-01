<?php


namespace app\lib\exception;


class TokenException extends BaseException
{
    public $code = 401;
    public $msg = 'Token已经过期或者无效的Token';
    public $errorCode = 10001;
}
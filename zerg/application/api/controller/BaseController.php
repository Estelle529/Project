<?php


namespace app\api\controller;


use app\api\service\Token as TokenService;
use think\Controller;

class BaseController extends Controller
{
    protected function checkPrimaryScope()
    {
        TokenService::needPrimaryScope();
    }
    public function checkExclusiveScope(){
        TokenService::needExclusiveScope();
    }
}
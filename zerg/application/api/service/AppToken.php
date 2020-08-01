<?php


namespace app\api\service;


use app\api\model\ThirdApp;
use app\lib\exception\TokenException;

class AppToken extends Token
{
    public function  get($ac, $se){
    $app = ThirdApp::check($ac,$se);
        if(!$app){
            throw new TokenException([
                'msg'=>'授权失败',
                'errorCode'=>10004
            ]);
        }else{
            $scope = $app->scope;
            $uid = $app->id;
            $values = [
                'scope' => $scope,
                'uid'=>$uid
            ];
            $token = $this->saveToCache($values);
            return $token;
        }
    }

    private function saveToCache($cachedValue){
        $key = self::generateToken();
        $value = json_encode($cachedValue);
        $expire_in = config('setting.token_expire_in');
        $request = cache($key,$value,$expire_in);
        if(!$request){
            throw new TokenException([
                'msg'=>'服务器缓存异常',
                'errorCode'=>10005
            ]);
        }
        return $key;
    }
}
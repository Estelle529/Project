<?php


namespace app\api\Validate;
use app\lib\exception\ParamateException;
use think\Exception;
use think\Validate;
use think\Request;

class BaseValidate extends Validate
{
    public function  goCheck(){
        //获取到所有的参数
        $request = Request::instance();
        $params = $request->param();
        //调用validate的check方法进行验证
        //batch()方法进行批量验证
        $result = $this->batch()->check($params);
        if(!$result){
            $e = new ParamateException([
                'msg'=>$this->error,
            ]);
            throw $e;
        }else{
            return true;
        }
    }
    protected function IsPositveInteger($value,$rule='',$data='',$field=''){
        if(is_numeric($value) && is_int($value + 0) && ($value + 0) > 0){
            return true;
        }else{
            return false;
        }
    }
    protected function isNotEmpty($value,$rule='',$data='',$field=''){
        if(empty($value)){
            return false;
        }else{
            return true;
        }
    }
    protected function isMobile($value){
        $rule = '^1(3|4|5|7|8)[0-9]\d{8}$^';
        $result = preg_match($rule,$value);
        if($result){
            return true;
        }else{
            return false;
        }
    }


    //通过规则进行信息过滤
    public function getDataByRule($array){
        //uid是通过令牌获取的，不允许用户从客户端传入
        if(array_key_exists('user_id',$array)|array_key_exists('uid',$array))
        {
            throw new ParamateException([
                'msg'=>'参数中包含有非法的参数名user_id或uid'
            ]);
        }
        $newArray = [];
        foreach ($this->rule as $key => $value){
            $newArray[$key] = $array[$key];
        }
        return $newArray;
    }
}
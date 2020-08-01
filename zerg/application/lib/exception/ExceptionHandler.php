<?php


namespace app\lib\exception;


use Exception;
use think\exception\Handle;
use think\Log;
use think\Request;

class ExceptionHandler extends  Handle
{
    private $code;
    private $msg;
    private $errorCode;
    //还需要返回客户端请求的当前的URL的路径
    public function render(Exception $e)
    {
        if($e instanceof BaseException){
            //如果是自定义的异常
            $this->code = $e->code;
            $this->msg = $e->msg;
            $this->errorCode = $e->errorCode;
        }else{
            //如果app_debug是开着，说明在调试状态，返回默认的render的错误页面给开发者看
            if(config('app_debug')){
                return parent::render($e);
            }else{//否则，说明上线了，返回自定义的错误，给客户端
                $this->code = 500;
                $this->msg = '服务器内部异常,不想告诉你';
                $this->errorCode = 999;
                //把服务器内部异常记录到日志中
                $this->recodeErrorLog($e);
            }
        }
        //拿到当前请求的是实列对象
        $request = Request::instance();
        $result = [
          'msg'=>$this->msg,
          'errorCode'=>$this->errorCode,
          'request_url'=>$request->url()
        ];
        return json($result,$this->code);
    }
    private function recodeErrorLog(Exception $e){
        //初始化config文件
        Log::init([
            'type'=>'File',
            'path'=>LOG_PATH,
            'level'=>['error']
        ]);
        Log::record($e->getMessage(), 'error');
    }
}
<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------


// 定义应用目录
define('APP_PATH', __DIR__ . '/../application/');
//重新定义log path 记录日志的目录  默认的在runtime下的log文件夹里，现在改成zerg下的log文件夹
define('LOG_PATH', __DIR__ . '/../log/');
// 加载框架引导文件
require __DIR__ . '/../thinkphp/start.php';

\think\Log::init([
    'type'=>'File',
    'Path'=>'LOG_PATH',
    'level'=>['sql']
]);
// [ 应用入口文件 ]
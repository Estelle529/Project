<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

//实现动态路由
use think\Route;
Route::get('api/v1/banner/:id','api/v1.Banner/getBanner');


Route::get('api/v1/theme','api/v1.Theme/getSimpleList');
Route::get('api/v1/theme/:id','api/v1.Theme/getComplexOne');


Route::group('api/v1/product',function(){
    Route::get('/:id','api/v1.Product/getOne',[],['id'=>'\d+']);
    Route::get('/hot','api/v1.Product/getHot');
    Route::get('/getLike','api/v1.Product/getSimpleList');
});


Route::group('api/v1/category',function(){
    Route::get('/all','api/v1.Category/getAllCategories');
    Route::get('/:id','api/v1.Category/getCategoryProduct');
});


Route::post('api/v1/token/user','api/v1.Token/getToken');
Route::post('api/v1/token/super','api/v1.Token/getAppToken');
Route::post('api/v1/token/verify','api/v1.Token/verifyToken');


Route::post('api/v1/address','api/v1.Address/createOrUpdateAddress');
Route::get('api/v1/address','api/v1.Address/getUserAddress');


Route::post('api/v1/order','api/v1.Order/placeOrder');
Route::post('api/v1/order/update','api/v1.Order/upDateStatus');
Route::get('api/v1/order/by_user/:pageIndex','api/v1.Order/getSummaryByUser');
Route::get('api/v1/order/by_super/:pageIndex','api/v1.Order/superGetAllOrder');
Route::get('api/v1/order/:id','api/v1.Order/getDetail',[],['id'=>'\d+']);


Route::get('api/v1/integral','api/v1.Integral/getUserIntegral');
Route::post('api/v1/integral','api/v1.Integral/createOrUpdateIntegral');

Route::get('api/v1/search','api/v1.Search/getSearchByKey');

Route::get('api/v1/story/recent','api/v1.Story/getRecentStory');
Route::get('api/v1/story/all','api/v1.Story/getAllStory');
Route::get('api/v1/story/:id','api/v1.Story/getStorDetail',[],['id'=>'\d+']);


Route::get('api/v1/misundstand/:pageIndex','api/v1.Misund/getPageMis');

Route::get('api/v1/language','api/v1.AllFlowerLanguage/getLanguageByFlower');



Route::group('api/v1/admin',function(){
    Route::get('/product/:pageIndex','api/v1.AdminPlants/superGetProduct');
    Route::get('/img/:pageIndex','api/v1.AdminPlants/superGetImg');
    Route::get('/detailImg/:pageIndex','api/v1.AdminPlants/superGetDetailImg');
    Route::get('/pest/:pageIndex','api/v1.AdminPlants/superGetPest');
    Route::get('/property/:pageIndex','api/v1.AdminPlants/superGetProperty');
    Route::get('/worth/:pageIndex','api/v1.AdminPlants/superGetWorth');
});


Route::group('api/v1/delete',function(){
    Route::post('/img','api/v1.AdminDelete/deleteImg');
    Route::post('/product','api/v1.AdminDelete/deletePlant');
    Route::post('/detail','api/v1.AdminDelete/deleteDetail');
    Route::post('/pest','api/v1.AdminDelete/deletePest');
    Route::post('/property','api/v1.AdminDelete/deleteProperty');
    Route::post('/worth','api/v1.AdminDelete/deleteWorth');
});

Route::group('api/v1/create',function(){
    Route::post('/img','api/v1.AdminNew/createImg');
    Route::post('/plant','api/v1.AdminNew/createPlant');
    Route::post('/detail','api/v1.AdminNew/createDetail');
    Route::post('/pest','api/v1.AdminNew/createPest');
    Route::post('/property','api/v1.AdminNew/createProperty');
    Route::post('/worth','api/v1.AdminNew/createWorth');
});







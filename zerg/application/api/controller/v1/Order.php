<?php


namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\Validate\IdMustBePositiveint;
use app\api\Validate\OrderPlace;
use app\api\service\Token as TokenService;
use app\api\service\Order as OrderService;
use app\api\model\Order as OrderModel;
use app\api\Validate\PagingParameter;
use app\api\Validate\StatusValidate;
use app\lib\exception\OrderException;
use app\lib\exception\SuccessMessage;

class Order extends BaseController
{
    //用户在选择商品后，向API提供包含他所选择商品的相关信息
    //API在接收到消息之后，需要检查订单相关商品的库存量
    //有库存，把订单数据存入数据库=下单成功了，返回客户端消息，告诉用户可以支付了
    //调用支付接口进行支付
    //还需要再次进行库存量检测
    //服务器调用微信的支付接口进行支付
    //微信返回支付结果
    //成功：进行库存量的检测
    //成功：对库存量进行扣除  失败：返回一个支付失败的结果
    protected $beforeActionList = [
        'checkExclusiveScope'=>['only'=>'placeOrder'],
        'checkPrimaryScope'=>['only'=>'getSummaryByUser'],
        'checkPrimaryScope'=>['only'=>'getDetail'],
        'checkPrimaryScope'=>['only'=>'upDateStatus']
    ];

    //分页加载用户订单 某一个用户
    public function getSummaryByUser($pageIndex,$size=5){
        (new PagingParameter())->goCheck();
        $uid = TokenService::getCurrentTokenVar('uid');
        $pagingOrders = OrderModel::getSummaryByUser($uid,$pageIndex,$size);
        if($pagingOrders->isEmpty()){
            return [
                'data'=>[],
                'currentPage'=>$pageIndex
            ];
        }
        $data = $pagingOrders->hidden(['snap_items','snap_address','prepay_id'])
            ->toArray();
        return [
            'data'=>$data,
            'currentPage'=>$pageIndex
        ];
    }

    //加载一个订单详细数据
    public function getDetail($id){
        (new IdMustBePositiveint())->goCheck();
        $detail = OrderModel::getDetail($id);
        if(!$detail){
            throw new OrderException();
        }
        return $detail;
    }

    //生成订单
    public function placeOrder(){
        (new OrderPlace())->goCheck();
        $oProducts = input('post.products/a');
        $uid = TokenService::getCurrentTokenVar('uid');
        $order = new OrderService();
        return $order->place($uid,$oProducts);
    }

    //data:{
    //'id':**,
    //'status':**
    //}
    //更新某一个订单状态
    public function upDateStatus(){
        (new StatusValidate())->goCheck();
        $id = input('post.id');
        $status = input('post.status');
        $detail = OrderModel::getDetail($id);
        if(!$detail){
            throw new OrderException();
        }
        $detail->status = $status;
        $detail->save();
        return json(new SuccessMessage(),201);
    }

    //CMS管理员分页加载所有用户的订单
    public function superGetAllOrder($pageIndex,$size = 10){
        (new PagingParameter())->goCheck();
        $pagingOrders = OrderModel::getSummaryBySuper($pageIndex,$size);
        if($pagingOrders->isEmpty()){
            return [
                'data'=>[],
                'currentPage'=>$pageIndex
            ];
        }
        $data = $pagingOrders->hidden(['snap_items','snap_address','prepay_id'])
            ->toArray();
        return [
            'data'=>$data,
            'currentPage'=>$pageIndex
        ];
    }
}
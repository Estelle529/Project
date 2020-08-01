<?php


namespace app\api\service;


use app\api\model\Product;
use app\api\model\Product as ProductModel;
use app\api\model\UserAddress;
use app\lib\exception\OrderException;
use app\lib\exception\ProductException;
use app\lib\exception\UserException;
use app\api\model\Order as OrderModel;
use app\api\model\OrderProduct as OrderProductModel;
use think\Db;
use think\Exception;

class Order
{
    // 商品信息列表，也就是用户从客户端传过来的products参数
    protected $oProducts;
    //真实的商品信息，数据库中的，包括库存量
    protected $products;
    protected $uid;
    public function place($uid,$oProducts){
        // products从数据库中查询出来
        //oProduets和products做对比
        $this->oProducts = $oProducts;
        $this->uid = $uid;
        $this->products = $this->getProductsByOrder($oProducts);
        $status = $this->getOrderStatus();
        if(!$status['pass']){
            $status['order_id'] = -1;
            return $status;
        }
        //如果库存量检测通过，开始创建订单了
        $orderSnap = $this->snapOrder($status);
        $order = $this->createOrder($orderSnap);
        $order['pass'] = true;
        //更新植物的库存量
        $this->updateStock();
        return $order;
    }

    private function updateStock(){
        foreach ($this->oProducts as $oProduct){
            $product = ProductModel::getStock($oProduct["product_id"]);
            if(!$product){
                throw new ProductException();
            }else{//更新库存
                $product->stock = $product->stock - $oProduct["count"];
                $product->save();
            }
        }
    }


    private function createOrder($orderSnap){
        Db::startTrans();//开始事务
        try{
            $orderNo = $this->makeOrderNo();
            $order = new OrderModel();
            $order->user_id = $this->uid;
            $order->order_no = $orderNo;
            $order->total_price = $orderSnap['orderPrice'];
            $order->total_count = $orderSnap['totalCount'];
            $order->snap_img = $orderSnap['snapImg'];
            $order->snap_name = $orderSnap['snapName'];
            $order->snap_address = $orderSnap['snapAddress'];
            $order->snap_items = json_encode($orderSnap['pStatus']);
            $order->save();
            $orderID = $order->id;
            $create_time = $order->create_time;
            foreach ($this->oProducts as &$p){
                $p['order_id'] = $orderID;
            }
            $orderProduct = new OrderProductModel();
            $orderProduct->saveAll($this->oProducts);
            Db::commit();//提交事务
            return [
                'order_no'=>$orderNo,
                'order_id'=>$order->id,
                'create_time'=>$create_time
            ];
        }catch (Exception $ex){
//            Db::rollback();//回滚事务
            throw $ex;
        }
    }

    public static function makeOrderNo(){
        $yCode = array('A','B','C','D','E','F','G','H','I','J');
        $orderSn = $yCode[intval(date('Y')-2020)].
            strtoupper(dechex(date('m'))).date('d')
            .substr(time(),-5).substr(microtime(),2,5)
            .sprintf('%02d',rand(0,99));
        return $orderSn;
    }

    //生成订单快照 保存订单当前的状态
    private function snapOrder($status){
        $snap = [
            'orderPrice'=>0,
            'totalCount'=>0,
            'pStatus'=>[],
            'snapAddress'=>null,
            'snapName'=>'',
            'snapImg'=>''
        ];
        $snap['orderPrice'] = $status['orderPrice'];
        $snap['totalCount'] = $status['totalCount'];
        $snap['pStatus'] = $status['pStatusArray'];
        $snap['snapAddress'] = json_encode($this->getUserAddress());
        $snap['snapName'] = $this->products[0]['name'];
        $snap['snapImg'] = $this->products[0]['main_img_url'];
        if(count($this->products)>1){
            $snap['snapName'] = $this->products[0]['name'].'等';
        }
        return $snap;
    }

    private function getUserAddress(){
        $userAddress = UserAddress::where('user_id','=',$this->uid)->find();
        if(!$userAddress){
            throw new UserException([
               'msg'=>'用户收货地址不存在，下单失败',
               'errorCode'=>60001
            ]);
        }
        return $userAddress->toArray();
    }

    //获取整个订单的状态
    private function getOrderStatus(){
        $status = [
            'pass'=>true,
            'orderPrice'=>0,
            'totalCount'=>0,
            'pStatusArray'=>[] //保存订单里面所有商品的详细信息
        ];
        foreach ($this->oProducts as $oProduct){
            $pStatus = $this->getProductStatus(
                $oProduct['product_id'],$oProduct['count'],$this->products
            );
            if(!$pStatus['haveStock']){
                $status['pass'] = false;
            }
            $status['orderPrice'] += $pStatus['totalPrice'];
            $status['totalCount'] += $pStatus['counts'];
            array_push($status['pStatusArray'],$pStatus);
        }
        return $status;
    }

    //获取到订单里面一个商品的状态
    private function getProductStatus($oPID,$oCount,$products){
        $pIndex = -1;
        $pStatus = [
            'id'=>null,
            'haveStock'=>false,
            'counts'=>0,
            'name'=>'',
            'price'=>0,
            'main_img_url'=>'',
            'totalPrice'=>0
        ];
        for($i=0;$i<count($products);$i++){
            if($oPID == $products[$i]['id']){
                $pIndex = $i;
            }
        }
        if($pIndex == -1){//客户端传递进来的product_id可能是不存在的
            throw new OrderException([
                'msg'=>'id为'.$oPID.'的商品不存在，创建订单失败'
            ]);
        }else{
            $product = $products[$pIndex];
            $pStatus['id'] = $product['id'];
            $pStatus['counts'] = $oCount;
            $pStatus['name'] = $product['name'];
            $pStatus['price'] = $product['price'];
            $pStatus['main_img_url'] = $product['main_img_url'];
            $pStatus['totalPrice'] = $oCount*$product['price'];
            $pStatus['haveStock'] = $product['stock']>=$oCount?true:false;
        }
        return $pStatus;
    }

    //根据订单信息查找真实的商品信息
    private function getProductsByOrder($oProducts){
        $oPIDs = [];//里面存放oProducts里面所有的商品id号
        foreach ($oProducts as $item){
           array_push($oPIDs,$item['product_id']) ;
        }
        //查询到商品之后，只看商品信息里面的部分数据
        $products = Product::all($oPIDs)
            ->visible(['id','price','stock','name','main_img_url'])
            ->toArray();
        return $products;
    }
}
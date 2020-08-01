<?php


namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\lib\exception\SuccessMessage;
use think\Db;
use think\Request;

class AdminNew extends BaseController
{
    public function getParams(){
        $request = Request::instance();
        $request->param();//获取所有参数，最全
        return $request->post();//获取post参数
    }

    //新建或更新图片
    public function createImg(){
        $post = $this->getParams();
        $id =  $post['id'];
        $url =  $post['url'];
        $data = ['id' => $id, 'url' => $url];
        $img = Db::table('image') -> find($id);
        if(!$img){
            //信息不存在，新增
            Db::table('image') -> insert($data);
        }else{
            //更新信息
            Db::table('image')->where('id', $id)->update(['url' => $url]);
        }
        return json(new SuccessMessage(),201);
    }

    //新建植物
    public function createPlant(){
        $post = $this->getParams();
        $data = ['id' => $post['id'],
            'name' => $post['name'],
            'price' => $post['price'],
            'stock' => $post['stock'],
            'category_id' => $post['category'],
            'main_img_url' => $post['url'],
            'img_id' => $post['img_id'],
            'star' => $post['star'],
            'flower_language' => $post['flower_language'] ];
        $plant = Db::table('product')->find($post['id']);
        if(!$plant){
            Db::table('product') -> insert($data);
        }else{
            Db::table('product')->where('id', $post['id'])->update($data);
        }
        return json(new SuccessMessage(),201);
    }

    //新建植物详细信息
    public function createDetail(){
        $post = $this->getParams();
        $id =  $post['id'];
        $img_id =  $post['img_id'];
        $product_id =  $post['product_id'];
        $data = ['id' => $id, 'img_id' => $img_id, 'product_id'=>$product_id];
        $detail = Db::table('product_image')->find($post['id']);
        if(!$detail){
            Db::table('product_image') -> insert($data);
        }else{
            Db::table('product_image')->where('id', $id)->update($data);
        }
        return json(new SuccessMessage(),201);
    }

    //新建植物病虫害信息
    public function createPest(){
        $post = $this->getParams();
        $id =  $post['id'];
        $name =  $post['name'];
        $detail =  $post['detail'];
        $product_id = $post['product_id'];
        $data = ['id' => $id, 'name' => $name, 'detail'=>$detail, 'product_id'=>$product_id];
        $pest = Db::table('product_pest')->find($id);
        if(!$pest){
            Db::table('product_pest') -> insert($data);
        }else{
            Db::table('product_pest')->where('id', $id)->update($data);
        }
        return json(new SuccessMessage(),201);
    }

    //新建植物属性信息
    public function createProperty(){
        $post = $this->getParams();
        $id =  $post['id'];
        $name =  $post['name'];
        $detail =  $post['detail'];
        $product_id = $post['product_id'];
        $data = ['id' => $id, 'name' => $name, 'detail'=>$detail, 'product_id'=>$product_id];
        $property = Db::table('product_property')->find($id);
        if(!$property){
            Db::table('product_property') -> insert($data);
        }else{
            Db::table('product_property')->where('id', $id)->update($data);
        }
        return json(new SuccessMessage(),201);
    }

    //新建植物价值
    public function createWorth(){
        $post = $this->getParams();
        $id =  $post['id'];
        $name =  $post['name'];
        $detail =  $post['detail'];
        $product_id = $post['product_id'];
        $data = ['id' => $id, 'name' => $name, 'detail'=>$detail, 'product_id'=>$product_id];
        $worth = Db::table('product_worth')->find($id);
        if(!$worth){
            Db::table('product_worth') -> insert($data);
        }else{
            Db::table('product_worth')->where('id', $id)->update($data);
        }
        return json(new SuccessMessage(),201);
    }
}
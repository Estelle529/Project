<?php


namespace app\api\model;


use think\db\Query;

class Product extends BaseModel
{
    protected $hidden = ['delete_time','update_time','create_time'];
    public function getMainImgUrlAttr($value,$data){
        return $this->prefixImgUrl($value,$data);
    }
    public function detailImgs(){
        return $this->hasMany('ProductImage','product_id','id');
    }
    public function detailProperty(){
        return $this->hasMany('ProductProperty','product_id','id');
    }
    public function detailBreeding(){
        return $this->hasMany('ProductBreeding','product_id','id');
    }
    public function detailPest(){
        return $this->hasMany('ProductPest','product_id','id');
    }
    public function detailWorth(){
        return $this->hasMany('ProductWorth','product_id','id');
    }
    public static function getMostHotProduct($count){
        $result = self::limit($count)->order('star desc')->select();
        return $result;
    }
    public static function getOneDetail($id){
        $result = self::with([
            'detailImgs'=>function($query){
                $query->with(['detailimgUrl'])->order('order','asc');
            }
        ])//要对product下关联的详情图片进行排序，所以不一样
            ->with(['detailProperty'])
            ->with(['detailBreeding'])
            ->with(['detailPest'])
            ->with(['detailWorth'])
            ->find($id);
        return $result;
    }
    public static  function getLikeList($ids){
        $result = self::select($ids);
        return $result;
    }

    public static function getStock($id){
        //静态调用 复合模型查询
        $result = self::where('id',$id)->find();
        return $result;
    }

    public static function superPageProduct($pageIndex,$size=10){
        $result = self::paginate($size,true,['page'=>$pageIndex]);
        $total = self::count();
        return [
            'data'=>$result,
            'total'=>$total
        ];
    }
}
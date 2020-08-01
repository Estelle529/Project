<?php


namespace app\api\controller\v1;


use app\api\Validate\IdCollection;
use app\api\model\Theme as ThemeModel;
use app\api\Validate\IdMustBePositiveint;
use app\lib\exception\ThemeMissException;

class Theme
{
    /*
     * @url /theme?ids=id1,id2,...
     * @return 一组theme模型
     * */
    public function getSimpleList($ids=''){
        (new IdCollection())->goCheck();
        $ids = explode(',',$ids);
        $themeList = ThemeModel::getThemeListById($ids);
        if($themeList->isEmpty()){
            throw new ThemeMissException();
        }
        return $themeList;
    }
    /*
     * @url /theme/:id
     * @return
     * */
    public function getComplexOne($id){
        (new IdMustBePositiveint())->goCheck();
        $themeWithproducts = ThemeModel::getThemeWithProducts($id);
        if(!$themeWithproducts){
            throw new ThemeMissException();
        }
        return $themeWithproducts;
    }
}
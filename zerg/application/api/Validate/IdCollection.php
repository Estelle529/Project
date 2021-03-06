<?php


namespace app\api\Validate;


class IdCollection extends BaseValidate
{
    protected $rule = [
        'ids'=>'require|checkIDs'
    ];
    protected $message = [
        'ids'=>'ids必须是以逗号分隔的正整数'
    ];
    protected function checkIDs($value){
        $values = explode(',',$value);
        if(empty($values)){
            return false;
        }
        foreach ($values as $id){
            if(!$this->IsPositveInteger($id)){
                return false;
            }
        }
        return true;
    }
}
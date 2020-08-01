<?php


namespace app\api\model;


class UserAddress extends BaseModel
{
    protected $hidden = ['delete_time'];
    protected $autoWriteTimestamp = true;
}
<?php
namespace Admin\Model;
use Think\Model;
class TagModel extends Model{
    public static function I(){
        return new TagModel();
    }
    
    public function delTag($tid){
        $this->delete($tid);
    }
    
    public function getTag($p){
        !is_array($p) && $p['id'] = $p;
        return $this->where($p)->find();
    }
}
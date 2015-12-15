<?php
namespace Home\Model;
use Think\Model;
class TopicModel extends Model{
    public static function I(){
        return new TopicModel();
    }
    
    public function delTopic($tid){
        $this->delete($tid);
    }
    
    public function getTopic($p){
        !is_array($p) && $p['tid'] = $p;
        return $this->where($p)->find();
    }

    public function getName($id)
    {
        $topic = $this->find($id);
        return $topic['name'];
    }
}
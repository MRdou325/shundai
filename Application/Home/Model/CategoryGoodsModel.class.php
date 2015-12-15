<?php
namespace Home\Model;
use Think\Model;
class CategoryGoodsModel extends Model{
   
    
    public function delCategory($category_id){
        $this->delete($category_id);
    }
    
    public function getGoodsCategory($state=1){
        $where = "type=1 "; 
        $where .= $state?" and status='1'":"1";
        return $this->where($where)->select();
    }
    
    public function getArticleCategory($state=1){
        $where = "type=2 ";
        $where .= $state?" and state='1'":"1";
        return $this->where($where)->select();
    }
    
    public function getName($category_id){
        $category = $this->find($category_id);
        return $category['category_name'];
    }

    public function getChild($category_id){
        $cid = $category_id;
        $category = $this->where(array("p_id" => $category_id))->select();
        foreach ($category as $v) {
            $cid .= "," . $this->getChild($v["id"]);
        }
        return $cid;
    }

    public function getCategoryList($category_id,$level){
        $categoryarr = array();
        $category = $this->where(array("p_id" => $category_id,"status" => 1))->order('sort ASC')->select();
        foreach ($category as $v) {
            $v["level"] = $level;
            $categoryarr[] = $v;
            $categoryarr = array_merge($categoryarr, $this->getCategoryList($v["id"],$level+1));
        }
        return $categoryarr;
    }

    public function getCategoryChildList($category_id,$level){
        $categoryarr = array();
        $category = $this->where(array("p_id" => $category_id,"status" => 1))->order('sort ASC')->select();
        foreach ($category as $v) {
            $v["level"] = $level;
            $v["child"] = $this->getCategoryChildList($v["id"],$level+1);
            $categoryarr[] = $v;
        }
        return $categoryarr;
    }
}
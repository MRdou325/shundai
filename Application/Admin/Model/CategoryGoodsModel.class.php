<?php
namespace Admin\Model;
use Think\Model;
class CategoryGoodsModel extends Model{
 
    
    public function delCategory($category_id){
        $this->delete($category_id);
    }
    
    public function getGoodsCategory($status=1){
      
        $where .= $status?" status='1'":"1";
      
        $res = $this->where($where)->order('p_id,sort')->select();
      
        return $res;
    }
    
    public function getCategoryList($category_id = 0,$level = 1){
        $categoryarr = array();
        $category = $this->where(array("p_id" => $category_id,"status" => 1))->order('sort ASC')->select();
        foreach ($category as $v) {
            $v["level"] = $level;
            $categoryarr[] = $v;
            $categoryarr = array_merge($categoryarr, $this->getCategoryList($v["id"],$level+1));
        }
        return $categoryarr;
    }
    
    public function getName($category_id){
        $category = $this->find($category_id);
        return $category['category_name'];
    }
}
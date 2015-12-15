<?php
namespace Home\Model;
use Think\Model;
class CategoryModel extends Model{
    public static function I(){
        return new CategoryModel();
    }
    
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
}
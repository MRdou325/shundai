<?php
namespace Admin\Model;
use Think\Model;
class BannerModel extends Model{
    // protected $tableName = 'banner'; 
    
    public function delBanner($Banner_id){
        $this->delete($Banner_id);
    }
    
    public function getGoodsCategory($status=1){
      
        $where .= $status?" status='1'":"1";
      
        $res = $this->where($where)->order('p_id,sort')->select();
      
        return $res;
    }
    
   
    
    public function getName($category_id){
        $category = $this->find($category_id);
        return $category['category_name'];
    }
}
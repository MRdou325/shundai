<?php
namespace Admin\Model;
use Think\Model;
class OrdersModel extends Model{
    // protected $tableName = 'banner'; 
    
    public function delOrders($id){
        $this->delete($id);
    }

    public function orderList($Page){
    	$data = $this->order('createtime')->limit($Page->firstRow.','.$Page->listRows)->select();
    	$list = array();
    	if($data && is_array($data)){
            foreach ($data as $value) {
            	$value["status_name"] = M('orders_status')->where(array("id"=>$value["status"]))->getField("name");
                $list[] = $value;
            }
        }
        return $list;
    }
}
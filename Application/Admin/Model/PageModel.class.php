<?php
namespace Admin\Model;
use Think\Model;
class PageModel extends Model{
    // protected $tableName = 'banner'; 
    
    public function delPage($id){
        $this->delete($id);
    }
}
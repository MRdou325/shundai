<?php
namespace Admin\Controller;


use Admin\Model\OrdersModel;
class OrdersController extends AdminController
{
    public function index(){
        $order = M('orders');
        
        $count      = $order->count();
        $Page       = new \Think\Page($count,25);
        $show       = $Page->show();
        $OrdersModel = new OrdersModel();
        $list = $OrdersModel->orderList($Page);
        // $list = $order->order('createtime')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);
        $this->assign('page',$show);
        $this->display();
    }
    
    public function status($id){
         $status = I("status");
        //$orders = M('orders')->find($id);
        M('orders')->where("id='{$id}'")->save(array('status'=>$status));
        $this->success('操作成功',U('index'));
    }
    public function del($id){
        D('orders')->delOrders($id);
        $this->success('删除成功',U('index'));
    }
    public function edit(){
       
        $id = I('id');
        if (IS_POST) {
            $p = $_POST;
            if ($id) {
                M('page')->where("id='{$id}'")->save($p);
                $this->success('修改成功',U('index'));
            }
        
            M('page')->add($p);
            $this->success('添加成功',U('index'));
        }
        $this->assign('id', $id);
        $id && $this->assign('orders',M('orders')->find($id));
        $this->assign("statuslist",M('orders_status')->where(array("status"=>1))->order("sort")->select());
        $this->display();
    }

    public function orderStatus()
    {
        $list = M('orders_status')->order("sort")->select();
        $this->assign("list",$list);
        $this->display();
    }

    public function delstatus($id)
    {
        M('orders_status')->delete($id);
        $this->success('删除成功',U('orderStatus'));
    }

    public function editstatus($id){
        $orders_status = M('orders_status')->find($id);
        M('orders_status')->where("id='{$id}'")->save(array('status'=>$orders_status['status']==1?0:1));
        $this->success('操作成功',U('orderStatus'));
    }

    public function addstatus(){
        $id = I('id');
        if (IS_POST) {
            $p = $_POST;
            if ($id) {
                M('orders_status')->where("id='{$id}'")->save($p);
                $this->success('修改成功',U('orderStatus'));
            }
        
            M('orders_status')->add($p);
            $this->success('添加成功',U('orderStatus'));
        }
        $this->assign('id', $id);
        $id && $this->assign('status',M('orders_status')->find($id));
        $this->display();
    }
}

?>
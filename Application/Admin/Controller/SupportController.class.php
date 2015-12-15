<?php
namespace Admin\Controller;

class SupportController extends AdminController
{
    public function index(){
        $List = M('support')->order('`sort` desc,id desc')->select();
       
        $this->assign('List', $List);
      
        $this->display();
    }
    
    public function status($id){
         
        $support = M('support')->find($id);
        M('support')->where("id='{$id}'")->save(array('status'=>$support['status']==1?0:1));
        $this->success('操作成功',U('index'));
    }
    public function del($id){
        M('support')->delete($id);
        $this->success('删除成功',U('index'));
    }
    public function add(){
       
        $id = I('id');
        if (IS_POST) {
            $p = $_POST;
            if ($id) {
                M('support')->where("id='{$id}'")->save($p);
                $this->success('修改成功',U('index'));
            }
        
            M('support')->add($p);
            $this->success('添加成功',U('index'));
        }
        $this->assign('id', $id);
        $id && $this->assign('support',M('support')->find($id));
        $this->display();
    }
}

?>
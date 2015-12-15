<?php
namespace Admin\Controller;


use Admin\Model\PageModel;
class PageController extends AdminController
{
    public function index(){

        $PageModel = new PageModel();
        $pageList = $PageModel->order('`sort` desc,id desc')->select();
       
        $this->assign('pageList', $pageList);
      
        $this->display();
    }
    
    public function status($id){
         
        $page = M('page')->find($id);
        M('page')->where("id='{$id}'")->save(array('status'=>$page['status']==1?0:1));
        $this->success('操作成功',U('index'));
    }
    public function del($id){
        D('page')->delPage($id);
        $this->success('删除成功',U('index'));
    }
    public function add(){
       
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
        $id && $this->assign('page',M('page')->find($id));
        $this->display();
    }
}

?>
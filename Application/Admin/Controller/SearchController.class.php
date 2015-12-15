<?php
namespace Admin\Controller;

class SearchController extends AdminController
{
    public function index(){

        $List = M('search_keyword')->order('times desc,isshow desc')->select();
       
        $this->assign('List', $List);
      
        $this->display();
    }
    
    public function show($id){
         
        $page = M('search_keyword')->find($id);
        M('search_keyword')->where("id='{$id}'")->save(array('isshow'=>$page['isshow']==1?0:1));
        $this->success('操作成功',U('index'));
    }
    public function del($id){
        M('search_keyword')->delete($id);
        $this->success('删除成功',U('index'));
    }
    public function add(){
       
        $id = I('id');
        if (IS_POST) {
            $p = $_POST;
            if ($id) {
                M('search_keyword')->where("id='{$id}'")->save($p);
                $this->success('修改成功',U('index'));
            }
        
            M('search_keyword')->add($p);
            $this->success('添加成功',U('index'));
        }
        $this->assign('id', $id);
        $id && $this->assign('search',M('search_keyword')->find($id));
        $this->display();
    }
}

?>
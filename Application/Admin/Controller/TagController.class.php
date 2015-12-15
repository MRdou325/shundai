<?php
namespace Admin\Controller;


use Admin\Model\TagModel;
class TagController extends AdminController
{
    public function index(){
        $TagModel = new TagModel();
        $TagModel = $TagModel->order('`sort` desc,id desc')->select();

        $this->assign('TagModel', $TagModel);
      
        $this->display();
    }
    
    public function status($id){
         
        $tag = M('tag')->find($id);
        M('tag')->where("id='{$id}'")->save(array('status'=>$tag['status']==1?0:1));
        $this->success('操作成功',U('index'));
    }
    public function del($id){
        D('tag')->delTag($id);
        $this->success('删除成功',U('index'));
    }
    public function add(){
       
        $id = I('id');
        if (IS_POST) {
            $p['name'] = I('name');
            $p['status'] = I('state');
            $p['sort'] = I('order');
            $p["pic_url"] = I('pic_url');
            if ($id) {
                M('tag')->where("id='{$id}'")->save($p);
                $this->success('修改成功');
            }
        
            M('tag')->add($p);
            $this->success('添加成功',U('index'));
        }
        $this->assign('id', $id);
        $id && $this->assign('tag',M('tag')->find($id));
        $this->display();
    }
}

?>
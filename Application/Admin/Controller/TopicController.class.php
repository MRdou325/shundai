<?php
namespace Admin\Controller;


use Admin\Model\TopicModel;
class TopicController extends AdminController
{
    public function index(){
        $TopicModel = new TopicModel();
        $TopicModel = $TopicModel->order('`sort` desc,tid desc')->select();

        $this->assign('TopicModel', $TopicModel);
      
        $this->display();
    }
    
    public function status($id){
         
        $category = M('topic')->find($id);
        M('topic')->where("tid='{$id}'")->save(array('state'=>$category['state']==1?0:1));
        $this->success('操作成功',U('index'));
    }
    public function del($id){
        D('topic')->delTopic($id);
        $this->success('删除成功',U('index'));
    }
    public function add(){
       
        $id = I('id');
        if (IS_POST) {
            $p['name'] = I('name');
            $p['state'] = I('state');
            $p['sort'] = I('order');
            if ($id) {
                M('topic')->where("tid='{$id}'")->save($p);
                $this->success('修改成功');
            }
        
            M('topic')->add($p);
            $this->success('添加成功',U('add'));
        }
        $this->assign('id', $id);
        $id && $this->assign('topic',M('topic')->find($id));
        $this->display();
    }
}

?>
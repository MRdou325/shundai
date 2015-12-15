<?php
namespace Admin\Controller;


use Admin\Model\FriendLinkModel;
class FriendLinkController extends AdminController
{
    public function index(){

        $FriendLinkModel = new FriendLinkModel();
        $FriendLinkList = $FriendLinkModel->order('`sort` desc,aid desc')->select();
       
        $this->assign('FriendLinkList', $FriendLinkList);
      
        $this->display();
    }
    
    public function status($id){
         
        $FriendLink = M('friendlink')->find($id);
        M('friendlink')->where("aid='{$id}'")->save(array('state'=>$FriendLink['state']==1?0:1));
        $this->success('操作成功',U('index'));
    }
    public function del($id){
        D('friendlink')->delFriendLink($id);
        $this->success('删除成功',U('index'));
    }
    public function add(){
       
        $id = I('id');
        if (IS_POST) {
            $p = $_POST;
            if ($id) {
                M('friendlink')->where("aid='{$id}'")->save($p);
                $this->success('修改成功',U('index'));
            }
        
            M('friendlink')->add($p);
            $this->success('添加成功',U('index'));
        }
        $this->assign('aid', $id);
        $id && $this->assign('FriendLink',M('friendlink')->find($id));
        $this->display();
    }
}

?>
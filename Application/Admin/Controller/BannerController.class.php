<?php
namespace Admin\Controller;


use Admin\Model\BannerModel;
class BannerController extends AdminController
{
    public function index(){

        $BannerModel = new BannerModel();
        $bannerList = $BannerModel->order('`sort` desc,id desc')->select();
       
        $this->assign('bannerList', $bannerList);
      
        $this->display();
    }
    
    public function status($id){
         
        $Banner = M('Banner')->find($id);
        M('Banner')->where("id='{$id}'")->save(array('status'=>$Banner['status']==1?0:1));
        $this->success('操作成功',U('index'));
    }
    public function del($id){
        D('Banner')->delBanner($id);
        $this->success('删除成功',U('index'));
    }
    public function add(){
       
        $id = I('id');
        if (IS_POST) {
            $p = $_POST;
            if ($id) {
                M('Banner')->where("id='{$id}'")->save($p);
                $this->success('修改成功',U('index'));
            }
        
            M('Banner')->add($p);
            $this->success('添加成功',U('index'));
        }
        $this->assign('id', $id);
        $id && $this->assign('banner',M('Banner')->find($id));
        $this->display();
    }
}

?>
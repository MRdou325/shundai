<?php
namespace Home\Controller;
use Home\Model\CategoryGoodsModel;
class PageController extends HomeController{
    public function index(){
        $where["status"] = 1;
        if(I('id')){
            $where['id'] = I('id');
            $page = M('page')->where($where)->find();
        }
        else
        {
            $page = M('page')->where($where)->select();
        }

        if(!$page) $this->error ('栏目不存在');
        $CategoryModel = new CategoryGoodsModel();
        $this->assign('id',I('id'));
        $this->assign('page',$page);
        $this->assign("CategoryList",$CategoryModel->getCategoryList(0,1));
        $this->display();
    }
}
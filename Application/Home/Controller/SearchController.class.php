<?php
namespace Home\Controller;
use Home\Model\GoodsModel;
use Home\Model\CategoryGoodsModel;
class SearchController extends HomeController{
    public function __construct() {
        parent::__construct();
    }
    public function index(){
        $CategoryModel = new CategoryGoodsModel();
        $keywords = I('post.keywords') ? I('post.keywords'):I('get.keywords');
        if(empty($keywords)){
            $this->error ('请输入搜索的关键词');
        }
        $search = M('search_keyword')->where(array("name"=>$keywords))->find();
        if($search)
        {
            M('search_keyword')->save(array("id"=>$search["id"],"times"=>($search["id"] + 1)));
        }
        else
        {
            M('search_keyword')->add(array("name"=>$keywords,"times"=>1));
        }
        $where['title'] = array('like',"%".$keywords."%");
        $GoodsModel = new GoodsModel();
        $count = $GoodsModel->where($where)->count();
        $once = 20;
        $Page = $this->iniPage($count,$once);
        $result = $GoodsModel->getGoodsList($Page, $where);
        $totalPage = ceil($GoodsModel->where($where)->count()/$once);
        $this->assign("CategoryList",$CategoryModel->getCategoryList(0,1));
        $this->assign('goods',$result);
        $this->assign('keyword',$keywords);
        $this->assign('totalPage',$totalPage);
        if(IS_AJAX){
            $page = I('get.p','','intval');
            $this->assign('page',$page+1);
            $this->display('ajgetgoods');
        }else{
           $this->display(); 
        }
        
    }
}
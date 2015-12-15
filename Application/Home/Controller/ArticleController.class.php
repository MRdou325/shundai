<?php
namespace Home\Controller;
class ArticleController extends HomeController {
    public function artList(){
        // $sort_id = ggp('id:i'); 
        // $this->assign('sort_id',$sort_id);
        // $where = "sort_id='{$sort_id}' and state=1";
        // $count = M('document')->where($where)->count();
        // $listRows = 10;
        // $totalPage = ceil($count/$listRows);
        // $this->assign('totalpage',$totalPage);
        
        // $page = $this->iniPage($count,$listRows);
        // $artList = M('document')->where($where)->limit("{$page->firstRow},{$page->listRows}")->select();
        // $this->assign('artList',$artList);
        // $this->assign('nowpage',ggp('p:i'));
        // $this->display(ggp('ajax')?'ajaxartlist':'');
        // $category = M('category')->find(I('cid'));
        $category = M('category')->where(array('status'=>1))->select();
        $category_name = M('category')->field('title')->find(I('cid'));
        $where['status'] = 1;
        $where['category_id'] = I('cid');
        $once = C('LIST_ROWS');
        $count = M('document')->where($where)->count();
        $Page = new \Think\Page($count,$once);
        $show = $Page->show();
        $document = M('document')->where($where)->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign("category_name", $category_name);
        $this->assign("category", $category);
        $this->assign("document", $document);
        $this->assign('page',$show);
        $this->display();
    }
    
    public function detail(){
        // $aid = ggp('aid:i');
        // $detail = ArticleModel::I()->find($aid);
        // $sort = D('Sort')->find($detail['sort_id']);
        // $this->assign('$sort',$sort);
        // $this->assign('$detail',$detail);
        $category = M('category')->where(array('status'=>1))->select();
        $document = M()->table(array(C('DB_PREFIX') . 'document' =>'d', C('DB_PREFIX') . 'document_article' => 'da'))->where('d.id = da.id')->where(array('d.id' => I('id')))->find();
        $this->assign("document", $document);
        $this->assign("category", $category);
        $this->display();
    }
}
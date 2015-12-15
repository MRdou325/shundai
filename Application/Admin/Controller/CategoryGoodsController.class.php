<?php
namespace Admin\Controller;


use Admin\Model\CategoryGoodsModel;
class CategoryGoodsController extends AdminController
{
    public function index(){
        $id = I('id',0);
        $where = array(
            'p_id' => $id,
            
        );
        $CategoryGoodsModel = new CategoryGoodsModel();
        $categoryList = $CategoryGoodsModel->where($where)->order('`sort` desc,id desc')->select();
       
        $this->assign('categoryList', $categoryList);
      
        $this->display();
    }
    
    public function status($id){
         
        $category = M('CategoryGoods')->find($id);
        M('CategoryGoods')->where("id='{$id}'")->save(array('status'=>$category['status']==1?0:1));
        $this->success('操作成功',U('index'));
    }
    public function del($id){
        D('CategoryGoods')->delCategory($id);
        M('Goods')->where("cate_id='{$id}'")->delete();
        $this->success('删除成功',U('index'));
    }
    public function add(){
       
        $id = I('id');
        $p_id = I('p_id');
        if (IS_POST) {
            $p['category_name'] = I('category_name');
            $p['status'] = I('state');
            $p['sort'] = I('order');
            $p['is_home'] = I('is_home');
            $p['home_num'] = I('home_num');
            $p['ad_url'] = I('ad_url');
            $p['catepic_url'] = I('catepic_url');
            $p['color'] = I('color');
            $p['istravel'] = I('istravel');
            if ($id) {
                M('CategoryGoods')->where("id='{$id}'")->save($p);
                $this->success('修改成功');
            }
        
            $p['p_id'] = I('p_id');
          
            if ($p['p_id']) {
                $category = M('CategoryGoods')->where("id='{$p['p_id']}'")->find();
                !$category && $this->error('没有上级栏目');
             
            }
            M('CategoryGoods')->add($p);
            $this->success('添加成功',U('add'));
        }
        $this->assign('id', $id);
        $this->assign('p_id', $p_id);
        $id && $this->assign('category',M('CategoryGoods')->find($id));
        $this->display();
    }

    public function checkChild($id){
        $where = array(
            'p_id' => $id,
            
        );
        $CategoryGoodsModel = new CategoryGoodsModel();
        $categoryList = $CategoryGoodsModel->where($where)->order('`sort` desc,id desc')->select();
        $this->ajaxReturn($categoryList);
    }
}

?>
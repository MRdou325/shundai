<?php
namespace Home\Controller;
use Home\Model\GoodsModel;
use Home\Model\CategoryGoodsModel;
use Home\Model\TopicModel;
class GoodsController extends HomeController{
    public function cate(){
        $where['id'] = I('id');
        $CategoryModel = new CategoryGoodsModel();
      
        $cate = $CategoryModel->where($where)->find();
        if(!$cate) $this->error ('栏目不存在');
        $cates = $CategoryModel->where(array("p_id" => I('id')))->select();
        if($cates){
            $goods = array();
            $goodsdb = M('goods');
            foreach ($cates as $key => $value) {
                $cids = $CategoryModel->getChild($value["id"]);
                $value["goods"] = $goodsdb->where("status = 1 and cate_id in (" . $cids . ")")->limit("4")->select();
                $goods[] = $value;
            }
            $this->assign("iscate",1);
        }else{
            $goodsdb = M('goods');
            $GoodsModel = new GoodsModel();
            unset($where);
            $where['cate_id'] = I('get.id','','intval');
            $where['status'] = 1;
            $once = 10;
            $count = M('goods')->where($where)->count();
            $Page = new \Think\Page($count,$once);
            $show = $Page->show();
            $GoodsModel = new GoodsModel();
            $goods = $GoodsModel->getGoodsList($Page,$where);
            $this->assign("iscate",2);
            $this->assign('page',$show);
        }
        
        $this->assign('goods',$goods);
        $this->assign('cate',$cate);
        $this->assign("CategoryList",$CategoryModel->getCategoryList(0,1));
       
        $this->display();
    }
    
    public function info(){
        $id = I('get.id','','intval');
        
        $goods = D('Goods')->info($id);
        $do = I('get.add');
        if($do)
        {
            $p["goods_id"] = $id;
            $p["goods_name"] = $goods["title"];
            $p["price"] = $goods["price"];
            $p["discount_price"] = $goods["discount_price"];
            $p["child_price"] = $goods["child_price"];
            $p["num"] = I("num",1,'intval');
            $p["child"] = I("child",0,'intval');
            $p["date"] = I("time");
            $p["name"] = I("name");
            $p["userid"] = UID;
            $p["tel"] = I("tel");
            $p["email"] = I("email");
            $p["address"] = I("address");
            $p["content"] = I("desc");
            $p["status"] = 1;
            $p["createtime"] = date("Y-m-d H:i:s");
            if(M('orders')->add($p))
            {
                $msg = "恭喜您，报名成功！我们会尽快安排人联系您";
            }else{
                $msg = "很遗憾，报名失败！您可以重新提交";
            }
            $this->assign("msg", $msg);
        }
        if($goods){
            M('goods')->where('goods_id='.$id)->setInc('hits');
            $topic = new TopicModel();
            $goods["tname"]  = $topic->getName($goods["tid"]);
            $hot_goods = D('goods')->hotGoods($goods['cate_id']);
            $goods_extra = M('goods_extra')->where(array("goods_id"=>$id,"status"=>1))->order("sort")->select();
            $this->assign('goods_extra',$goods_extra);
            $this->assign('tags', M("tag")->where("id in (".$goods['tags'].") and status = 1")->order("sort ASC")->select());
            $this->assign('hot_goods',$hot_goods);
            $this->assign('goods',$goods);
            $this->display();   
        }else{
            $this->error('商品不存在');
        }
    }

    public function diy(){
        $this->display();   
    }
}
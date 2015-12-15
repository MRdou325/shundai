<?php
namespace Home\Controller;
use Home\Model;
use Home\Model\GoodsModel;
use Home\Model\CategoryGoodsModel;
class IndexController extends HomeController {

    function __construct() {
        parent::__construct();
    }

    public function index() {
        $bannerarr = M('banner')->where(array('status' => 1))->order("`sort` ASC")->select();
        $bannerlist = array();
        foreach ($bannerarr as $key => $data) {
            $text = explode("|", $data["content"]);
            $content = array();
            foreach ($text as $k => $v) {
                $vv = explode(":", $v);
                if(count($vv) >= 2){
                    $content[$k]["txt"] = $vv[0];
                    $content[$k]["time"] = $vv[1];
                }
            }
            $data["content"] = $content;
            $bannerlist[] = $data;
        }
        $where_ad['state'] = 1;
        $ad_arr = M('ad')->where($where_ad)->order("`order` DESC")->select();
        foreach ($ad_arr as $k => $v) {
            if ($v['type'] == 1) {
                $focus[] = $v;
            } elseif ($v['type'] == 2) {
                $flink[] = $v;
            }
        }

        $category_good = M("category_goods")->where(array("status" => 1, "is_home" => 1, "p_id" => 0))->order("sort ASC")->select();
        $cglist = array();
        $GoodsModel = new GoodsModel();
        foreach ($category_good as $key => $v) {
            $data = array();
            $data['id'] = $v["id"];
            $data['category_name'] = $v["category_name"];
            $data['num'] = $v["home_num"];
            $data['catepic_url'] = $v["catepic_url"];
            $data['ad_url'] = $v["ad_url"];
            $data['color'] = $v["color"];
            $category_child = M("category_goods")->where(array("status" => 1, "p_id" => $v["id"]))->field("id,category_name,is_home")->select();
            $cids = $v["id"];
            foreach ($category_child as $vv) {
                $cids .= ',' . $vv["id"];
                if($vv["is_home"] == 1){
                    $data["category_child"][] = $vv;
                }
            }
            $where = 'status = 1 and cate_id in (' . $cids . ')';
            $data["goods"] = $GoodsModel->getGoods($v["home_num"], $where);
            $cglist[] = $data;
        }
        // $once = 20;
        // $where['status'] = 1;
        // $goodsdb = M('goods');
        // $totalPage = ceil($goodsdb->where($where)->count() / $once);
        // $count = $goodsdb->where($where)->count();
        // $page = $this->iniPage($count, $once);
        // $this->assign('focus', $focus);
        // $GoodsModel = new GoodsModel();
        // $this->assign('goods', $GoodsModel->getGoodsList($page, $where));
        // $this->assign('totalPage', $totalPage);
        // $this->assign('flink', $flink);
        $defpage = array();
        $cate = M('category')->where(array('status'=>1,'ishome'=>1))->order("sort")->select();
        foreach ($cate as $key => $value) {
            $data = array();
            $data["id"] = $value["id"];
            $data["name"] = $value["title"];
            $data["pic"] = $value["icon"];
            $data["type"] = 2;
            $data["content"] = M('document')->where(array('status'=>1,'category_id'=>$value["id"]))->limit($value["list_row"])->select();
            $defpage[] = $data;
        }
        $page = M('page')->where(array('status'=>1,'ishome'=>1))->order("sort")->select();
        foreach ($page as $key => $value) {
            $data = array();
            $data["id"] = $value["id"];
            $data["name"] = $value["name"];
            $data["type"] = 1;
            $data["content"] = $value["content"];
            $defpage[] = $data;
        }
        $CategoryGoodsModel = new CategoryGoodsModel();
        $categoods = $CategoryGoodsModel->getCategoryChildList(0,1);
        $categorygoods = array();
        foreach ($categoods as $key => $value) {
            if($value["istravel"] == 1)
            {
                $categorygoods["travel"][] = $value;
            }
            else
            {
                $categorygoods["cate"][] = $value;
            }
        }
        $this->assign('defpage', $defpage);
        $this->assign('orders', M('orders')->order('createtime DESC')->limit(12)->select());
        $this->assign('category_List', $cglist);
        $this->assign('banner', $bannerlist);
        $this->assign('categorygoods', $categorygoods);
        $this->assign('ishome', true);
        $this->display();
    }
}
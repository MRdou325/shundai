<?php
namespace Home\Model;
use Think\Model;
class GoodsModel extends Model{
	
    public function delGoods($goods_id){
        $this->where("goods_id='{$goods_id}'")->delete();
    }


    public function goodsCount($where=1){
        return $this->where($where)->count();            
    }
    
    public function getGoodsList($Page,$where){
        $goods = $this->where($where)->order('`goods_sort` DESC,goods_id DESC')->limit($Page->firstRow.','.$Page->listRows)->select();
        foreach ($goods as $k => $v){
            $goods[$k]['pic_url'] =get_image_url($v['pic_url']);
        }
        return $goods;
    }
    public function getGoods($count,$where){
        $goods = $this->where($where)->order('`goods_sort` DESC,goods_id DESC')->limit($count)->select();
        foreach ($goods as $k => $v){
            $goods[$k]['pic_url'] =get_image_url($v['pic_url']);
        }
        return $goods;
    }
    public function info($id){
        $where = array(
            'goods_id' => $id
        );
        $res = $this->join('__CATEGORY_GOODS__ ON __GOODS__.cate_id = __CATEGORY_GOODS__.id' )->where($where)->find();
        $res['pic_url'] = get_image_url($res['pic_url']);
        $res["days_body"] = json_decode($res["days_body"], true);
        $res["traffic"] = $res["goods_type"] == 1 ? explode(",", $res["traffic"]) : $res["traffic"];
  
        return $res;
    }
    public function hotGoods($cateId,$limit = 8 ){
        $where = array(
            'cate_id' => $cateId
        );
        $res =  $this->where($where)->order('hits DESC,goods_id DESC')->limit($limit)->select();
        foreach ($res as $k => $v){
            $res[$k]['pic_url'] = get_image_url($res[$k]['pic_url']);
        }
       
        
        return $res;
    }
}
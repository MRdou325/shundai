<?php
namespace Admin\Model;
use Think\Model;
class GoodsModel extends Model{
	protected $_auto = array(
	    array('ctime',NOW_TIME,self::MODEL_INSERT),
	    array('add_id', UID,self::MODEL_INSERT),
	    array('add_uname',USER_NAME,self::MODEL_INSERT)
	);

    public function delGoods($goods_id){
        $this->where("goods_id='{$goods_id}'")->delete();
    }

    public function info($id){
        $where = array(
            'goods_id' => $id
        );
        $res = $this->join('__CATEGORY_GOODS__ ON __GOODS__.cate_id = __CATEGORY_GOODS__.id' )->where($where)->find();
       
        $res['pic_url'] = get_image_url($res['pic_url']);
        if(substr($res['date_price_data'], -1) == ",")
        {
            $res['date_price_data'] = substr($res['date_price_data'], 0, -1);
        }
        $res["days_body"] = json_decode($res["days_body"], true);
        $res["traffic"] = explode(",", $res["traffic"]);
        $res["days_body_num"] = count($res["days_body"]) + 1;
  
        return $res;
    }
	/*
	* 添加商品，num_iid不允许重复
	*/
	public function addGoods($data){
		if(!empty($data) ){
			$where['num_iid'] = $data['num_iid'];
		}else{
			$where['num_iid'] = $this->data['num_iid'];
		}
		$info = $this->where($where)->find();
		if(empty($info)){
			return $this->add($data) ? 1: 0;
		}
		return -2;
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

    public function getGoodsInfo($id,$field)
    {
        $goods = $this->find($id);
        return $goods[$field];
    }

    public function addTags($tags, $goodid)
    {
        if(is_array($tags))
        {
            M('goods_to_tags')->where(array("goods_id" => $goodid))->delete();
            foreach ($tags as $v) {
                $p["goods_id"] = $goodid;
                $p["tag_id"] = $v;
                M('goods_to_tags')->add($p);
            }
        }
    }
   
}
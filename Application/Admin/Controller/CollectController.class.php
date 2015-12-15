<?php
namespace Admin\Controller;
use Admin\Model\CategoryModel;
use TopSDK\Api\TopApi;
use Admin\Model\CollectGoodsModel;
use Admin\Model\GoodsModel;
class CollectController extends AdminController
{
    public function index(){
        if(IS_POST){
            $q              =   I('q');
            $cid            =   I('cid');
            $sort           =   I('sort');
            $startTkRate    =   I("start_tk_rate");
            $endTkRate      =   I("end_tk_rate");
            $startPrice     =   I('start_price');
            $endPrice       =   I('end_price');
            $isTmall        =   I('is_tmall') > 0 ? true: false;
            $pageSize       =   I('num')? I('num') : 30;
            $cateId         =   I('cate_id') ? intval(I('cate_id')) : 0;
            $taobao = new TopApi(C('APP_KEY'), C('APP_SECRET'));
            $result = $taobao->getItem($q,$cid,$isTmall,$startPrice,$endPrice,$startTkRate,$endTkRate,$sort,1,$pageSize);
         
            $CollectGoodsModel = new CollectGoodsModel();
            if(is_array($result)){
                foreach ($result as $k => $v){
                    $result[$k]['cate_id'] = $cateId;
                    if($CollectGoodsModel->create($result[$k])){
                        $result[$k]['id'] = $CollectGoodsModel->add();
                    }                   
                }
                $this->assign('_list',$result);
                $this->display('collect');
            }
        }else{
            $category = D('CategoryGoods')->getGoodsCategory();
             
            $this->assign('category', $category);
            $this->display();
        } 
    }
    public function collectList(){
        $CollectGoodsModel = new CollectGoodsModel();
        $list = $this->lists($CollectGoodsModel);
        $this->assign('_list',$list);
        $this->display('collect');
    }
    public function addToGoods(){
         $id = array_unique((array)I('id',0));       
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }
        $where['id'] =   array('in',$id);
        $CollectGoodsModel = new CollectGoodsModel();
        $info = $this->lists('CollectGoods',$where);
        $GoodsModel = new GoodsModel();
		$add = 0;
		$err = 0;
		$exist = 0;
		foreach($info as $row){
			if($GoodsModel->create($row)){
				$res = $GoodsModel->addGoods();
				if($res>0){
					$where = array(
						'id' => $row['id']
					);
                $CollectGoodsModel->where($where)->delete();
					$add++;
				}elseif($res == -2){
					$exist++;
				}
				else{
					$err++;
				}
            }else {
				$err++;
			}
            }
		if($err > 0){
			$this->error($err.'件商品上架失败，'.$add.'件商品上架成功',U('Collect/collect'));
        }else {
			$this->success($add.'件商品上架成功,'.$exist.'件重复商品未添加',U('Collect/index'));
        }  
    }
    public function del(){
        $id = array_unique((array)I('id',0));       
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }
        $where['id'] =   array('in',$id);
        
       
        if(M('CollectGoods')->where($where)->delete()){
            $this->success('操作成功');
        }else {
            $this->error('删除失败');
        }
    }
    
    
}

?>
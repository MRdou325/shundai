<?php
namespace TopSDK\Api;

class TopApi
{
    private $appkey ;
    private $secretkey;
    /**
     * $error  -1001 
     * @var unknown
     */
    private $error;
    public function __construct($appkey,$secret){
       
        $this->c = new TopClient();
        $this->c->appkey = $appkey;
        $this->c->secretKey = $secret;
        
    }
    
    public function getItem($q,$cat = '', $isTmall = FALSE, $startPrice ='', $endPrice ='',$startTkRate = '', $endTkRate ='' ,$sort ='tk_rate_des', $pageNO =1, $pageSize = 30,$platForm = 1 , $loc=''){
        if(empty($q) && empty($cat)){
            $this->error = "code:-1001;q查询词和cat分类id不能同为空";
            return -1001;     
        }
        $req = new TbkItemGetRequest;
        $req->setFields("num_iid,title,pict_url,small_images,reserve_price,zk_final_price,user_type,provcity,item_url,click_url");
        if(!empty($q)){
            $req->setQ($q);
        }
        if(!empty($cat)){
            $req->setCat($cat);
        }
        if(!empty($loc)){
            $req->setItemloc($loc);
        }
        $req->setSort($sort);
        $req->setIsTmall($isTmall);
        $req->setIsOverseas("false");
        if(!empty($startPrice)){
            $req->setStartPrice($startPrice);
        }
        if(!empty($endPrice)){
            $req->setEndPrice($endPrice);
        }
        if(!empty($startTkRate)){
            $req->setStartTkRate($startTkRate);
        }
        if(!empty($endTkRate)){
             $req->setEndTkRate($endTkRate);
        }
        
        
       
        $req->setPlatform($platForm);
        $req->setPageNo($pageNO);
        $req->setPageSize($pageSize);
       
    
        $goodsList = '';
        $resp = $this->c->execute($req);
   
        if(!empty($resp->results->n_tbk_item)){
            $items = $resp->results->n_tbk_item;
            foreach ($items as $row){
                $goods['item_url'] = $row->item_url;
                $goods['pic_url']  = $row->pict_url;
                $goods['price']  = $row->reserve_price;
                $goods['discount_price'] = $row->zk_final_price;
                $goods['click_url'] = $row->click_url;
                $goods['title']     = $row->title;
                $goods['item_url']  = $row->item_url;
                $goods['num_iid']   = $row->num_iid;
                if($isTmall){
                    $goods['goods_type'] = 'tmall';
                }else{
                    $goods['goods_type'] = 'taobao';
                }
                $goodsList[] = $goods;
            }
        }
     
        return $goodsList;
    }
    
}

?>
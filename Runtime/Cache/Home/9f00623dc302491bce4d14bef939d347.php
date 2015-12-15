<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="361dream">
 
<title><?php echo ($site_title); ?></title>
<meta name="keywords" content="<?php echo ($site_keyword); ?>" />
<meta name="description" content="<?php echo ($site_description); ?>">
<link href="/ke361/Public/Home/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/ke361/Public/Home/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="/ke361/Public/Home/New/css/common.css" rel="stylesheet">
<link href="<?php echo C('WEB_SITE_ICO');?>" rel="icon" type="image/x-icon" />


   
</head>
<body>
	<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/ke361/Public/",
    JS_ROOT: "statics/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/ke361/Public/Home/js/jquery.js"></script>
  
	<script>
       
  
    	   
       
   
	$(function(){
		$('#navbar').find('a[href="'+'<?php echo ($nav_url); ?>'+'"]').closest('li').addClass('active');  
		// $('.goods-list').find('li').each(function(){
			
		// 	$(this).height($(this).width()*1.35-1);	
		// });
		
					});
					
</script>
<script>
function favor(goodsid){
    $.get("<?php echo U('ajax/favor');?>",{id:goodsid},function(json){
    	// if(json.info == "ERROR_MEMBER_NO_LOGIN")
    	// {
    	// 	json.info = "请先登录"；
    	// }
    	showmsg(json.info);
    })    
}   
function login(){
	var name = $("#username").val();
	var password = $("#password").val()
	if(name == "")
	{
		showmsg("请输入用户名");
	}
	if(password == "")
	{
		showmsg("请输入密码");
	}
    $.post("<?php echo U('ajax/login');?>",{username:name,password:password},function(json){
    	console.log(json);
        showmsg(json.info);
        if(json.state == 1)
        {
        	location.href = "<?php echo U('Home/Index/index');?>";
        }
    })    
}   
function showmsg(msg){
	$("#tip").remove();
	$tip = $('<div id="tip" style="font-weight:bold;position:fixed;top:240px;left: 50%;z-index:9999;background:rgb(130,194,75);padding:18px 30px;border-radius:8px;color:#fff;font-size:16px;">'+msg+'</div>');
    $('body').append($tip);
	$tip.stop(true).css('margin-left', -$tip.outerWidth() / 2).fadeIn(500).delay(2000).fadeOut(500);
}
</script>
<script type="text/javascript" src="/ke361/Public/Home/js/jquery.scrollLoading.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
            //实现图片慢慢浮现出来的效果
            $("img").load(function () {
                //图片默认隐藏  
                $(this).hide();
                //使用fadeIn特效  
                $(this).fadeIn("5000");
            });
            // 异步加载图片，实现逐屏加载图片
            $(".scrollLoading").scrollLoading(); 
    });
</script>

	
<!-- 页头 -->
<div class="top">
	<div class="box">
    
       <div class="row">
       		<div class="">
       			<?php if($my['uid'] > 0): ?><div class="col-md-8 col-md-offset-0 top-l">
                	<span>欢迎来到<?php echo C('WEB_SITE_NAME');?></span>
                    <a href="<?php echo U('User/logout');?>"><i class="glyphicon glyphicon-log-out"></i> &nbsp;退出</a>
                	<a href="<?php echo U('User/index');?>"><i class="glyphicon glyphicon-user"></i> &nbsp;<?php echo ($my['username']); ?></a>
                </div>
                <?php else: ?>
                <div class="col-md-8 col-md-offset-0 top-l">
                	<span>欢迎来到<?php echo C('WEB_SITE_NAME');?></span>           	
                	<a href="<?php echo U('User/register');?>" rel="nofollow">免费注册</a>
                	<a href="<?php echo U('User/login');?>" rel="nofollow">登录</a>
                </div><?php endif; ?>
       			<div class="col-md-3 col-md-offset-8 top-r">
       				<a id="Favorite">加入收藏</a>
       				<span >预订热线：<?php echo C("WEB_SITE_TEL");?></span>
       			</div>
       			<script type="text/javascript">
       			$(document).ready(function () { 
       				$("#Favorite").click(function() {
					    var title = document.title;
					    var url = location.href;
					    if (window.sidebar) {
					        window.sidebar.addPanel(title, url, "");
					    } else if (document.all) {
					        window.external.AddFavorite(url, title);
					    } else {
					        return true;
					    }
					});
       			});
       			</script>
       			<div class="clear"></div>
       		</div>
       </div>
      </div>
</div>
<div class="box">
    <div class="row">
        <div class="col-md-5">
			<div class="logo">
				<a class="" href="/" title="首页">
					<img title="<?php echo C('WEB_SITE_NAME');?>" alt="<?php echo C('WEB_SITE_NAME');?>" src="<?php echo C('WEB_SITE_LOGO');?>">
				</a>
			</div>
		</div>
        <div class="col-md-5" style="padding-top:20px;">
            <form action="<?php echo U('Search/index');?>" method="POST"> 
				<div class="input-group">
					  <input type="text" class="form-control" name="keywords" id="keywords" placeholder="请输入目的地或关键词...">
					  <span class="input-group-btn">
						<button class="btn btn-danger" type="submit">搜索</button>
					  </span>
				</div>
        <div class="searchkey">热门搜索：
        <?php if(is_array($searchkeyword)): $i = 0; $__LIST__ = $searchkeyword;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$search): $mod = ($i % 2 );++$i;?><a href="<?php echo U('Search/index',array("keywords"=>$search["name"]));?>"><?php echo ($search["name"]); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
            </form>
        </div>
		
        <div class="col-md-2">
            <a title="每天10点开抢" class="update" href="javascript:;" target="_blank" rel="nofollow"></a>
            <a title="职业买手砍价" class="lowest" href="javascript:;" target="_blank" rel="nofollow"></a>
            <a title="商品验货质检" class="check" href="javascript:;" target="_blank" rel="nofollow"></a>
        </div>
    </div>
</div>
<nav class="nav navbar-inverse radius-0">
    <div class="navbar-inner">
	    <div class="box">
	       
	        <div id="navbar" class="collapse navbar-collapse">
	        	<ul class="nav navbar-nav">
	            	<?php if($ishome){ ?>
                  <li class="all-cate">
                    <a>全部旅游分类</a>
                    <ul class="all-cate-box">
                      
                      <li>
                        <a>旅游线路</a>
                        <?php if(!empty($categorygoods['travel'])): ?><div class="sub-nav-0">
                          <?php if(is_array($categorygoods['travel'])): $i = 0; $__LIST__ = $categorygoods['travel'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$travel): $mod = ($i % 2 );++$i;?><div class="sub-nav-<?php echo ($travel["level"]); ?>">
                              <h3><a href="<?php echo U('goods/cate',array('id'=>$travel['id']));?>"><?php echo ($travel["category_name"]); ?></a></h3>
                              <?php if(!empty($travel['child'])): ?><div class="sub-nav-<?php echo ($travel["level"]); ?>-box">
                                <?php if(is_array($travel['child'])): $i = 0; $__LIST__ = $travel['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?><span><a href="<?php echo U('goods/cate',array('id'=>$cate['id']));?>"><?php echo ($cate["category_name"]); ?></a></span><?php endforeach; endif; else: echo "" ;endif; ?>
                                <div class="clear"></div>
                              </div><?php endif; ?>
                            </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div><?php endif; ?>
                      </li>
                      <?php if(!empty($categorygoods['cate'])): if(is_array($categorygoods['cate'])): $i = 0; $__LIST__ = $categorygoods['cate'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cates): $mod = ($i % 2 );++$i;?><li>
                            <a href="<?php echo U('goods/cate',array('id'=>$cates['id']));?>"><?php echo ($cates["category_name"]); ?></a>
                            <?php if(!empty($cates['child'])): ?><div class="sub-nav-0">
                              <?php if(is_array($cates['child'])): $i = 0; $__LIST__ = $cates['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$travel): $mod = ($i % 2 );++$i;?><div class="sub-nav-<?php echo ($travel["level"]); ?>">
                                  <h3><a href="<?php echo U('goods/cate',array('id'=>$travel['id']));?>"><?php echo ($travel["category_name"]); ?></a></h3>
                                  <?php if(!empty($travel['child'])): ?><div class="sub-nav-<?php echo ($travel["level"]); ?>-box">
                                    <?php if(is_array($travel['child'])): $i = 0; $__LIST__ = $travel['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?><span><a href="<?php echo U('goods/cate',array('id'=>$cate['id']));?>"><?php echo ($cate["category_name"]); ?></a></span><?php endforeach; endif; else: echo "" ;endif; ?>
                                    <div class="clear"></div>
                                  </div><?php endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                            </div><?php endif; ?>
                          </li><?php endforeach; endif; else: echo "" ;endif; endif; ?>
                    </ul>
                  </li>
                <?php } ?>
	                <?php if(!empty($nav)): if(is_array($nav)): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$headnav): $mod = ($i % 2 );++$i; if($headnav['pid'] == 0 && $headnav['head'] ==1){ ?>
	                        <li >
	                            <a id="nav-<?php echo ($headnav["id"]); ?>"  href="<?php echo (get_nav_url($headnav["url"])); ?>" target="<?php if(($headnav["target"]) == "1"): ?>_blank<?php else: ?>_self<?php endif; ?>"><?php echo ($headnav["title"]); ?></a>
	                        </li>
	                        <?php } endforeach; endif; else: echo "" ;endif; endif; ?>
	            </ul>
	        </div>
	    </div>
    </div>
 </nav>   
<!-- /页头 -->

	

	
	
	

	 <link href="/ke361/Public/Home/New/css/list.css" rel="stylesheet">
	 <div class="box">
	 	<div class="col-md-3">
	 		<div class="categorygoods-list">
    <?php if(is_array($CategoryList)): $i = 0; $__LIST__ = $CategoryList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; if($vo["level"] == 1){ ?>
        <h2 class="categorygoods_parent">
            <a href="<?php echo U('goods/cate',array("id"=>$vo['id']));?>" title="<?php echo ($vo["category_name"]); ?>" <?php if($vo['id'] == $_GET['id']){ ?>class="active"<?php } ?>><?php echo ($vo["category_name"]); ?></a>
        </h2>
    <?php }else{ ?>
        <a href="<?php echo U('goods/cate',array("id"=>$vo['id']));?>" title="<?php echo ($vo["category_name"]); ?>" <?php if($vo['id'] == $_GET['id']){ ?>class="active"<?php } ?>><?php echo ($vo["category_name"]); ?></a>
    <?php } endforeach; endif; else: echo "" ;endif; ?>
</div>

	 		<div id="side">
<?php if(!empty($nav)): if(is_array($nav)): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i; if($nav['pid'] == 0 && $nav['side'] == 1){ ?>
	        <div>
	            <a id="nav-<?php echo ($nav["id"]); ?>"  href="<?php echo (get_nav_url($nav["url"])); ?>" target="<?php if(($nav["target"]) == "1"): ?>_blank<?php else: ?>_self<?php endif; ?>"><?php echo ($nav["title"]); ?></a>
	        </div>
	    <?php } endforeach; endif; else: echo "" ;endif; endif; ?>
<h2>联系电话</h2>
<div><?php echo C('WEB_SITE_TEL');?></div>
</div>


	 	</div>
	 	<div class="col-md-9">
	 		<div class="goods-list">
<?php if($iscate == 1){ ?>
    <?php if(is_array($goods)): $i = 0; $__LIST__ = $goods;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?><div class="list790">
        <h3><span class="more"><a href="<?php echo U('Goods/cate',array('id'=> $cate["id"]));?>">更多&gt;&gt;</a></span><?php echo ($cate["category_name"]); ?></h3>
        <div class="tag_con" id="js_tag_con">                                                                        
            <div class="tu_wen">
                <ul>
                    <?php if(is_array($cate["goods"])): $i = 0; $__LIST__ = $cate["goods"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods): $mod = ($i % 2 );++$i; if($goods["goods_type"] == 1){ ?>
                    <li>
                        <div class="pic">
                            <a href="<?php echo U('Goods/info',array('id'=> $goods["goods_id"]));?>" target="_blank" title="<?php echo ($goods["title"]); ?>">
                                <img class="scrollLoading" data-url="<?php echo ($goods["pic_url"]); ?>" src="<?php echo (get_image_url($goods['pic_url'])); ?>" border="0" alt="<?php echo ($goods["title"]); ?>" width="75" height="50" original="<?php echo (get_image_url($goods['pic_url'])); ?>" style="display: block;">
                            </a>
                        </div>
                        <div class="type">
                            <?php if(!empty($goods['tid'])): ?>[<?php echo get_topic_name($goods["tid"]);?>]<?php endif; ?><a href="<?php echo U('Goods/info',array('id'=> $goods["goods_id"]));?>" target="_blank"><?php echo ($goods["title"]); ?></a>                
                            <p>
                                <span>出发城市：<?php echo ($goods["city"]); ?></span>
                                <span>行程天数：<?php echo ($goods["days"]); ?></span>
                                <span>交通方式：<?php echo ($goods["traffic"]); ?> &nbsp;&nbsp;<a href="<?php echo U('Goods/info',array('id'=> $goods["goods_id"]));?>">更多</a></span>
                            </p>
                        </div>
                        <div class="price"><em><b>￥</b><?php if($goods['discount_price'] > 0){ echo ($goods["discount_price"]); }else{ echo ($goods["price"]); } ?></em>起</div>
                    <?php }else{ ?>
                    <li class="rooms fn-clear">
                        <div class="room-top">
                            <div class="pic">
                                <a href="<?php echo U('Goods/info',array('id'=> $goods["goods_id"]));?>" target="_blank" title="<?php echo ($goods["title"]); ?>">
                                    <img class="scrollLoading" data-url="<?php echo ($goods["pic_url"]); ?>" src="<?php echo ($goods['pic_url']); ?>" width="165" height="110" alt="<?php echo ($goods["title"]); ?>" original="<?php echo ($goods['pic_url']); ?>" style="display: block;">
                                </a>
                            </div>
                            <div class="basic">
                                <strong><a href="<?php echo U('Goods/info',array('id'=> $goods["goods_id"]));?>" target="_blank" title="<?php echo ($goods["title"]); ?>"><?php echo ($goods["title"]); ?></a></strong>
                                <p>办理时间：<?php echo ($goods["days"]); ?>天 有效期：<?php echo ($goods["aheaddays"]); ?>天 最多停留：<?php echo ($goods["maxdays"]); ?>天</p>
                                <p>签证面试：<?php if($goods['audition']==2){ ?>不<?php } ?>需要 邀请函：<?php if($goods['invite']==2){ ?>不<?php } ?>需要 受理范围：<?php echo ($goods["city"]); ?></p>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <ul>
                            <li class="type">
                                <span class="w1">价格类型</span>
                                <span>门市价</span>
                                <span>优惠价</span>
                                <span>服务备注</span>
                            </li>
                                <li id="20691_0">
                                <span class="w1"><b><?php echo ($goods["title"]); ?></b></span>
                                <span class="ms">￥<?php echo ($goods["price"]); ?></span>
                                <span class="xx">￥<?php echo ($goods["discount_price"]); ?></span>
                                <span title="办理入金证费用及服务费"><?php echo ($goods["title"]); ?></span>
                            </li>
                        </ul>
                        <?php } ?>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>
    </div><?php endforeach; endif; else: echo "" ;endif; ?>
<?php }else{ ?>

    <div class="list790">
        <h3><?php echo ($cate["category_name"]); ?></h3>
        <div class="tag_con" id="js_tag_con">                                                                        
            <div class="tu_wen">
                <ul>
                    <?php if(is_array($goods)): $i = 0; $__LIST__ = $goods;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods): $mod = ($i % 2 );++$i; if($goods["goods_type"] == 1){ ?>
                    <li>
                        <div class="pic">
                            <a href="<?php echo U('Goods/info',array('id'=> $goods["goods_id"]));?>" target="_blank" title="<?php echo ($goods["title"]); ?>">
                                <img class="scrollLoading" data-url="<?php echo ($goods["pic_url"]); ?>" src="<?php echo ($goods['pic_url']); ?>" border="0" alt="<?php echo ($goods["title"]); ?>" width="75" height="50" original="<?php echo ($goods['pic_url']); ?>" style="display: block;">
                            </a>
                        </div>
                        <div class="type">
                            <?php if(!empty($goods['tid'])): ?>[<?php echo get_topic_name($goods["tid"]);?>]<?php endif; ?><a href="<?php echo U('Goods/info',array('id'=> $goods["goods_id"]));?>" target="_blank"><?php echo ($goods["title"]); ?></a>                
                            <p>
                                <span>出发城市：<?php echo ($goods["city"]); ?></span>
                                <span>行程天数：<?php echo ($goods["days"]); ?></span>
                                <span>交通方式：<?php echo ($goods["traffic"]); ?> &nbsp;&nbsp;<a href="<?php echo U('Goods/info',array('id'=> $goods["goods_id"]));?>">更多</a></span>
                            </p>
                        </div>
                        <div class="price"><em><b>￥</b><?php if($goods['discount_price'] > 0){ echo ($goods["discount_price"]); }else{ echo ($goods["price"]); } ?></em>起</div>
                        <?php }else{ ?>
                    <li class="rooms fn-clear">
                        <div class="room-top">
                            <div class="pic">
                                <a href="<?php echo U('Goods/info',array('id'=> $goods["goods_id"]));?>" target="_blank" title="<?php echo ($goods["title"]); ?>">
                                    <img class="scrollLoading" data-url="<?php echo ($goods["pic_url"]); ?>" src="<?php echo ($goods['pic_url']); ?>" width="165" height="110" alt="<?php echo ($goods["title"]); ?>" original="<?php echo ($goods['pic_url']); ?>" style="display: block;">
                                </a>
                            </div>
                            <div class="basic">
                                <strong><a href="<?php echo U('Goods/info',array('id'=> $goods["goods_id"]));?>" target="_blank" title="<?php echo ($goods["title"]); ?>"><?php echo ($goods["title"]); ?></a></strong>
                                <p>办理时间：<?php echo ($goods["days"]); ?>天 有效期：<?php echo ($goods["aheaddays"]); ?>天 最多停留：<?php echo ($goods["maxdays"]); ?>天</p>
                                <p>签证面试：<?php if($goods['audition']==2){ ?>不<?php } ?>需要 邀请函：<?php if($goods['invite']==2){ ?>不<?php } ?>需要 受理范围：<?php echo ($goods["city"]); ?></p>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <ul>
                            <li class="type">
                                <span class="w1">价格类型</span>
                                <span>门市价</span>
                                <span>优惠价</span>
                                <span>服务备注</span>
                                <span class="btn">&nbsp;</span>
                            </li>
                                <li id="20691_0">
                                <span class="w1"><b><?php echo ($goods["title"]); ?></b></span>
                                <span class="ms">￥<?php echo ($goods["price"]); ?></span>
                                <span class="xx">￥<?php echo ($goods["discount_price"]); ?></span>
                                <span title="办理入金证费用及服务费"><?php echo ($goods["title"]); ?></span>
                                <span class="btn"></span>
                            </li>
                        </ul>
                        <?php } ?>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>
        <div class="page"><?php echo ($page); ?></div>
    </div>

<?php } ?>
</div>

	 	</div>
	 <div class="row">
        	<div class="col-md-12">
            
            </div>
      </div>
      </div>
	 

	
	
	
	<!-- 页脚 -->
<div id="footer">
<div class="box">
<div class="container">
	<div class="row">
		<?php if(!empty($nav)): if(is_array($nav)): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$footnav): $mod = ($i % 2 );++$i; if($footnav['pid'] == 0 && $footnav['foot'] == 1){ ?>
	            <div class="col-md-1">
	                <a id="nav-<?php echo ($footnav["id"]); ?>"  href="<?php echo (get_nav_url($footnav["url"])); ?>" target="<?php if(($footnav["target"]) == "1"): ?>_blank<?php else: ?>_self<?php endif; ?>"><?php echo ($footnav["title"]); ?></a>
	            </div>
	        <?php } endforeach; endif; else: echo "" ;endif; endif; ?>
	</div>
    <div class="row">
		<dl class="col-md-3">
			<dt><?php echo ($articleSort[0]['sort_name']); ?></dt>
			<?php $d0 = $article[$articleSort[0]['sort_id']];?>
			<?php if(is_array($d0)): $i = 0; $__LIST__ = $d0;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><dd><a target="_blank" href="<?php echo U('article/detail',array('aid'=>$data['aid']));?>"><i></i><?php echo cutstr($data['title'],28);?></a></dd><?php endforeach; endif; else: echo "" ;endif; ?>     
		</dl>
		<dl class="col-md-3">
			<dt><?php echo ($articleSort[1]['sort_name']); ?></dt>
			<?php $d1 = $article[$articleSort[1]['sort_id']];?>
			<?php if(is_array($d1)): $i = 0; $__LIST__ = $d1;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><dd><a target="_blank" href="<?php echo U('article/detail',array('aid'=>$data['aid']));?>"><i></i><?php echo cutstr($data['title'],28);?></a></dd><?php endforeach; endif; else: echo "" ;endif; ?>
		</dl>
		<dl class="col-md-3">
			<dt><?php echo ($articleSort[2]['sort_name']); ?></dt>
			<?php $d2 = $article[$articleSort[2]['sort_id']];?>
			<?php if(is_array($d2)): $i = 0; $__LIST__ = $d2;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><dd><a target="_blank" href="<?php echo U('article/detail',array('aid'=>$data['aid']));?>"><i></i><?php echo cutstr($data['title'],28);?></a></dd><?php endforeach; endif; else: echo "" ;endif; ?>
		</dl>
		<dl class="col-md-3">
			<dt><?php echo ($articleSort[3]['sort_name']); ?></dt>
			<?php $d3 = $article[$articleSort[3]['sort_id']];?>
			<?php if(is_array($d3)): $i = 0; $__LIST__ = $d3;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><dd><a target="_blank" href="<?php echo U('article/detail',array('aid'=>$data['aid']));?>"><i></i><?php echo cutstr($data['title'],28);?></a></dd><?php endforeach; endif; else: echo "" ;endif; ?>
		</dl>    
    </div>
    <div class="row">
    	<div class="col-md-5">Copyright © 2015 <a class="" href="/" title="<?php echo C('WEB_SITE_NAME');?>"><?php echo C('WEB_SITE_NAME');?></a>  <?php echo C('WEB_SITE_ICP');?></div>
	</div>	
    <div class="row">
    	<div class="col-md-12"><?php echo C('TONGJI');?></div>
    </div>
    <?php if(!empty($flink)): ?><div class="row">
			<span class="col-md-2">友情链接：</span>
			
			<?php if(is_array($flink)): foreach($flink as $key=>$vo): ?><span class="col-md-2">
					<a href="<?php echo ($vo["url"]); ?>" <?php if($vo['blank'] == 1){ ?>target="_blank"<?php } ?>><?php if($vo['pic_url'] != ''){ ?><img height="30" src="<?php echo ($vo["pic_url"]); ?>" title="<?php echo ($vo["title"]); ?>" alt="<?php echo ($vo["title"]); ?>"><?php }else{ echo ($vo["title"]); } ?></a>
				</span><?php endforeach; endif; ?>
				
	</div><?php endif; ?>
</div>
<div style="display: none;" class="side_right fix">
        <div class="con">
            <a class="trigger go-top" href="javascript:;">
                <p>回到<br>顶部</p>
                <span><i class="glyphicon glyphicon-triangle-top" aria-hidden="true" style="font-size:24px;"></i></span>
            </a>
    </div>
</div>
</div>
</div>
<?php if(C('WEB_SUPPORT_OPEN') == 1){ ?>
<div id="tool" class="">
	<div id="tool_content" style="display: block;">
		<div class="tc tool_c_top"></div>
		<div class="tc tool_c_content">
			<h3 class="ck online">&nbsp;</h3>
			<h3 class="ck support">咨询客服</h3>
			<?php if(is_array($support)): $i = 0; $__LIST__ = $support;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$qq): $mod = ($i % 2 );++$i;?><h3 class="ck qq"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<?php echo ($qq["number"]); ?>&site=qq&menu=yes"><?php echo ($qq["name"]); ?></a></h3><?php endforeach; endif; else: echo "" ;endif; ?>
		</div>
		<div class="tc tool_c_tb"></div>
		<div class="tc tool_c_content">
			<h3 class="ck tel">&nbsp;</h3>
			<span class="ck phone"><?php echo C("WEB_SITE_TEL");?></span>
		</div>
		<div class="tc tool_c_bottom"></div>
	</div>
	<a id="aFloatTools_Show" class="ck" href="javascript:void(0);" onclick="javascript:$('#tool_content').hide(1000);	$('#aFloatTools_Show').attr('style','display:none');$('#aFloatTools_Hide').attr('style','display:block');return false;" style="display:block">&nbsp;</a>
	<a id="aFloatTools_Hide" class="ck" style="display:none" href="javascript:void(0);" onclick="javascript:$('#tool_content').show(1000);	$('#aFloatTools_Show').attr('style','display:block');$('#aFloatTools_Hide').attr('style','display:none');return false;">&nbsp;</a>
</div>
<?php } ?>
	
	

</body>
</html>
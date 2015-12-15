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
	 <?php if(C('BANNER_OPEN') == 1 && count($banner) > 0){ ?>
	 <div id="banner-box">
<div id="banner" style="width: <?php echo C('BANNER_WIDTH');?>px;height: <?php echo C('BANNER_HEIGHT');?>px">
<?php if(count($banner) ==1){ ?>
	<?php if(is_array($banner)): $i = 0; $__LIST__ = $banner;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><img title="<?php echo ($data["title"]); ?>" alt="<?php echo ($data["title"]); ?>" src="<?php echo ($data["image"]); ?>"/><?php endforeach; endif; else: echo "" ;endif; ?>
<?php }else{ ?>
<link rel="stylesheet" href="/ke361/Public/Home/css/orman.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/ke361/Public/Home/css/nivo-slider.css" type="text/css" media="screen" />
	<div id="slider" class="nivoSlider">
		<?php if(is_array($banner)): $k = 0; $__LIST__ = $banner;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($k % 2 );++$k; if($data["link"]){ ?><a href="<?php echo (get_nav_url($data["link"])); ?>" title="<?php echo ($data["title"]); ?>"><?php } ?>
			<img src="<?php echo ($data["image"]); ?>" alt="<?php echo ($data["title"]); ?>" title="<?php echo ($data["title"]); ?>" />
			</a><?php endforeach; endif; else: echo "" ;endif; ?>
	</div>

<script type="text/javascript" src="/ke361/Public/Home/js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript">
$(window).load(function() {
	$('#slider').nivoSlider({
		controlNav:true
	});
});
</script>
<?php } if(false){ ?>
	<script type='text/javascript' src='/ke361/Public/Home/js/modernizr.min.js'></script>
	<script type='text/javascript'>
	/* <![CDATA[ */
	var CSSettings = {"pluginPath":"/ke361/Public/Home"};
	/* ]]> */
	</script>
	<script type='text/javascript' src='/ke361/Public/Home/js/cute.slider.js'></script>
	<script type='text/javascript' src='/ke361/Public/Home/js/cute.transitions.all.js'></script>
	<link rel="stylesheet" href="/ke361/Public/Home/css/5icool.org.css" />
	<div class="c-860 c-demoslider">
		<div id="cuteslider_3_wrapper" class="cs-circleslight">
			<div id="cuteslider_3" class="cute-slider" data-width="960" data-height="420" data-overpause="<?php if(C('BANNER_OVERPAUSE')==1){ ?>true<?php }else{ ?>false<?php } ?>">
				<ul data-type="slides">
				<?php if(is_array($banner)): $k = 0; $__LIST__ = $banner;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($k % 2 );++$k;?><li data-delay="5" data-src="5" data-trans3d="tr6,tr17,tr22,tr23,tr29,tr27,tr32,tr34,tr35,tr53,tr54,tr62,tr63,tr4,tr13,tr45" data-trans2d="tr3,tr8,tr12,tr19,tr22,tr25,tr27,tr29,tr31,tr34,tr35,tr38,tr39,tr41"><img src="<?php echo ($data["image"]); ?>" data-src="<?php echo ($data["image"]); ?>" data-thumb="<?php echo ($data["image"]); ?>">
						<?php if($data["link"]!=''){ ?><a data-type="<?php if($data["type"]==1){ ?>link<?php }else{ ?>video<?php } ?>" href="<?php echo ($data["link"]); ?>" target="_blank"></a><?php } ?>
						<ul data-type="captions">
						<?php if(is_array($data['content'])): $i = 0; $__LIST__ = $data['content'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$value): $mod = ($i % 2 );++$i;?><li class="caption_slider2_layer<?php echo ($k+1); ?>_sublayer<?php echo ($i+1); ?>" data-effect="fade" data-delay="<?php echo ($value["time"]); ?>"><?php echo ($value["txt"]); ?></li><?php endforeach; endif; else: echo "" ;endif; ?>
						</ul>
					</li><?php endforeach; endif; else: echo "" ;endif; ?>
				</ul>
				<ul data-type="controls">
					<li data-type="captions"></li>
					<li data-type="link"></li>
					<li data-type="video"></li>
					<li data-type="slideinfo"></li>
					<?php if(C('BANNER_CIRCLETIMER')==1){ ?><li data-type="circletimer"></li><?php } ?>
					<?php if(C('BANNER_PREVIOUS')==1){ ?><li data-type="previous"></li><?php } ?>
					<?php if(C('BANNER_NEXT')==1){ ?><li data-type="next"> </li><?php } ?>
					<?php if(C('BANNER_BARTIMER')==1){ ?><li data-type="bartimer"></li><?php } ?>
					<?php if(C('BANNER_THUMBLIST')==1){ ?><li data-type="slidecontrol" data-thumb="true" data-thumbalign="up"></li><?php } ?>
				</ul>
			</div>
			<div class="cute-shadow"><img src="/ke361/Public/Home/images/shadow.png" alt="shadow"></div>
		</div>
	</div>
	<script type="text/javascript">var cuteslider3 = new Cute.Slider();cuteslider3.setup("cuteslider_3" , "cuteslider_3_wrapper", "/ke361/Public/Home/css/slider-style.css");cuteslider3.api.addEventListener(Cute.SliderEvent.CHANGE_START, function(event) { });cuteslider3.api.addEventListener(Cute.SliderEvent.CHANGE_END, function(event) { });cuteslider3.api.addEventListener(Cute.SliderEvent.WATING, function(event) { });cuteslider3.api.addEventListener(Cute.SliderEvent.CHANGE_NEXT_SLIDE, function(event) { });cuteslider3.api.addEventListener(Cute.SliderEvent.WATING_FOR_NEXT, function(event) { });</script>
<?php } ?>
</div>
</div>
	 <?php } ?>
	 <div class="container">
	 	<?php if(is_array($category_List)): $i = 0; $__LIST__ = $category_List;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cl): $mod = ($i % 2 );++$i;?><div class="pro_item <?php echo ($cl['color']); if($cl["num"] < 5){ ?> pro4<?php } ?>" tag="<?php echo ($cl["category_name"]); ?>">
            <div class="hd">
                <h3 <?php if(!empty($cl['catepic_url'])): ?>style="background-image:url(<?php echo ($cl['catepic_url']); ?>)"<?php endif; ?>><a href="<?php echo U('goods/cate',array('id'=>$cl['id']));?>" title="<?php echo ($cl["category_name"]); ?>" target="_blank"><?php echo ($cl["category_name"]); ?></a></h3>
                <div class="more" style="overflow:hidden">
                    <a class="first" href="<?php echo U('goods/cate',array('id'=>$cl['id']));?>" title="<?php echo ($cl["category_name"]); ?>" target="_blank">精选</a>
                    <?php if(is_array($cl['category_child'])): $i = 0; $__LIST__ = $cl['category_child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cc): $mod = ($i % 2 );++$i;?><a href="<?php echo U('goods/cate',array('id'=>$cc['id']));?>" title="<?php echo ($cc["category_name"]); ?>" target="_blank"><?php echo ($cc["category_name"]); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
                <a class="more_link" href="<?php echo U('goods/cate',array('id'=>$cl['id']));?>" target="_blank">更多&gt;&gt;</a>
            </div>
            <div class="bd">
                <div class="left_img">
                <?php if(!empty($cl['ad_url'])): ?><img class="scrollLoading" data-url="<?php echo ($cl['ad_url']); ?>" src="<?php echo ($cl['ad_url']); ?>" title="<?php echo ($cl["category_name"]); ?>" alt="<?php echo ($cl["category_name"]); ?>" original="<?php echo ($cl['ad_url']); ?>" style="display: inline;">
                <?php else: ?>
                    <img src="http://xnxwcdn.cncn.net/images/front/home30/pic_404_travel.jpg" title="<?php echo ($cl["category_name"]); ?>" alt="<?php echo ($cl["category_name"]); ?>" original="http://xnxwcdn.cncn.net/images/front/home30/pic_404_travel.jpg" style="display: inline;"><?php endif; ?>
                </div>
                <div class="pro_list">
                	<?php if(is_array($cl['goods'])): $i = 0; $__LIST__ = $cl['goods'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$good): $mod = ($i % 2 );++$i;?><div class="pro_box">
                        <a href="<?php echo U('goods/info', array('id' => $good['goods_id']));?>" target="_blank">
                            <div class="pro_border">
                                <div class="img">
                                    <img alt="<?php echo ($good["title"]); ?>" title="<?php echo ($good["title"]); ?>" class="scrollLoading" data-url="<?php echo ($good["pic_url"]); ?>" src="<?php echo ($good["pic_url"]); ?>" original="<?php echo ($good["pic_url"]); ?>" style="display: inline;">
                                </div>
                                <p><?php echo ($good["title"]); ?></p>
                                <?php if($good["discount_price"] > 0){ ?>
                                <span class="price">
                                    <b><i>￥</i><?php echo ($good["discount_price"]); ?></b>
                                </span>
                                <span class="save">
                                    <b>省</b>￥<?php echo ($good['price']-$good['discount_price']); ?>
                                </span>
                                <?php }else{ ?>
                                <span class="price">
                                    <b><i>￥</i><del><?php echo ($good["price"]); ?></del></b>
                                </span>
                                <?php } ?>
                            </div>
                            <span class="link"></span>
                        </a>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
        </div><?php endforeach; endif; else: echo "" ;endif; ?>
	 
	 	<div class="col-md-9">
	 		<div class="box540">
                <div class="page-tab">
                    <!-- <span class="more"><a href="about" target="_blank" id="link_more">更多&gt;&gt;</a><i></i></span> -->
                    <?php if(is_array($defpage)): $i = 0; $__LIST__ = $defpage;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$page): $mod = ($i % 2 );++$i; if($page["type"]==1){ ?>
                    		<a class="tab" href="<?php echo U('Page/index',array('id'=>$page['id']));?>" target="_blank" data-link="about" data-val="<?php echo ($page['id']); ?>"><?php echo ($page["name"]); ?></a>
                    	<?php }else{ ?>
                    		<a class="tab" href="<?php echo U('Article/artlist',array('id'=>$page['id']));?>" target="_blank" data-link="about" data-val="<?php echo ($page['id']); ?>"><?php echo ($page["name"]); ?></a>
                    	<?php } endforeach; endif; else: echo "" ;endif; ?>
                </div>
                <div class="page-con">
                	<?php if(is_array($defpage)): $i = 0; $__LIST__ = $defpage;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$page): $mod = ($i % 2 );++$i;?><div class="tu_wen J_t_con con<?php echo ($page['id']); ?>" style="display: block;">
                    <?php if($page["type"]==1){ ?>
                    	<?php echo ($page["content"]); ?>
                    <?php }else{ ?>
                    <ul>
                    	<li><img src="<?php echo (get_image_url(get_cover($page["pic"],'path'))); ?>" width="100%"></li>
                    	<?php if(is_array($page['content'])): $i = 0; $__LIST__ = $page['content'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$document): $mod = ($i % 2 );++$i;?><li>
                    			<a href="<?php echo U('Article/detail', array('id'=>$document["id"]));?>" title="<?php echo ($document["id"]); ?>"><?php echo ($document["title"]); ?></a>
                    			<div class="desc">
                    				<?php echo ($document["description"]); ?>
                    			</div>
                    		</li><?php endforeach; endif; else: echo "" ;endif; ?>
                    	<div class="clear"></div>
                    </ul>
                    <?php } ?>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>

            	<script>
                    $(document).ready(function() {
                        $(".page-con div.tu_wen").hide(); // Initially hide all content
                        $(".page-tab a.tab:first").attr("class","tab on"); // Activate first tab
                        $(".page-con div.tu_wen:first").fadeIn(); // Show first tab content
                        
                        $('.page-tab a.tab').mouseover(function(e) {
                            e.preventDefault();        
                            $(".page-con div.tu_wen").hide(); //Hide all content
                            $(".page-tab a.tab").attr("class","tab"); //Reset id's
                            $(this).attr("class","tab on"); // Activate this
                            $('.page-con div.con' + $(this).attr('data-val')).fadeIn(); // Show content for current tab
                        });
                    });
                </script>
	 	</div>
	 	<div class="col-md-3">
            <div class="box240">
                <div class="tit">
                <strong>最近预订</strong>
                </div>
                <div class="txt order">
                    <ul>
                    <?php if(!empty($orders)): if(is_array($orders)): $i = 0; $__LIST__ = $orders;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$order): $mod = ($i % 2 );++$i;?><li><i></i><?php echo (mb_substr($order["name"],0,1,'utf-8')); ?>**&nbsp;&nbsp;预订了仅<em><?php echo ($order['discount_price']?$order['discount_price']:$order['price']); ?></em>元的
							<a href="<?php echo U('Goods/info',array('id'=> $order["goods_id"]));?>" title="<?php echo ($order["goods_name"]); ?>" target="_blank"><?php echo ($order["goods_name"]); ?></a>
						</li><?php endforeach; endif; else: echo "" ;endif; ?>
					<?php else: ?>
						<li><i></i> 暂时还没有订单!</li><?php endif; ?>
					</ul>
                </div>
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
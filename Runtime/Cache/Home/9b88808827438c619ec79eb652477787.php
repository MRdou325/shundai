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

	<link href="/ke361/Public/Home/New/css/goods.css" rel="stylesheet" />

   
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

	

	
	
	
<script type="text/javascript" src="/ke361/Public/Home/js/date_table.js"></script>
	<div class="box">
    <div class="main mt20 clear">
    <?php if($msg){ ?><div class="msg"><?php echo ($msg); ?></div><?php } ?>
        <!-- 面包屑 -->
        <div class="place-show col-md-12">
            <div class="place-explain fl">
                <a href="<?php echo U('Index/index');?>" title="<?php echo C('WEB_SITE_TITLE');?>">首页</a>
                &gt;
                <a href="<?php echo U('Goods/cate',array('id'=>$goods['cate_id']));?>" title="<?php echo ($goods['category_name']); ?>"><?php echo ($goods['category_name']); ?></a>
                &gt;
               <?php echo ($goods['title']); ?>
            </div>
        </div>
        <!--items start-->
        <div class="show_box fl col-md-12">
            <div class="show_body mb20 clear">
                <div class="row"><h1 class="title"><?php if($goods['tid'] > 0){ ?><strong>&lt;<?php echo ($goods['tname']); ?>&gt;</strong><?php } echo cutstr($goods['title'],100);?></h1></div>
                <div class="show_img fl">
                    <a class="show_big buy" title="<?php echo ($goods_name); ?>">
                        <img alt="<?php echo ($goods['title']); ?>" src="<?php echo ($goods['pic_url']); ?>" >
                    </a>
                    <!-- JiaThis Button BEGIN -->
                    <div class="jiathis_style">
                        <a class="jiathis_button_qzone"></a>
                        <a class="jiathis_button_tsina"></a>
                        <a class="jiathis_button_tqq"></a>
                        <a class="jiathis_button_weixin"></a>
                        <a class="jiathis_button_renren"></a>
                        <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
                        <a class="jiathis_counter_style"></a>
                    </div>
                    <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
                    <!-- JiaThis Button END -->
                    <a class="y-like my-like mt5 fl item-like-btn" href="javascript:;" onclick="favor(<?php echo ($goods['goods_id']); ?>)">
                            <em class="icon icon-k"></em>收藏</a> 
                </div>
                <div class="price-info goods-info pr  fl">
                <?php if($goods['goods_type']==1){ ?>
                    <ul>
                        <li>门 市 价: <del id="price">￥<?php echo ($goods['price']); ?></del>&nbsp;&nbsp;&nbsp;<em><b id="price"><?php echo sprintf( "%.2f",$goods['discount_price']/$goods['price'])*10; ?>折</b></em></li>                                                                    
                        <li class="price" style="width:100% !important;">优 惠 价: <em>￥<b id="price_cncn"><?php echo ($goods['discount_price']); ?></b></em>&nbsp;元&nbsp;&nbsp;&nbsp;<?php if($goods['child_price'] > 0){ ?>儿童价：<em>￥<b id="price_cncn_child"><?php echo ($goods['child_price']); ?></b></em>&nbsp;元<?php } ?></li>
                        <li>发团日期: 指定日期，请提前<strong><?php echo ($goods["aheaddays"]); ?></strong>天报名</li>
                        <li>出发城市: <?php echo ($goods['city']); ?></li>
                        <li>行程天数: <?php echo ($goods['days']); ?>天</li>
                        <li>交通方式: <?php echo (get_traffic($goods['traffic'][0])); ?>去,<?php echo (get_traffic($goods['traffic'][1])); ?>回</li>
                        <?php if(!empty($tags)): ?><li class="tag">产品提示：
                            <?php if(is_array($tags)): $i = 0; $__LIST__ = $tags;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$tag): $mod = ($i % 2 );++$i;?><span><?php if($tag["pic_url"] != ''){ ?><img title="<?php echo ($tag["name"]); ?>" alt="<?php echo ($tag["name"]); ?>" src="<?php echo (get_image_url($tag["pic_url"])); ?>"><?php }else{ echo ($tag["name"]); } ?></span><?php endforeach; endif; else: echo "" ;endif; ?>
                        </li><?php endif; ?>
                    </ul>
                    <?php }else{ ?>
                        <ul class="txt">
                            <li class="price">优 惠 价: <em>￥<b><?php echo ($goods['discount_price']); ?></b></em>&nbsp;元</li>
                            <li class="price mt3">门 市 价: <del>￥<?php echo ($goods['price']); ?></del>&nbsp;&nbsp;元</li>
                            <li><span>办理时间:</span><?php echo ($goods['days']); ?>天</li>                        
                            <li><span>邀 请 函:</span><?php if($goods['invite']==2){ ?>不<?php } ?>需要</li>                        
                            <li><span>有 效 期:</span><?php echo ($goods["aheaddays"]); ?>天</li>                        
                            <li><span>所属领区:</span><?php echo ($goods['city']); ?></li>                        
                            <li><span>最多停留:</span><?php echo ($goods["maxdays"]); ?>天</li>                        
                            <li><span>面&nbsp;&nbsp;&nbsp;&nbsp;试:</span><?php if($goods['audition']==2){ ?>不<?php } ?>需要</li>                        
                            <li><span>受理范围:</span><?php echo ($goods['traffic']); ?></li>
                        </ul>
                    <?php } ?>
                    <div class="button">
                    <?php if($goods['goods_type']==1){ ?>
                    <input type="hidden" id="adult_price" name="adult_price" value="<?php echo ($goods['discount_price']); ?>">
                    <input type="hidden" id="child_price" name="child_price" value="<?php echo ($goods['child_price']); ?>">
                    <input id="start_time" name="start_time" type="text" class="text text110 riqi" value="请选择出发日期" onClick="display_price_type();" readonly="readyonly" title="点击选择出发日期" />
                                <dl class="table_date">
                                    <div class="pro_input date_price">
                                        <input type="hidden" value="2" id="earlier_date">
                                        <input type="hidden" value="<?php echo date('Y-m-d');?>" id="today">
                                        <input type="hidden" value="<?php echo date('Y-m-d', strtotime(date('Y-m-01', time()) . ' +2 month -1 day'));?>" id="expire_day">
                                        <input type="hidden" value="<?php echo ($goods['date_price']); ?>" id="date_price_data" name="date_price_data">
                                        <div class="date_table" id="J_date_table">
                                            <s class="close">隐藏</s>
                                            <div class="hd">
                                                <ul>
                                                    <li>星期日</li>
                                                    <li>星期一</li>
                                                    <li>星期二</li>
                                                    <li>星期三</li>
                                                    <li>星期四</li>
                                                    <li>星期五</li>
                                                    <li>星期六</li>
                                                </ul>
                                            </div>
                                            <script id="date_price_template" type="text/date_price">
                                                <div class="month_row">
                                                    <div class="sd">
                                                        <p class="year">$year年</p>
                                                        <p class="month">$month月</p>
                                                    </div>
                                                    <div class="bd">
                                                        <ul class="clearfix" id="date_loading">$lis</ul>
                                                    </div>
                                                </div>
                                            </script>
                                            <div class="fn-clear"></div>
                                        </div>
                                    </div>
                                </dl>
                        <?php } ?>
                        <p class="btn">
                            <a class="go_btn buy fl" rel="nofollow" onclick="ShowDiv(baom)">
                                <span>马上报名&gt;&gt;</span>
                            </a>
                        </p>
                        <s class="tel">或直接拨打<em><?php echo C('WEB_SITE_TEL');?></em>咨询/预订</s>
                </div>
                </div>
            </div>
        </div>
        <div>
            <div class="bady-part col-md-9">
                <div class="bady-tab bady_bg clear" id="bady-tab">
                    <ul class="fl" id="tabs">
                        <?php if(!is_null($goods['item_price_body'])){ ?><li><a title="tab0">费用说明</a></li><?php } ?>
                        <li><a title="tab1"><?php if($goods['goods_type']==1){ ?>线路行程<?php }else{ ?>签证内容<?php } ?></a></li>
                        <?php if(is_array($goods_extra)): $k = 0; $__LIST__ = $goods_extra;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$extra): $mod = ($k % 2 );++$k;?><li><a title="tab<?php echo ($k+1); ?>"><?php echo ($extra["name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                    <div class="gobuy fr buy">
                        <p class="price fl">
                            <em class="yang">￥</em>
                            <span class="jd-current" id="jd-current"><?php echo ($goods['discount_price']); ?></span></p>
                            <a class="btn  fl" rel="nofollow" onclick="ShowDiv(baom)">
                            <span>马上报名&gt;&gt;</span>
                        </a>
                    </div>
                </div>

                <div class="con">
                    <div id="content">
                        <?php if(!is_null($goods['item_price_body'])){ ?>
                            <div id="tab0" class="tab">
                                <?php echo ($goods['item_price_body']); ?>
                            </div>
                        <?php } ?>
                        <div id="tab1" class="tab">
                            <?php if($goods['body_type']==1){ echo ($goods['item_body']); }else{ if(is_array($goods['days_body'])): $k = 0; $__LIST__ = $goods['days_body'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$days): $mod = ($k % 2 );++$k;?><div class="cpdetail_con_dayBox">
    <h3 class="cpdetail_xcjs_day_city" id="journey_3"><span><i>D</i><?php echo ($k); ?></span><?php echo ($days["name"]); ?></h3>
    <div class="cpdetail_xcjs_day_xc"><span class="cpdetail_xcjs_sancan icon"></span><b>三餐：</b>
    	早餐：<b><?php if(array_key_exists(0,$days["eat"])){ ?><font color="#3bb41c">包含</font><?php }else{ ?><font color="#fb9f28">敬请自理</font><?php } ?></b> &nbsp;&nbsp; 
    	午餐：<b><?php if(array_key_exists(0,$days["eat"])){ ?><font color="#3bb41c">包含</font><?php }else{ ?><font color="#fb9f28">敬请自理</font><?php } ?></b> &nbsp;&nbsp; 
    	晚餐：<b><?php if(array_key_exists(0,$days["eat"])){ ?><font color="#3bb41c">包含</font><?php }else{ ?><font color="#fb9f28">敬请自理</font><?php } ?></b></div>
    <div class="cpdetail_xcjs_day_xc"><span class="cpdetail_xcjs_zhusu icon"></span><b>住宿：</b><?php echo ($days["sleep"]); ?></div>
    <div class="cpdetail_xcjs_day_xc clearfix">
        <span class="cpdetail_xcjs_jingdian icon"></span>
            <div class="cpdetail_xcjs_day_xc_jingdian">
               <?php echo ($days["content"]); ?>
            </div>
    </div>
</div><?php endforeach; endif; else: echo "" ;endif; } ?>
                        </div>
                        <?php if(is_array($goods_extra)): $k = 0; $__LIST__ = $goods_extra;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$extra): $mod = ($k % 2 );++$k;?><div id="tab<?php echo ($k+1); ?>" class="tab">
                                <?php echo ($extra["content"]); ?>
                            </div><?php endforeach; endif; else: echo "" ;endif; ?>
                    </div>

                </div>
                <script>
                    $(document).ready(function() {
                        $("#content div.tab").hide(); // Initially hide all content
                        $("#tabs li a:first").attr("class","active"); // Activate first tab
                        $("#content div:first").fadeIn(); // Show first tab content
                        
                        $('#tabs a').click(function(e) {
                            e.preventDefault();        
                            $("#content div.tab").hide(); //Hide all content
                            $("#tabs li a").attr("class",""); //Reset id's
                            $(this).parent().find("a").attr("class","active"); // Activate this
                            $('#' + $(this).attr('title')).fadeIn(); // Show content for current tab
                        });
                        $('#add_goods').click(function(e) {
                            e.preventDefault();        
                            $("#content div.tab").hide(); //Hide all content
                            $("#tabs li a").attr("class",""); //Reset id's
                            //$(this).parent().find("a").attr("class","active"); // Activate this
                            $('#tab0').fadeIn(); // Show content for current tab
                        });
                    });
                </script>
            </div>
            <div class="hot_box fr col-md-3">
                <div class="hot_goods">
                    <h3>
                        <div class="line"></div>
                        <div class="line-txt">推荐线路</div>
                    </h3>
                    <?php if(is_array($hot_goods)): $i = 0; $__LIST__ = $hot_goods;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><div>
                            <a target="_blank" href="<?php echo U('goods/info',array('id'=>$v['goods_id']));?>">
                                <img src="<?php echo ($v["pic_url"]); ?>" alt="<?php echo ($v["title"]); ?>">
                                <div class="hot_price">
                                    <em class="hot_yang">￥</em>
                                    <em class="hot_num"><?php echo ($v["discount_price"]); ?></em>
                                </div>
                            </a>
                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <!-- /主体 -->
    <script type="text/javascript" src="/ke361/Public/Home/js/jquery.sticky.js"></script>
    <script type="text/javascript"> // sticky nav bar 
      $(function(){
        $("div#bady-tab").sticky({topSpacing:0});
      });
    </script>

</div>
<div id="baom" style="display:none">
<div id="baom_bg" onclick="CloseDiv()"></div>
<script language="javascript" type="text/javascript" src="/ke361/Public/Home/js/WdatePicker.js"></script>
    <div id="bao_content">
    <div class="close" id="close" onclick="CloseDiv()" title="关闭">X</div>
    <form action="<?php echo U('Goods/info',array('id'=>$goods['goods_id'],'add'=>'do'));?>" method="post">
    <ul>
        <li>
            <h2>&nbsp;===&nbsp;旅游在线预定&nbsp;===</h2>
        </li>
        <li>
            <label class="normal">旅游线路：</label>
            <input class="normal-input title" readonly="" value="<?php echo ($goods["title"]); ?>"  autocomplete="off" type="text">
        </li>
        <li>
            <label class="normal">出游时间：</label>
            <?php if($goods['goods_type']==1){ ?><input value="" class="normal-input" id="starttime" placeholder="请选择出行时间" name="time" readonly="">
            <?php }else{ ?>
            <input value="" class="normal-input" id="time" placeholder="请选择出行时间" name="time" autocomplete="off" type="text" onClick="WdatePicker({minDate:'%y-%M-%d'})">
            <?php } ?>
        </li>
        <li>
            <label class="normal">成人数：</label>
            <input value="1" class="normal-input" id="num" placeholder="/人" name="num" autocomplete="off" type="text">
            &nbsp;&nbsp;&nbsp;&nbsp;成人价：<font color="#f53"><span id="bao_pric_span"><?php echo ($goods["discount_price"]); ?></span>元/人</font>
        </li>
        <li>
            <label class="normal">小孩数：</label>
            <input value="0" class="normal-input" id="child" placeholder="/人" name="child" autocomplete="off" type="text">
            &nbsp;&nbsp;&nbsp;&nbsp;小孩价： <font color="#f53"><span id="bao_pric_child_span"><?php echo ($goods["child_price"]); ?></span>元/人</font><br>&nbsp;&nbsp;&nbsp;&nbsp;（12周岁以下为小孩）
        </li>
        <li>
            <label class="normal">您的姓名：</label>
            <input value="" class="normal-input" id="name" placeholder="请输入您的姓名" name="name" autocomplete="off" type="text">
            &nbsp;&nbsp;&nbsp;&nbsp;* 正确的联系人能帮助我们更快的联系到您
        </li>
        <li>
            <label class="normal">您的电话：</label>
            <input value="" class="normal-input" id="tel" placeholder="请输入您的手机号" name="tel" autocomplete="off" type="text">
            &nbsp;&nbsp;&nbsp;&nbsp;* 推存填写手机号码，方便我们联系到您
        </li>
        <li>
            <label class="normal">您的邮件：</label>
            <input value="" class="normal-input" id="email" placeholder="请输入您的邮箱" name="email" autocomplete="off" type="text">
            &nbsp;&nbsp;&nbsp;&nbsp;* 请填写你常用的邮箱，及时收取旅游优惠信息！
        </li>
        <li>
            <label class="normal">您的地址：</label>
            <input value="" class="normal-input" id="address" placeholder="请输入您的地址" name="address" autocomplete="off" type="text">
            &nbsp;&nbsp;&nbsp;&nbsp;* 非常重要，方便我们上门接送！
        </li>
        <li>
            <label class="normal">备注信息：</label>
            <textarea name="desc">请填写您的留言</textarea>
        </li>
        <li>
            <label class="normal"></label>
            <div class="btn">
                <input class="sub smt-o" value="提交" autocomplete="off" type="submit">
            </div>
        </li>
    </ul>
    </form>
    </div>
    <script type="text/javascript">
//弹出隐藏层
function ShowDiv(show_div){
    $("#baom").css("display","block");//.css("width","100%").css("height","100%");
};
//关闭弹出层
function CloseDiv()
{
     $("#baom").css("display","none");
};
$().ready(function(){
    $("#time").blur(function(){if($(this).val() == "") $(this).focus()});
    $("#num").blur(function(){if($(this).val() == "") $(this).focus()});
    $("#child").blur(function(){if($(this).val() == "") $(this).focus()});
    $("#name").blur(function(){if($(this).val() == "") $(this).focus()});
    $("#tel").blur(function(){if($(this).val() == "") $(this).focus()});
    $("#email").blur(function(){if($(this).val() == "") $(this).focus()});
    $("#address").blur(function(){if($(this).val() == "") $(this).focus()});

    $(".sub").click(function(){
        if($("#time").val() == ""){
            $("#time").focus();
            return false;
        }
        if($("#num").val() == ""){
            $("#num").focus();
            return false;
        }
        if($("#child").val() == ""){ 
            $("#child").focus();
            return false;
        }
        if($("#name").val() == ""){
            $("#name").focus();
            return false;
        }
        if($("#tel").val() == ""){
            $("#tel").focus();
            return false;
        }
        if($("#email").val() == ""){
            $("#email").focus();
            return false;
        }
        if($("#address").val() == ""){
            $("#address").focus();
            return false;
        }
    });
});
</script>
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
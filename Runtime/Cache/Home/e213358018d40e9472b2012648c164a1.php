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

	 <link rel="stylesheet" type="text/css" href="/ke361/Public/Home/New/css/login.css">
	 <link rel="stylesheet" type="text/css" href="/ke361/Public/Home/New/css/list.css">

   
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

	

	
	
	
<div class="container user-center">
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
    <a class="list-group-item" href="<?php echo U('User/index');?>"><i class="fa fa-list-alt"></i> 用户信息</a>
    <a class="list-group-item" href="<?php echo U('User/resetpassword');?>"><i class="fa fa-lock"></i> 修改密码</a>
    <a class="list-group-item" href="<?php echo U('User/avatar');?>"><i class="fa fa-user"></i> 编辑头像</a>
    <a class="list-group-item" href="<?php echo U('User/favor');?>"><i class="fa fa-star"></i> 我的收藏</a>
    <a class="list-group-item" href="<?php echo U('User/orders');?>"><i class="fa fa-star"></i> 我的订单</a>
</div>
        </div>
        <div class="col-md-10">
        	<div class="list790">
		        <h3>我的订单</h3>
		        <div class="tag_con" id="js_tag_con">                                                                        
		            <div class="tu_wen">
		                <ul>
		                    <?php if(is_array($orders)): $i = 0; $__LIST__ = $orders;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods): $mod = ($i % 2 );++$i; if($goods["goods_type"] == 1){ ?>
		                    <li>
		                        <div class="pic">
		                            <a href="<?php echo U('Goods/info',array('id'=> $goods["goods_id"]));?>" target="_blank" title="<?php echo ($goods["title"]); ?>">
		                                <img src="<?php echo ($goods['pic_url']); ?>" border="0" alt="<?php echo ($goods["title"]); ?>" width="75" height="50" original="<?php echo ($goods['pic_url']); ?>" style="display: block;">
		                            </a>
		                        </div>
		                        <div class="type">
		                            [品质游]<a href="<?php echo U('Goods/info',array('id'=> $goods["goods_id"]));?>" target="_blank"><?php echo ($goods["title"]); ?></a>                
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
		                                    <img src="<?php echo ($goods['pic_url']); ?>" width="165" height="110" alt="<?php echo ($goods["title"]); ?>" original="<?php echo ($goods['pic_url']); ?>" style="display: block;">
		                                </a>
		                            </div>
		                            <div class="basic">
		                                <strong><a href="<?php echo U('Goods/info',array('id'=> $goods["goods_id"]));?>" target="_blank" title="<?php echo ($goods["title"]); ?>"><?php echo ($goods["title"]); ?></a></strong>
		                                <p>办理时间：<?php echo ($goods["days"]); ?>天 有效期：<?php echo ($goods["aheaddays"]); ?>天 最多停留：<?php echo ($goods["maxdays"]); ?>天</p>
		                                <p>签证面试：<?php if($goods['audition']==2){ ?>不<?php } ?>需要 邀请函：<?php if($goods['invite']==2){ ?>不<?php } ?>需要 受理范围：<?php echo ($goods["city"]); ?></p>
		                            </div>
		                            <div class="clear"></div>
		                        </div>
		                        <div>
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
		                        </div>
		                        <?php } ?>
		                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
		                </ul>
		            </div>
		        </div>
		    </div>
        <div class="pagination clear">
            
        </div>
    </div>
  </div>
  </div>
    <script>
    $("img.lazy").lazyload({threshold:0,failure_limit:30,placeholder : "/ke361/Public/Home/images/blank.png",});
    
    $(".goods-list li").hover(
    function(){
       //当鼠标放上去的时候,程序处理
       $(this).addClass("hover1 hover");
    },
    function(){
       //当鼠标离开的时候,程序处理
       $(this).removeClass("hover1 hover");
    });	

</script>

	
	
	
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
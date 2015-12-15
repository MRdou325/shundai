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

	

	
	
	
     <div class="row">
        <div class="col-md-12">
            <div class="diy_bj">
                <div class="diy_step">
                    <div class="diy_lc">
                        <div class="top">
                            <img src="http://xnxwcdn.cncn.net/images/front/diy_step_men.png" class="notLoadImg">
                            <div class="tit">旅游定制</div>
                            <p>旅游定制 <i>●</i> 让出游更简单</p>
                        </div>

                        <ul>
                            <li class="on"><i class="i1"></i>1.提交旅行需求</li>
                            <li class="dian">●<br>●<br>●<br>●</li>
                            <li><i class="i2"></i>2.填写联系方式</li>
                            <li class="dian">●<br>●<br>●<br>●</li>
                            <li><i class="i3"></i>3.为您量身定制方案</li>
                        </ul>
                    </div>

                    <div class="diy_rc">

                        <iframe name="add_iframe" style="display: none;"></iframe>
                        <form action="/diy/add" method="post" id="diy_form" target="add_iframe">
                            <div class="j_diy_step" style="display: block; margin-top: 0px; opacity: 1;">
                                <ul class="diy_list">
                                    <li>
                                    <label>想去哪儿</label>
                                    <div class="bor">
                                        <input name="to_city" class="txt j_yz_bt j_yz_size" data-max_size="20" data-ts="请输入您想去的城市、景点" placeholder="填写您想去的城市、景点" error="true">
                                    </div><span class="diy_error">请输入您想去的城市、景点</span>
                                    </li>
                                    <li>
                                    <label>从哪里出发</label>
                                    <div class="bor">
                                        <input name="from_city" class="txt j_yz_bt j_yz_size" data-max_size="20" data-ts="请输入您的出发城市" placeholder="填写您的出发城市" error="true">
                                    </div><span class="diy_error">请输入您的出发城市</span>
                                    </li>
                                    <li>
                                    <label>什么时候去</label>
                                    <div class="bor">
                                        <label class="input_select" style="display: none;">
                                            <select class="sel" name="start_year"><option value="2015">2015年</option><option value="2016">2016年</option></select>
                                        </label><span class="dropdown J_dropdown" id="dropdown7403"><span class="select J_select" data-id="7403" style="width:97px">2015年<a href="javascript:;"><i class="icon_menu"></i></a></span></span>
                                        <label class="input_select" style="display: none;">
                                            <select class="sel" name="start_month"><option value="10">10月</option><option value="11">11月</option><option value="12">12月</option></select>
                                        </label><span class="dropdown J_dropdown" id="dropdown7919"><span class="select J_select" data-id="7919" style="width:97px">10月<a href="javascript:;"><i class="icon_menu"></i></a></span></span>
                                        <label class="input_select" style="display: none;">
                                            <select class="sel bor_not" name="start_day"><option value="34">下旬</option><option value="35">不确定</option><option value="23">23号</option><option value="24">24号</option><option value="25">25号</option><option value="26">26号</option><option value="27">27号</option><option value="28">28号</option><option value="29">29号</option><option value="30">30号</option><option value="31">31号</option></select>
                                        </label><span class="dropdown J_dropdown" id="dropdown4431"><span class="select J_select" data-id="4431" style="width:97px">下旬<a href="javascript:;"><i class="icon_menu"></i></a></span></span>
                                    </div>
                                    </li>
                                    <li>
                                    <label>计划玩几天</label>
                                    <div class="bor j_sub_add">
                                        <div class="sub">-</div>
                                        <input name="day_num" class="day_num" data-unit="天" value="1天" readonly="readonly">
                                        <div class="add">+</div>
                                    </div>
                                    <span class="rcon rts"><input type="checkbox" name="day_num_change" value="1">可根据行程安排适当增减</span>
                                    </li>
                                    <li>
                                    <label>几人出游</label>
                                    <div class="bor lban j_sub_add">
                                        <div class="sub">-</div>
                                        <input name="adult_num" class="day_num" data-unit="位成人" value="2位成人" readonly="readonly">
                                        <div class="add">+</div>
                                    </div>
                                    <div class="bor rban j_sub_add">
                                        <div class="sub" data-min_size="0">-</div>
                                        <input name="child_num" class="day_num" data-unit="位儿童" value="0位儿童" readonly="readonly">
                                        <div class="add">+</div>
                                    </div>
                                    </li>
                                    <li>
                                    <label>人均预算</label>
                                    <div class="bor">
                                        <input name="budget" class="txt txMin j_yz_num j_yz_size" data-max_size="6" data-ts="请输入正确的人均预算" placeholder="不确定可不填写" error="false">
                                        <span class="rcon">元/每人</span>
                                    </div>
                                    </li>
                                    <li class="max">
                                    <label>其他要求</label>
                                    <div class="bor j_textarea">
                                        <p style="display: block;">您可以补充您的旅游需求，如：行程安排不要太紧迫。</p>
                                        <textarea name="remark" class="j_yz_size" data-max_size="500" error="false"></textarea>
                                    </div>
                                    </li>
                                    <li class="an"><a class="btn_blue j_step_down">下一步</a></li>
                                </ul>
                            </div>

                            <div class="j_diy_step">
                                <ul class="diy_list diy_list_min">
                                    <li>
                                    <label>联系人姓名</label>
                                    <div class="bor">
                                        <input name="realname" class="txt j_yz_bt" data-ts="请填写联系人姓名" placeholder="填写真实姓名，方便我们称呼您" value="">
                                    </div>
                                    </li>
                                    <li>
                                    <label>手机号</label>
                                    <div class="bor">
                                        <input type="hidden" class="J_mobile" value="">
                                        <input name="mobile" class="txt j_yz_mobile" maxlength="11" data-ts="请填写联系人的手机号码" value="">
                                    </div>
                                    </li>
                                    <li class="yzm">
                                    <label>手机验证码</label>
                                    <div class="bor">
                                        <input name="checkcode" data-ts="验证码错误" class="txt j_yz_yzm">
                                    </div>
                                    <div class="btn_yzm j_yzm" onclick="dx_yzm(60,'发送验证码')">发送验证码</div>
                                    </li>
                                    <li class="an"><a class="btn_bor j_step_up">上一步</a><a class="btn_blue J_submit">提交需求</a></li>
                                </ul>
                                <img class="botImg notLoadImg" src="http://xnxwcdn.cncn.net/images/front/diy_list_min_bj.png">
                            </div>
                        </form>

                        <div class="j_diy_step">
                            <div class="diy_success">
                                <div class="diy_suc"><span>您的需求已经提交成功</span></div>
                                <p class="diy_suc_p">我们将尽快与您联系，并为您设计方案。方案设计好后将以短信通知您，请您注意查收。</p>
                                <div class="diy_suc_an">接下来您可以：<a href="/" class="btn_bor">随便看看</a> <a href="/member/diy" class="btn_blue">查看我的定制需求</a></div>
                            </div>
                                            <ul class="qq_list">
                                                    <li>
                                <a href="http://wpa.qq.com/msgrd?v=1&amp;uin=2851609283&amp;site=qq&amp;menu=yes" target="_blank" rel="nofollow"><img src="http://wpa.qq.com/pa?p=1:2851609283:4" border="0" align="bottom" class="pic notLoadImg" original="http://wpa.qq.com/pa?p=1:2851609283:4" style="display: inline;">文钊</a> <span>0592-2263392</span>
                                </li>
                                                    <li>
                                <a href="http://wpa.qq.com/msgrd?v=1&amp;uin=2851609285&amp;site=qq&amp;menu=yes" target="_blank" rel="nofollow"><img src="http://wpa.qq.com/pa?p=1:2851609285:4" border="0" align="bottom" class="pic notLoadImg" original="http://wpa.qq.com/pa?p=1:2851609285:4" style="display: inline;">肇诚</a> <span>0592-2263383</span>
                                </li>
                                                </ul>
                                        </div>

                    </div>

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
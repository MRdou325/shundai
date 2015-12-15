<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo ($meta_title); ?>|管理平台</title>
    <link href="/ke361/Public/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/ke361/Public/Admin/css/bootstrap.min.css" rel="stylesheet" />
    <!--<script type="text/javascript" src="/ke361/Public/Admin/js/bootstrap-switch.min.js"></script>
	<link href="/ke361/Public/Admin/css/bootstrap-switch.min.css" rel="stylesheet" />-->
    
    <link rel="stylesheet" type="text/css" href="/ke361/Public/Admin/css/base.css" media="all">
    <link rel="stylesheet" type="text/css" href="/ke361/Public/Admin/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="/ke361/Public/Admin/css/module.css">
    <link rel="stylesheet" type="text/css" href="/ke361/Public/Admin/css/style.css" media="all">
	<link rel="stylesheet" type="text/css" href="/ke361/Public/Admin/css/<?php echo (C("COLOR_STYLE")); ?>.css" media="all">
   	
		
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/ke361/Public/Admin/js/jquery1.10.2.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <!--[if gte IE 9]>
    <!---->
    <script type="text/javascript" src="/ke361/Public/static/jquery-2.0.3.min.js"></script> 
	<!--<![endif]-->
	<script type="text/javascript" src="/ke361/Public/Admin/js/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="/ke361/Public/Admin/js/jquery.cookie.js"></script>
	
	
    
</head>
<body>
    <!-- 头部 -->
    <div class="header">
        <!-- Logo -->
        <span class="logo"></span>
        <!-- /Logo -->

        <!-- 主导航 -->
        <ul class="main-nav">
            <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>"><a href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <!-- /主导航 -->
		
        <!-- 用户栏 -->
        <div class="user-bar">
            <a href="javascript:;" class="user-entrance"></a>
            <ul class="nav-list user-menu hidden">
                <li class="manager">你好，<em title="<?php echo session('user_auth_admin.username');?>"><?php echo session('user_auth_admin.username');?></em></li>
                <li><a href="<?php echo U('User/updatePassword');?>">修改密码</a></li>
                <li><a href="<?php echo U('User/updateNickname');?>">修改昵称</a></li>
                <li><a href="<?php echo U('Public/logout');?>">退出</a></li>
            </ul>
        </div>
        <div class="web-index">
			<a href="<?php echo U('Home/Index/index');?>" target="_blank">网站首页</a>
		</div>
    </div>
    <!-- /头部 -->

    <!-- 边栏 -->
    <div class="sidebar">
        <!-- 子导航 -->
        
            <div id="subnav" class="subnav">
                <?php if(!empty($_extra_menu)): ?>
                    <?php echo extra_menu($_extra_menu,$__MENU__); endif; ?>
                <?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
                    <?php if(!empty($sub_menu)): if(!empty($key)): ?><h3><i class="icon icon-unfold"></i><?php echo ($key); ?></h3><?php endif; ?>
                        <ul class="side-sub-menu">
                            <?php if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li>
                                    <a class="item" href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a>
                                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul><?php endif; ?>
                    <!-- /子导航 --><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        
        <!-- /子导航 -->
    </div>
    <!-- /边栏 -->

    <!-- 内容区 -->
    <div id="main-content">
        <div id="top-alert" class="fixed alert alert-error" style="display: none;">
            <button class="close fixed" style="margin-top: 4px;">&times;</button>
            <div class="alert-content">这是内容</div>
        </div>
        <div id="main" class="main">
            
            <!-- nav -->
            <?php if(!empty($_show_nav)): ?><div class="breadcrumb">
                <span>您的位置:</span>
                <?php $i = '1'; ?>
                <?php if(is_array($_nav)): foreach($_nav as $k=>$v): if($i == count($_nav)): ?><span><?php echo ($v); ?></span>
                    <?php else: ?>
                    <span><a href="<?php echo ($k); ?>"><?php echo ($v); ?></a>&gt;</span><?php endif; ?>
                    <?php $i = $i+1; endforeach; endif; ?>
            </div><?php endif; ?>
            <!-- nav -->
            

            
    <!-- ace styles -->


	<!--[if lte IE 8]>
	  <link rel="stylesheet" href="/ke361/Public/Admin/css/ace-ie.min.css" />
	<![endif]-->
<link href="/ke361/Public/Admin/css/date_price.css" rel="stylesheet" type="text/css">
<link href="/ke361/Public/Admin/css/date_select.css" rel="stylesheet" type="text/css">
<script src="/ke361/Public/Admin/js/jquery-migrate1.2.1.js"></script>
<script type="text/javascript">
     var jQuery_1_10_2 = $;
   
</script>

               <script type="text/javascript" src="/ke361/Public/static/uploadify/jquery.uploadify.min.js"></script>           
                        <form class="form-horizontal" role="form" action="<?php echo U('Goods/edit');?>" method="post" enctype="multipart/form-data">
                          <?php echo setParam(array('goods_id'=>$goods['goods_id']));?>
                          <p><h2>基本信息</h2></p>
                          <hr>
                           <div class="form-group">
	                          <label class="col-sm-2 control-label no-padding-right" for="form-field-1">图片<span style="color:#f00;">*</span></label>
							  <div class="col-sm-9">
									<input type="file" id="upload_picture_pic_url">
									<input type="hidden" name="pic_url" id="pic_url" value="<?php echo ($goods[pic_url]); ?>"/>
									<div class="upload-img-box">
									<?php if(!empty($goods["pic_url"])): ?><div class="upload-pre-item"><img src="<?php echo ($goods[pic_url]); ?>"/></div><?php endif; ?>
									</div>
							  </div>	
								<script type="text/javascript">
								//上传图片
							    /* 初始化上传插件 */
								$("#upload_picture_pic_url").uploadify({
							        "height"          : 30,
							        "swf"             : "/ke361/Public/static/uploadify/uploadify.swf",
							        "fileObjName"     : "download",
							        "buttonText"      : "上传图片",
							        "uploader"        : "<?php echo U('File/uploadPicture',array('session_id'=>session_id()));?>",
							        "width"           : 120,
							        
							        "removeTimeout"	  : 1,
							        "fileTypeExts"	  : "*.jpg; *.png; *.gif;",
							        "onUploadSuccess" : uploadPicture,
							        "onFallback" : function() {
							            alert('未检测到兼容版本的Flash.');
							        }
							    });
								function uploadPicture(file, data){
							    	var data = $.parseJSON(data);
							    	var src = '';
							    	
							        if(data.status){
							        	
							        	$("#pic_url").val(data.path);
							        	src = data.url || '/ke361' + data.path
							        	$("#pic_url").parent().find('.upload-img-box').html(
							        		'<div class="upload-pre-item"><img src="' + src + '"/></div>'
							        	);
							        } else {
							        	updateAlert(data.info);
							        	setTimeout(function(){
							                $('#top-alert').find('button').click();
							                $(that).removeClass('disabled').prop('disabled',false);
							            },1500);
							        }
							    }
								</script>
							</div>
                           
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">名称<span style="color:#f00;">*</span></label>
                                <div class="col-sm-8"><input class="col-sm-12 form-control" type="text" name="title" value="<?php echo ($goods['title']); ?>"></div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">类型<span style="color:#f00;">*</span></label>   
                                <div class="col-sm-2">
                                    <select class="col-sm-12 form-control" name="goods_type" id="type">
                                        <option value="1" <?php if($goods['goods_type']==1){ ?>selected<?php } ?>>普通线路</option>   
                                        <option value="2" <?php if($goods['goods_type']==2){ ?>selected<?php } ?>>签证</option>                                     
                                    </select>
                                </div>
                                <label class="col-sm-1 control-label no-padding-right">选择分类<span style="color:#f00;">*</span></label>
                                <div class="col-sm-2">
                                    <select class="col-sm-12 form-control" name="cate_id">
                                        <option value="0">选择分类</option>
                                        <?php if(is_array($category)): $i = 0; $__LIST__ = $category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><option value="<?php echo ($data['id']); ?>" <?php if($data['id'] == $goods["cate_id"]){ ?>selected<?php } ?>>
                                        	<?php $__FOR_START_20781__=1;$__FOR_END_20781__=$data["level"];for($i=$__FOR_START_20781__;$i < $__FOR_END_20781__;$i+=1){ if($i+1 == $data['level']){ ?>&nbsp;|-<?php }else{ ?>&nbsp;&nbsp;&nbsp;<?php } } ?>	
                                        		<?php echo ($data['category_name']); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>                                        
                                    </select>
                                    <script type='text/javascript'>
                                        $("select[name='sort_id'] option[value='<?php echo $goods[sort_id] ?>']").attr('selected','selected');
                                    </script>
                                </div>
                            
                                <label class="col-sm-1 control-label no-padding-right">选择专题<span style="color:#f00;">*</span></label>
                                <div class="col-sm-2">
                                    <select class="col-sm-12 form-control" name="tid">
                                        <option value="0">选择专题</option>
                                        <?php if(is_array($topic)): $i = 0; $__LIST__ = $topic;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><option value="<?php echo ($data['tid']); ?>"><?php echo ($data['name']); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>                                        
                                    </select>
                                    <script type='text/javascript'> 
                                        $("select[name='tid'] option[value='<?php echo $goods[tid] ?>']").attr('selected','selected');
                                    </script>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">原价<span style="color:#f00;">*</span></label>	
                                <div class="col-sm-2"><input class="col-sm-10 form-control" type="text" name="price" value="<?php echo ($goods['price']); ?>">元</div>
                            
                                <label class="col-sm-1 control-label no-padding-right">折扣价格<br></label>	
                                <div class="col-sm-2"><input class="col-sm-11 form-control" type="text" name="discount_price" value="<?php echo ($goods['discount_price']); ?>">元</div>
                            

                            <div class="form-group type-1" <?php if($goods['goods_type']==2){ ?>style="display:none"<?php } ?>>
                                <label class="col-sm-1 control-label no-padding-right">儿童价</label> 
                                <div class="col-sm-2"><input class="col-sm-11 form-control" type="text" name="child_price" value="<?php echo ($goods['child_price']); ?>">元</div>
                            </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" id="city"><?php if($goods['goods_type']==2){ ?>所属领区<?php }else{ ?>出发城市<?php } ?></label> 
                                <div class="col-sm-2"><input class="col-sm-12 form-control" type="text" name="city" value="<?php echo ($goods['city']); ?>"></div>

                                <label class="col-sm-1 control-label no-padding-right" id="aheaddays"><?php if($goods['goods_type']==2){ ?>有效期<?php }else{ ?>提前预定<?php } ?></label> 
                                <div class="col-sm-2"><input class="col-sm-11 form-control" type="text" name="aheaddays" value="<?php echo ($goods['aheaddays']); ?>">天</div>

                                <label class="col-sm-1 control-label no-padding-right" id="days"><?php if($goods['goods_type']==2){ ?>办理时间<?php }else{ ?>行程天数<?php } ?></label> 
                                <div class="col-sm-2"><input class="col-sm-11 form-control" type="text" name="days" value="<?php echo ($goods['days']); ?>">天</div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" id="traffic"><?php if($goods['goods_type']==2){ ?>受理范围<?php }else{ ?>交通方式<?php } ?></label> 
                                <div class="col-sm-2">
                                    <div class="type-2" <?php if($goods['goods_type']==1){ ?>style="display:none"<?php } ?>>
                                        <input class="col-sm-12 form-control" type="text" name="traffic2" value="<?php echo (implode($goods['traffic'],"")); ?>">
                                    </div>
                                    <div class="type-1" <?php if($goods['goods_type']==2){ ?>style="display:none"<?php } ?>>
                                        <select name="traffic[]" class="col-sm-6">
                                            <option value="1" <?php if($goods['traffic'][0] == 1){ ?>selected<?php } ?>>飞机去</option>
                                            <option value="2" <?php if($goods['traffic'][0] == 2){ ?>selected<?php } ?>>火车去</option>
                                            <option value="3" <?php if($goods['traffic'][0] == 3){ ?>selected<?php } ?>>汽车去</option>
                                            <option value="4" <?php if($goods['traffic'][0] == 4){ ?>selected<?php } ?>>轮船去</option>
                                            <option value="5" <?php if($goods['traffic'][0] == 5){ ?>selected<?php } ?>>动车去</option>
                                            <option value="6" <?php if($goods['traffic'][0] == 6){ ?>selected<?php } ?>>高铁去</option>
                                        </select>
                                        <select name="traffic[]" class="col-sm-6">
                                            <option value="1" <?php if($goods['traffic'][1] == 1){ ?>selected<?php } ?>>飞机回</option>
                                            <option value="2" <?php if($goods['traffic'][1] == 2){ ?>selected<?php } ?>>火车回</option>
                                            <option value="3" <?php if($goods['traffic'][1] == 3){ ?>selected<?php } ?>>汽车回</option>
                                            <option value="4" <?php if($goods['traffic'][1] == 4){ ?>selected<?php } ?>>轮船回</option>
                                            <option value="5" <?php if($goods['traffic'][1] == 5){ ?>selected<?php } ?>>动车回</option>
                                            <option value="6" <?php if($goods['traffic'][1] == 6){ ?>selected<?php } ?>>高铁回</option>
                                        </select>
                                    </div>
                                </div>
                            

                            <div class="form-group col-sm-3 type-2" <?php if($goods['goods_type']==2){ ?>style="display:block"<?php }else{ ?>style="display:none"<?php } ?>>
                                <label class="col-sm-4 control-label no-padding-right">最多停留</label> 
                                <div class="col-sm-8"><input class="col-sm-11 form-control" type="text" name="maxdays" value="<?php echo ($goods['maxdays']); ?>">天</div>
                            </div>

                            <div class="form-group col-sm-2 type-2" <?php if($goods['goods_type']==2){ ?>style="display:block"<?php }else{ ?>style="display:none"<?php } ?>>
                                <label class="col-sm-6 control-label no-padding-right">面试</label> 
                                <div class="col-sm-6">
                                    <select class="col-sm-12 form-control" name="audition">
                                        <option value="1" <?php if($goods['audition']==1){ ?>selected<?php } ?>>是</option>   
                                        <option value="2" <?php if($goods['audition']==2){ ?>selected<?php } ?>>否</option>                                     
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-sm-2 type-2" <?php if($goods['goods_type']==2){ ?>style="display:block"<?php }else{ ?>style="display:none"<?php } ?>>
                                <label class="col-sm-6 control-label no-padding-right">邀请函</label> 
                                <div class="col-sm-6">
                                    <select class="col-sm-12 form-control" name="invite">
                                        <option value="1" <?php if($goods['invite']==1){ ?>selected<?php } ?>>是</option>   
                                        <option value="2" <?php if($goods['invite']==2){ ?>selected<?php } ?>>否</option>                                     
                                    </select>
                                </div>
                            </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">标签<span style="color:#f00;">*</span></label>
                                <div class="col-sm-9">
                                    <?php if(is_array($tags)): $i = 0; $__LIST__ = $tags;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$tag): $mod = ($i % 2 );++$i;?><input type="checkbox" name="tag[]" value="<?php echo ($tag["id"]); ?>" <?php if(in_array($tag['id'], $mytag)){ ?>checked<?php } ?>><?php echo ($tag["name"]); ?>&nbsp;&nbsp;&nbsp;<?php endforeach; endif; else: echo "" ;endif; ?>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">状态<span style="color:#f00;">*</span></label>
                                <div class="col-sm-2">
                                    <select class="col-sm-12 form-control" name="status">
                                        <option selected="selected" value="1">显示</option>
                                        <option value="0">隐藏</option>
                                    </select>
                                    <script type='text/javascript'>
                                        $("select[name='state'] option[value='<?php echo $goods[state] ?>']").attr('selected','selected');
                                    </script>
                                </div>

                                <label class="col-sm-1 control-label no-padding-right">排序<span style="color:#f00;">*</span></label>
                                <div class="col-sm-2">
                                    <input class="col-sm-12 form-control" type="text" name="sort" value="<?php echo ($goods[goods_sort]); ?>">
                                </div>
                            </div>
                            <div class="type-1" <?php if($goods['goods_type']==2){ ?>style="display:none"<?php } ?>>
                            <p><h2>价格信息</h2></p>
                            <hr>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">价格说明 </label>
                                <div class="col-sm-8">
                                    <textarea class="col-sm-12" name="item_price_body" id="J_ForumPostCon" data-name="kind_body" placeholder="说两句~~" style="height:300px;visibility:hidden;"><?php echo stripslashes($goods['item_price_body']);?></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">线路报价 </label>
                                <div class="col-sm-8">
                                    <div class="pro_input date_price">
                                        <input type="hidden" value="2" id="earlier_date">
                                        <input type="hidden" value="<?php echo date("Y-m-d");?>" id="today">
                                        <input type="hidden" value="<?php echo date("Y-m-d", strtotime("+3 Month"));?>" id="expire_day">
                                        <input type="hidden" value="<?php echo ($goods["date_price"]); ?>" id="date_price_data" name="date_price_data">
                                        <a href="javascript:;" class="small_btn J_clear_all_price fr">清除所有报价</a>
                                        <ul class="tab_ul">
                                            <li id="J_batch" class="on">批量添加价格</li>
                                            <li id="J_range">添加指定时间段价格</li>
                                            <li id="J_quick">快速编辑模式</li>
                                        </ul>
                                                            <div class="date_table" id="J_date_table">
                                                                    <div class="operate_area J_operate_area">
                                                <div class="J_batch_area">
                                                    <div class="tp">
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_all_select"/>天天发团</label>
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select" value="1"/>周一</label>
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select" value="2"/>周二</label>
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select" value="3"/>周三</label>
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select" value="4"/>周四</label>
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select" value="5"/>周五</label>
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select" value="6"/>周六</label>
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select" value="0"/>周日</label>
                                                    </div>
                                                    <div class="bt">
                                                        <span>优惠价：<em>*</em></span><label class="input_text w_115"><input type="text" class="J_input_limit" data-limit_type="digits" name="price_cncn" value="0" maxlength="6"/></label>
                                                        <span>儿童价：</span><label class="input_text w_115"><input type="text" class="J_input_limit" data-limit_type="digits" name="price_cncn_child" value="0"  maxlength="6"/>
                                                        </label><a href="javascript:;" class="add_btn tag_btn m_l10" id="J_batch_add_by_week">添加</a>
                                                    </div>
                                                </div>
                                                <div class="J_date_area" style="display:none;">
                                                    <div class="tp">
                                                        <span>指定时间段：<em>*</em></span>
                                                        <label class="input_text input_calendar"><input type="text" data-min_date="<?php echo date("Y-m-d");?>" data-max_date="<?php echo date("Y-m-d", strtotime("+2 month"));?>"/></label>
                                                        <span>至</span>
                                                        <label class="input_text input_calendar"><input type="text" data-min_date="<?php echo date("Y-m-d", strtotime("+3 days"));?>" data-max_date="<?php echo date("Y-m-d", strtotime("+2 month"));?>"/></label>
                                                    </div>
                                                    <div class="tp" style="margin-left:90px">
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select1" value="1" checked />周一</label>
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select1" value="2" checked />周二</label>
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select1" value="3" checked />周三</label>
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select1" value="4" checked />周四</label>
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select1" value="5" checked />周五</label>
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select1" value="6" checked />周六</label>
                                                        <label class="input_checkbox"><input type="checkbox" class="J_week_select1" value="0" checked />周日</label>
                                                    </div>
                                                    <div class="bt" style="padding-left:80px;">
                                                        <span>优惠价：<em>*</em></span><label class="input_text w_115"><input type="text" class="J_input_limit" data-limit_type="digits" value="0"/></label>
                                                        <span class="m_l10">儿童价：</span><label class="input_text w_115"><input type="text" class="J_input_limit" data-limit_type="digits" value="0"/>
                                                        </label><a href="javascript:;" class="m_l10 tag_btn" id="J_batch_add_by_dateandweek" style="float:right">添加</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <script id="date_price_template" type="text/date_price">
                                                <div class="month_row" style="z-index:$z_index">
                                                    <div class="sd">
                                                        <p class="year">$year年</p>
                                                        <p class="month">$month月</p>
                                                    </div>
                                                    <div class="hd" $is_display>
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
                                                    <div class="bd">
                                                        <ul class="clearfix">$lis</ul>
                                                        <div class="add_price_dialog J_add_price_dialog">
                                                            <p>date</p>
                                                            <input type="text" class="youhui J_quick_edit_input"/>
                                                            <input type="text" class="child J_quick_edit_input"/>
                                                            <a class="ok_btn" href="javascript:;">确定</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </script>
                                        </div>
                                    </div>
                                </div>
                            </div></div>

                            <p><h2>内容信息</h2></p>
                            <hr>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">内容</label>

                                <link rel="stylesheet" href="/ke361/Public/Admin/addons/kindeditor/themes/default/default.css" />
                                <link rel="stylesheet" href="/ke361/Public/Admin/addons/kindeditor/plugins/code/prettify.css" />
                                <script charset="utf-8" src="/ke361/Public/Admin/addons/kindeditor/kindeditor.js"></script>
                                <script charset="utf-8" src="/ke361/Public/Admin/addons/kindeditor/lang/zh_CN.js"></script>
                                <script charset="utf-8" src="/ke361/Public/Admin/addons/kindeditor/plugins/code/prettify.js"></script>
                                <div class="col-sm-8">
                                    <ul id="myTab" class="nav nav-tabs">
                                       <li <?php if($goods['body_type'] ==1){ ?>class="active"<?php } ?>><a href="#home" data-name="home" data-toggle="tab" data-value="1">基本内容</a></li>
                                       <li <?php if($goods['body_type'] ==2){ ?>class="active"<?php } ?> id="type-1" <?php if($goods['goods_type']==2){ ?>style="display:none"<?php } ?>><a href="#J_edit_by_day_wrap" data-name="J_edit_by_day_wrap" data-toggle="tab" data-value="2">行程内容</a></li>
                                    </ul>
                                    <input type="hidden" id="body_type" name="body_type" value="<?php echo ($goods[body_type]); ?>">
                                    <div id="myTabContent" class="tab-content">
                                        <div class="tab-pane fade <?php if($goods['body_type'] ==1){ ?>in active<?php } ?>" id="home">
                                            <textarea class="col-sm-12" name="item_body" data-name="kind_body" style="height:500px;visibility:hidden;"><?php echo stripslashes($goods['item_body']);?></textarea>
                                        </div>
                                        <div class="tab-pane fade <?php if($goods['body_type'] ==2){ ?>in active<?php } ?>" id="J_edit_by_day_wrap">
                                        <?php if(is_array($goods['days_body'])): $k = 0; $__LIST__ = $goods['days_body'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$days_body): $mod = ($k % 2 );++$k;?><div class="row h_auto no_hover">
                                                <label for="" class="col-sm-2 pro_name">第<i><?php echo ($k); ?></i>天：</label>
                                                <div class="col-sm-6">
                                                    <label class="input_text w_470">
                                                        <input class="col-sm-12 form-control" name="xingcheng[<?php echo ($k-1); ?>][name]" type="text" value="<?php echo ($days_body["name"]); ?>" maxlength="30">
                                                    </label>
                                                </div>
                                                <div class="col-sm-2">
                                                    <a href="javascript:;" class="J_del_xingcheng del_btn">删除第<?php echo ($k); ?>天行程</a>
                                                </div>
                                            </div>
                                            <div class="row h_auto no_hover">
                                                <label for="" class="col-sm-2 pro_name">行程安排：<em>*</em></label>
                                                <div class="col-sm-9">
                                                    <textarea class="col-sm-12" style="height:250px;visibility:hidden;" name="xingcheng[<?php echo ($k-1); ?>][content]" data-name="kind_body" placeholder="说两句~~" id="J_xingcheng_con"><?php echo ($days_body["content"]); ?></textarea>
                                                </div>
                                            </div>
                                            <div class="row h_auto no_hover">
                                                <label for="" class="col-sm-2 pro_name">用餐：</label>
                                                <div class="col-sm-8">
                                                    <label class="input_checkbox" title="">
                                                        <input name="xingcheng[<?php echo ($k-1); ?>][eat][0]" type="checkbox" value="1" <?php if(array_key_exists(0, $days_body["eat"]) && $days_body["eat"]["0"]==1){ ?>checked<?php } ?>>早餐
                                                    </label><label class="input_checkbox" title="">
                                                        <input name="xingcheng[<?php echo ($k-1); ?>][eat][1]" type="checkbox" value="1" <?php if(array_key_exists(1, $days_body["eat"]) && $days_body["eat"]["1"]==1){ ?>checked<?php } ?>>中餐
                                                    </label><label class="input_checkbox" title="">
                                                        <input name="xingcheng[<?php echo ($k-1); ?>][eat][2]" type="checkbox" value="1" <?php if(array_key_exists(2, $days_body["eat"]) && $days_body["eat"]["2"]==1){ ?>checked<?php } ?>>晚餐
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="row h_auto no_hover">
                                                <label for="" class="col-sm-2 pro_name">住宿：</label>
                                                <div class="col-sm-8">
                                                    <label class="input_text w_135">
                                                        <input class="col-sm-4 form-control" name="xingcheng[<?php echo ($k-1); ?>][sleep]" type="text" value="<?php echo ($days_body["sleep"]); ?>" maxlength="30">
                                                    </label>
                                                </div>
                                            </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                            <div class="row no_hover">
                                                <div class="pro_input">
                                                <a href="javascript:;" class="tag_btn" id="J_add_xingcheng_days">添加第<?php echo ($goods["days_body_num"]); ?>天行程</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <script>
                                    KindEditor.ready(function (K) {
                                        var editor1 = K.create('textarea[data-name="kind_body"]', {
                                            cssPath: '/ke361/Public/Admin/addons/kindeditor/plugins/code/prettify.css',
                                            uploadJson: '/ke361/Public/Admin/addons/kindeditor/php/upload_json.php',
                                            fileManagerJson: '/ke361/Public/Admin/addons/kindeditor/php/file_manager_json.php',
                                            width:"100%",
                                            allowFileManager: true,
                                            afterChange: function (){
                                                var self = this;
                                                self.sync();
                                            }
                                        });
                                        prettyPrint();
                                    });
                                </script>
                            <p><h2>SEO信息</h2></p>
                            <hr>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">seo标题</label>    
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="seo_title" value="<?php echo ($goods['seo_title']); ?>"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">seo关键字</label>   
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="seo_keywords" value="<?php echo ($goods['seo_keywords']); ?>"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">seo内容</label>    
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="seo_description" value="<?php echo ($goods['seo_description']); ?>"></div>
                            </div>
                            <div class="clearfix form-actions">
                                <div class="col-md-offset-4 col-md-4">
                                    <button class="btn btn-info btn-block ajax-post" target-form="form-horizontal" type="submit">
                                        <i class="icon-ok bigger-110"></i>
                                        确认
                                    </button>
                                </div>
                            </div>
                        </form>
<script type="text/javascript">
    $(document).ready(function(){
        $('#type').change(function(){
            var val = $(this).val();
            if(val == 2)
            {
                $("div.type-2").show();
                $("div.type-1").hide();
                $("li#type-1").hide();
                $("#city").text("所属领区");
                $("#aheaddays").text("有效期");
                $("#days").text("办理时间");
                $("#traffic").text("受理范围");
                $("#myTabContent").children().attr("class", "tab-pane fade");
                $("#home").attr("class", "tab-pane fade in active");
            }
            else
            {
                $("div.type-2").hide();
                $("div.type-1").show();
                $("li#type-1").show();
                $("#city").text("出发城市");
                $("#aheaddays").text("提前预定");
                $("#days").text("行程天数");
                $("#traffic").text("交通方式");
            }
        });

        $("#myTab a").click(function(){
            var id = $(this).attr("data-name");
            var type = $(this).attr("data-value");
            $("#body_type").val(type);
            $("#myTab li").attr("class", "");
            $(this).parent("li").attr("class", "active");
            $("#myTabContent").children().attr("class", "tab-pane fade");
            $("#"+id).attr("class", "tab-pane fade in active");
        });
    });
</script> 
<script id="J_xingcheng_tem" type="text/xingcheng">
    <div class="row h_auto no_hover">
        <label for="" class="col-sm-2 pro_name">第<i>$day</i>天：</label>
        <div class="col-sm-6">
            <input name="xingcheng[$index][name]" class="col-sm-12 form-control" type="text" value="" maxlength="30"/>
        </div>
        <div class="col-sm-2">
            <a href="javascript:;" class="J_del_xingcheng del_btn">删除第$day天行程</a>
        </div>
    </div>
    <div class="row h_auto no_hover">
        <label for="" class="col-sm-2 pro_name">行程安排：<em>*</em></label>
        <div class="col-sm-8">
            <textarea class="input_textarea J_editor col-sm-12" name="xingcheng[$index][content]" style="height:250px;visibility:hidden;" data-name="kind_body" placeholder="说两句~~"></textarea>
        </div>
    </div>
    <div class="row h_auto no_hover">
        <label for="" class="col-sm-2 pro_name">用餐：</label>
        <div class="col-sm-8">
            <label class="input_checkbox" title="">
                <input name="xingcheng[$index][eat][0]" type="checkbox" value="1" style="top:8px">早餐
            </label><label class="input_checkbox" title="">
                <input name="xingcheng[$index][eat][1]" type="checkbox" value="1" style="top:8px">中餐
            </label><label class="input_checkbox" title="">
                <input name="xingcheng[$index][eat][2]" type="checkbox" value="1" style="top:8px">晚餐
            </label>
        </div>
    </div>
    <div class="row h_auto no_hover">
        <label for="" class="col-sm-2 pro_name">住宿：</label>
        <div class="col-sm-9">
            <label class="input_text w_135">
                <input name="xingcheng[$index][sleep]" class="col-sm-12 form-control" type="text" value="" maxlength="30"/>
            </label>
        </div>
    </div>                                
    </script>
<script src="/ke361/Public/Admin/js/alert.js"></script>
<script src="/ke361/Public/Admin/js/jquery_date.js"></script>
<script src="/ke361/Public/Admin/js/line_form3.js"></script>
<script src="/ke361/Public/Admin/js/date_price.js?v=1409888150"></script>
 
        </div>
        <div class="cont-ft">
            <div class="copyright">
                <div class="fl">感谢使用<a>LinThink</a>管理平台</div>
                <div class="fr">V<?php echo (ONETHINK_VERSION); ?></div>
            </div>
        </div>
    </div>
    <!-- /内容区 -->
    <script type="text/javascript">
    (function(){
        var ThinkPHP = window.Think = {
            "ROOT"   : "/ke361", //当前网站地址
            "APP"    : "/ke361/index.php?s=", //当前项目地址
            "PUBLIC" : "/ke361/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
    })();
    </script>
    <script type="text/javascript" src="/ke361/Public/static/think.js"></script>
    <script type="text/javascript" src="/ke361/Public/Admin/js/common.js"></script>
    <script type="text/javascript">
        +function(){
            var $window = $(window), $subnav = $("#subnav"), url;
            $window.resize(function(){
                $("#main").css("min-height", $window.height() - 130);
            }).resize();

            /* 左边菜单高亮 */
            url = window.location.pathname + window.location.search;
            url = url.replace(/(\/(p)\/\d+)|(&p=\d+)|(\/(id)\/\d+)|(&id=\d+)|(\/(group)\/\d+)|(&group=\d+)/, "");
            $subnav.find("a[href='" + url + "']").parent().addClass("current");

            /* 左边菜单显示收起 */
            $("#subnav").on("click", "h3", function(){
                var $this = $(this);
                $this.find(".icon").toggleClass("icon-fold");
                $this.next().slideToggle("fast").siblings(".side-sub-menu:visible").
                      prev("h3").find("i").addClass("icon-fold").end().end().hide();
            });

            $("#subnav h3 a").click(function(e){e.stopPropagation()});

            /* 头部管理员菜单 */
            $(".user-bar").mouseenter(function(){
                var userMenu = $(this).children(".user-menu ");
                userMenu.removeClass("hidden");
                clearTimeout(userMenu.data("timeout"));
            }).mouseleave(function(){
                var userMenu = $(this).children(".user-menu");
                userMenu.data("timeout") && clearTimeout(userMenu.data("timeout"));
                userMenu.data("timeout", setTimeout(function(){userMenu.addClass("hidden")}, 100));
            });

	        /* 表单获取焦点变色 */
	        $("form").on("focus", "input", function(){
		        $(this).addClass('focus');
	        }).on("blur","input",function(){
				        $(this).removeClass('focus');
			        });
		    $("form").on("focus", "textarea", function(){
			    $(this).closest('label').addClass('focus');
		    }).on("blur","textarea",function(){
			    $(this).closest('label').removeClass('focus');
		    });

            // 导航栏超出窗口高度后的模拟滚动条
            var sHeight = $(".sidebar").height();
            var subHeight  = $(".subnav").height();
            var diff = subHeight - sHeight; //250
            var sub = $(".subnav");
            if(diff > 0){
                $(window).mousewheel(function(event, delta){
                    if(delta>0){
                        if(parseInt(sub.css('marginTop'))>-10){
                            sub.css('marginTop','0px');
                        }else{
                            sub.css('marginTop','+='+10);
                        }
                    }else{
                        if(parseInt(sub.css('marginTop'))<'-'+(diff-10)){
                            sub.css('marginTop','-'+(diff-10));
                        }else{
                            sub.css('marginTop','-='+10);
                        }
                    }
                });
            }
        }();
    </script>
    
</body>
</html>
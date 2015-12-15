<?php if (!defined('THINK_PATH')) exit();?> <?php if(is_array($goods)): $i = 0; $__LIST__ = $goods;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="list-unstyled">
                <div class="item">
                    <div class="goods-pic">
                        <a target="_blank" class="pic-img" href="<?php echo U('goods/info',array('id'=>$vo['goods_id']));?>">
                            <img class="lazy img-responsive" src="<?php echo ($vo["pic_url"]); ?>" alt="<?php echo ($vo["title"]); ?>" style="display: inline;">
                        </a>
                    </div>
                    <h5 class="">
                        <a class="black" target="_blank" href="<?php echo U('goods/info',array('id'=>$vo['goods_id']));?>"><?php echo ($vo["title"]); ?></a>
                        <div style="display:none;" class="icon-all">
                        </div>
                    </h5>
                    <div class="goods-price">
                        <span class="price-current">
                            <em>￥</em>
                            <?php if($vo["discount_price"] > 0): echo ($vo['discount_price']); else: echo ($vo['price']); endif; ?>
                        </span>
                        <span class="des-other">
                            <del>
                                <em>￥</em>
                                <?php echo ($vo['price']); ?>
                            </del>
                            <span class="discount">(
                                <em>
                                    <?php echo sprintf( "%.2f",$vo['discount_price']/$vo['price'])*10; ?>
                                </em>折)
                            </span>
                        </span>
                       
                    </div>
                    <!-- like -->
                    <a href="javascript:;" data-title="<?php echo ($vo["title"]); ?>" onclick="favor(<?php echo ($goods['goods_id']); ?>)" data-key="" title="加入收藏" class="y-like my-like active">
                        <i class="like-ico l-active"><span class="heart_left"></span><span class="heart_right"></span></i>
                    </a>
                    <!-- end like -->
                    <div style="display:block" class="box-hd">
                    </div>
                </div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
<script>
         page = <?php echo ($page); ?>;
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
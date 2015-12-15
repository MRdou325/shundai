(function ($) {
$(function(){
    //生成编辑器
    var make_editor = function(){
        $($('.J_editor:not(.has_editor)').sort(function(){return 1})).each(function(){
            if($(this).hasClass('has_editor')){
                return;
            }
            $(this).addClass('has_editor');
            var num = (new Date()).getTime()+Math.floor(Math.random()*1000);
            var editor_id = 'J_xingcheng_con_'+num;
            $(this).attr('id',editor_id);
            Editor_cncn({
                textareaID:editor_id,
                toolbarId : "J_EditorToolbar_"+num,
                iframeId : "J_EditorIframe_"+num
            })
        })
    }
    if ($.browser.msie && $.browser.version=="6.0") {

    }else{
        make_editor();
    }
    //模式切换
    $('#J_edit_by_day').click(function(){
        var self = $(this);
        $('[name=sch_tc]').val(self.data('val'));
        self.addClass('on').siblings().removeClass('on');
        $('#J_edit_by_custom_wrap').hide();
        $('#J_edit_by_day_wrap').show();
    })
    $('#J_edit_by_custom').click(function(){
        var self = $(this);
        $('[name=sch_tc]').val(self.data('val'));
        self.addClass('on').siblings().removeClass('on');
        $('#J_edit_by_custom_wrap').show();
        $('#J_edit_by_day_wrap').hide();
    })
    $('.pro_form').on('get_img_form_val','.J_xingcheng_img',function(){
        var self = $(this);
        var input = self.find('input');
        var vals = '';
        var str = '/';
        self.find('.pro_img span:visible').each(function(){
            var path = $(this).find('img').attr('src');
            if(path.indexOf('xnxwimg')!==-1){
                str = '';
                path = path.replace(/\_s/g,'');
            }
            path = path.replace(/http\:\/\/[^\/]{6,40}\//,str);
            vals += path+'|';
        })
        vals = vals.replace(/\|$/,'');
        input.val(vals);
    })
    //模板切换
    $('[name=sch_sheet]').click(function(){
        var val = this.value+'';
        if(val === '0'){
            $('.J_shangxia_tip').hide();
            $('.J_xingcheng_img').hide();
            $('.J_xingcheng_bg').hide();
        }
        if(val === '1'){
            $('.J_shangxia_tip').show();
            $('.J_max_img_num_tip em').html('3');
            $('.J_xingcheng_img').show();
            $('.J_xingcheng_bg').show();
            $('.J_xingcheng_img .pro_img span').each(function(){
                if($(this).data('allow_show') === 'on'){
                    $(this).show();
                }
            })
            $('.J_xingcheng_img').trigger('get_img_form_val');
        }
        if(val === '2'){
            $('.J_shangxia_tip').hide();
            $('.J_max_img_num_tip em').html('1');
            $('.J_xingcheng_img').show();
            $('.J_xingcheng_bg').show();
            $('.J_xingcheng_img').each(function(){
                var self = $(this);
                self.find('.pro_img span:visible').each(function(i){
                    if(i!==0){
                        $(this).data('allow_show','on').hide();
                    }
                })
            });
            $('.J_xingcheng_img').trigger('get_img_form_val');
        }
    })
    $('[name=sch_sheet]:checked').click();
    
    //标签选择
    var add_tags = function(wrap_dom,maxlength,error_msg,more_text){
        more_text = more_text||'';
        var btn = wrap_dom.siblings('.J_pro_tags').find('.long_btn');
        var parent = btn.parent().hide();
        var tag_data = '';
        parent.find('a').each(function(){
            tag_data += $(this).data('tag_id');
            tag_data += '|'+$(this).text().replace(/>/,'')+',';
        });
        var input = parent.siblings('.J_input');
        var callback = function(tags_select_dom){
            var a_tags = tags_select_dom.find('.tags_list a');
            parent.find('a').remove();
            var ids = [];
            if(a_tags.length>0){
                a_tags.each(function(){
                    var id = $(this).data('tag_id');
                    var text = $(this).text();
                    btn.before('<a href="javascript:;" data-tag_id="'+id+'"><i></i>'+more_text+text+'</a>');
                    ids.push(id);
                })
                btn.addClass('long_btn_on');
                input.val(ids.join(','));
            }else{
                //btn.removeClass('long_btn_on');
                input.val('');
            }
        }
        var close_callback = function(){
            parent.show();
        }
        
        //第一次加载标签选择插件
        if(!wrap_dom.data('checkbox_select')){
            wrap_dom.data('checkbox_select',cncn_select_tags({
                checkbox_callback : callback,
                close_callback    : close_callback,
                data              : tag_data,
                plugin_wrap       : wrap_dom,
                maxlength         : maxlength,
                error_msg         : error_msg
            }));
            return;
        }
        
        //再次打开标签选择插件
        if(wrap_dom.data('cncn_type') === 'open'){
            cncn_select_tags({
                data        : tag_data,
                plugin_wrap : wrap_dom,
                type        : 'open'
            });
        }else{
        //更新ajax数据
            wrap_dom.data('checkbox_select')(wrap_dom);
        }
    }
    
    //途径景点
    var jingdian_data_call = function(data){
        var wrap_dom = $('#J_jingdian_select');
        var data_jingdian = $('#J_data_jingdian_list');
        if(data_jingdian.length === 0){
            wrap_dom.append('<div id="J_data_jingdian_list" style="display:none;"></div>');
            data_jingdian = $('#J_data_jingdian_list')
        }
        data_jingdian.html('');
        if(data.status !== '1'){
            return;
        }
        //var page_html = data.page.replace(/onclick\=\'javascript\:goto\((\d{1,3}) ?\,\"jingdian\"\)\;\'/g,'data-page="$1"').replace('onChange="change_goto(\'jingdian\')"','');
        var page_html = data.page;
        var map_html = '景点所在区域：' 
        data_jingdian.append(data.list);
        if($("#J_typeid").val()+''==='1'){
            wrap_dom.find('.tags_jingdian_nav').html(data_jingdian.find('.tit').html().replace('位置：',map_html));
        }else{
            var str = map_html + data_jingdian.find('.tit').html().replace('位置：','');
            str = str.replace(/onclick\=\"[^\"]+\"/g,function(t){
                var param = 'data-param="';
                t = t.match(/JD\.show\(([^\)]+)\)/);
                if(t&&t.length>1){
                    t = t[1].replace(/\'/g,'');
                    if(t === 'all'){
                        t = 'all,0';
                    }
                }
                param += t + '"'
                return param;
            });
            wrap_dom.find('.tags_jingdian_nav').html(str);
        }
        var tags_jingdian_area = wrap_dom.find('.tags_jingdian_area').html('').hide();
        var tags_jingdian_list = wrap_dom.find('.J_tags_list').html('').hide();
        var search_dom = wrap_dom.find('.input_small_search').hide();
        data_jingdian.find('ul a').each(function(){
            var param = $(this).attr('onclick').replace('JD.show(','').replace(')','').replace(/\'/g,'');
            var name = $(this).text();
            tags_jingdian_area.append('<a href="javascript:;" data-param="'+param+'">'+name+'</a>');
        })
        data_jingdian.find('#jd_list label input').each(function(){
            var id = $(this).val();
            var name = $(this).attr('_for_name');
            tags_jingdian_list.append('<label><input type="checkbox" data-tag_id="'+id+'">'+name+'</label>');
        })
        if(tags_jingdian_area.find('a').length>0){
            tags_jingdian_area.show();
        }
        if(data_jingdian.find('#jd_list').length === 1){
            if(tags_jingdian_list.find('label').length === 0){
                tags_jingdian_list.append('<label>暂无景点</label>');
            }
            tags_jingdian_list.show();
        }
        if(data_jingdian.find("[name='hotsrch_form']").length === 1){
            search_dom.show();
        }
        wrap_dom.find('.tags_pagin').remove();
        if(page_html){
            tags_jingdian_list.after('<div class="tags_pagin">'+page_html+'</div>');
            wrap_dom.find('.tags_pagin a').off().on('click',function(){
                var param = wrap_dom.data('param').split(',');
                param.push(jingdian_data_call);
                var keyword = wrap_dom.find('.input_small_search input').val();
                param.push(keyword);
                param.push($(this).data('page'));
//                cncn_jingdian_lib.show.apply(null,param);
            })
            wrap_dom.find('.tags_pagin select').off().on('change',function(){
                var param = wrap_dom.data('param').split(',');
                param.push(jingdian_data_call);
                var keyword = wrap_dom.find('.input_small_search input').val();
                param.push(keyword);
                param.push($(this).val());
//                cncn_jingdian_lib.show.apply(null,param);
            })
        }
        add_tags(wrap_dom,10,'最多10个景点','<b>&gt;</b>');

        if ($('#J_jingdian_select .tags_jingdian_nav a').data('param')) {
            var param = $('#J_jingdian_select .tags_jingdian_nav a').data('param');
            $('#J_jingdian_select').data('param',param);
            param = param.split(',');
            param.push(jingdian_data_call);
            $('#J_jingdian_select .input_small_search input').val('');
        };

    }
    $('.J_pro_tags').on('click','a i',function(){
        var self = $(this);
        var input = self.parents('.J_pro_tags').siblings('.J_input');
        var tag_id = self.parent().data('tag_id')+',';
        var ids = (input.val()+',').replace(tag_id,'').replace(/\,$/,'');
        input.val(ids);
        if($('.J_pro_tags a').length === 1){
            self.parent().siblings('span').removeClass('long_btn_on');
        }
        self.parent().remove();
    });
    $('#jingdian_list .tags_jingdian_area').on('click','a',function(){//城市
        var param = $(this).data('param');
        $('#J_jingdian_select').data('param',param);
        param = param.split(',');
        param.push(jingdian_data_call);
        //var keyword = $('#J_jingdian_select .input_small_search input').val();
        //param.push(keyword);
        $('#J_jingdian_select .input_small_search input').val('');
        cncn_jingdian_lib.show.apply(null,param);
    })
    $('#J_jingdian_select .tags_jingdian_nav').on('click','a',function(){//中国
        var param = $(this).data('param');
        $('#J_jingdian_select').data('param',param);
        param = param.split(',');
        param.push(jingdian_data_call);
        //var keyword = $('#J_jingdian_select .input_small_search input').val();
        //param.push(keyword);
        $('#J_jingdian_select .input_small_search input').val('');
        cncn_jingdian_lib.show.apply(null,param);
    })
    $('#J_jingdian_select .input_small_search').on('click','a',function(){//搜索
        var wrap_dom = $('#J_jingdian_select');
        var param = wrap_dom.data('param').split(',');
        param[0] = 'search';
        param.push(jingdian_data_call);
        var keyword = wrap_dom.find('.input_small_search input').val();
        param.push(keyword);
        cncn_jingdian_lib.show.apply(null,param);
    })
    $('.J_add_jingdian').click(function(){//添加景点
        var wrap_dom = $('#J_jingdian_select');
        if(wrap_dom.data('checkbox_select')){
            wrap_dom.data('cncn_type','open');
        }
        var type = $('#J_typeid').val();
        if(type+'' === '2'||type+'' === '3'){
            cncn_jingdian_lib.show('zhou', '90', jingdian_data_call);
        }else{
            cncn_jingdian_lib.show('no_type', '', jingdian_data_call);
            if(parseInt($("#J_typeid").val()) === 1){
                $('#J_jingdian_select').data('param','jd,'+$("#cujd_cityid").val());
            }
        }
    })
    
    
    //行程攻略
    var gonglue_data_call = function(data){
        var wrap_dom = $('#J_gonglue_select');
        var data_gonglue = $('#J_data_gonglue_list');
        if(data_gonglue.length === 0){
            wrap_dom.append('<div id="J_data_gonglue_list" style="display:none;"></div>');
            data_gonglue = $('#J_data_gonglue_list')
        }
        data_gonglue.html('');
        if(data.status !== '1'){
            return;
        }
        data_gonglue.append('<ul>'+data.list+'</ul>');
        var page_html = data.page.replace(/onclick\=\'javascript\:goto\((\d{1,3}) ?\,\"news\"\)\;\'/g,'data-page="$1"')
                                 .replace('onChange="change_goto(\'news\')"','');
        var tags_gonglue_list = wrap_dom.find('.J_tags_list').html('').hide();
        data_gonglue.find('ul li').each(function(){
            var name = $(this).find('a').text();
            var id = $(this).find('input').attr('_for_id');;
            tags_gonglue_list.append('<label><input type="checkbox" data-tag_id="'+id+'">'+name+'</label>');
        })
        if(tags_gonglue_list.find('label').length === 0){
            tags_gonglue_list.append('<label>暂无内容</label>');
        }
        tags_gonglue_list.show();
        wrap_dom.find('.tags_pagin').remove();
        if(page_html){
            tags_gonglue_list.after('<div class="tags_pagin">'+page_html+'</div>');
            wrap_dom.find('.tags_pagin a').off().on('click',function(){
                var keyword = wrap_dom.find('.J_tags_search').val();
                var id = wrap_dom.find('.tags_other_nav li.on').data('id');
                cncn_gonglue_lib.show(gonglue_data_call,keyword,id,$(this).data('page'));
            })
            wrap_dom.find('.tags_pagin select').off().on('change',function(){
                var keyword = wrap_dom.find('.J_tags_search').val();
                var id = wrap_dom.find('.tags_other_nav li.on').data('id');
                cncn_gonglue_lib.show(gonglue_data_call,keyword,id,$(this).val());
            })
        }
        add_tags(wrap_dom,10,'最多关联10篇攻略');
    }
    $('#J_gonglue_select .tags_other_nav li').on('click',function(){
        var self = $(this);
        var id = self.data('id');
        if(!self.hasClass('on')){
            self.addClass('on').siblings().removeClass('on');
        }
        var keyword = self.siblings('input').val();
        cncn_gonglue_lib.show(gonglue_data_call,'',id);
    })
    $('#J_gonglue_select .J_tags_search_btn').click(function(){
        var self = $(this);
        var keyword = self.siblings('input').val();
        var id = self.data('id');
        if(!self.hasClass('on')){
            self.addClass('on').siblings().removeClass('on');
        }
        var id = self.parents('.tags_other_hd').find('.tags_other_nav li.on').data('id');
        cncn_gonglue_lib.show(gonglue_data_call,keyword,id);
    })
    $('.J_add_gonglue').click(function(){
        var wrap_dom = $('#J_gonglue_select');
        if(wrap_dom.data('checkbox_select')){
            wrap_dom.data('cncn_type','open');
        }
        cncn_gonglue_lib.show(gonglue_data_call,'',0);
    })
    
    
    //相关推荐
    var tuijian_data_call = function(data){
        var wrap_dom = $('#J_xianlu_select');
        var data_tuijian = $('#J_data_tuijian_list');
        if(data_tuijian.length === 0){
            wrap_dom.append('<div id="J_data_tuijian_list" style="display:none;"></div>');
            data_tuijian = $('#J_data_tuijian_list')
        }
        data_tuijian.html('');
        if(data.status !== '1'){
            return;
        }
        data_tuijian.append('<ul>'+data.list+'</ul>');
        var page_html = data.page.replace(/onclick\=\'javascript\:goto\((\d{1,3}) ?\,\"line\"\)\;\'/g,'data-page="$1"')
                                 .replace('onChange="change_goto(\'line\')"','');
        var tags_gonglue_list = wrap_dom.find('.J_tags_list').html('').hide();
        data_tuijian.find('ul li').each(function(){
            var name = $(this).find('a').text();
            var id = $(this).find('input').attr('_for_id');;
            tags_gonglue_list.append('<label><input type="checkbox" data-tag_id="'+id+'">'+name+'</label>');
        })
        if(tags_gonglue_list.find('label').length>0){
            tags_gonglue_list.show();
        }
        if(tags_gonglue_list.find('label').length === 0){
            tags_gonglue_list.append('<label>暂无内容</label>');
        }
        tags_gonglue_list.show();
        wrap_dom.find('.tags_pagin').remove();
        if(page_html){
            tags_gonglue_list.after('<div class="tags_pagin">'+page_html+'</div>');
            wrap_dom.find('.tags_pagin a').off().on('click',function(){
                var keyword = wrap_dom.find('.J_tags_search').val();
                var classid = wrap_dom.find('.J_xianlu_cate select').val();
                cncn_tuijian_lib.show(tuijian_data_call,keyword,classid,$(this).data('page'));
            })
            wrap_dom.find('.tags_pagin select').off().on('change',function(){
                var keyword = wrap_dom.find('.J_tags_search').val();
                var classid = wrap_dom.find('.J_xianlu_cate select').val();
                cncn_tuijian_lib.show(tuijian_data_call,keyword,classid,$(this).val());
            })
        }
        var line_num=$("#J_xianlu_select").data('line_num');
        line_num = line_num?line_num:4
        add_tags(wrap_dom,line_num,'最多关联4条线路');
    }
    $('#J_xianlu_select .J_tags_search_btn').click(function(){
        var self = $(this);
        var keyword = self.siblings('input').val();
        var classid = self.parents('.tags_other_hd').find('.J_xianlu_cate select').val();
        cncn_tuijian_lib.show(tuijian_data_call,keyword,'-1',1);
    })
    $('.J_add_xianlu').click(function(){
        var wrap_dom = $('#J_xianlu_select');
        if(wrap_dom.data('checkbox_select')){
            wrap_dom.data('cncn_type','open');
        }
        cncn_tuijian_lib.show(tuijian_data_call,'',-1,1);
    })
    $('#J_xianlu_select .J_xianlu_cate select').change(function(){
        var self = $(this);
        var keyword = self.parents('.tags_other_hd').find('.J_tags_search').val();
        var classid = self.val();
        cncn_tuijian_lib.show(tuijian_data_call,'',classid,1);
    })
    
    
    //相关附件
    var attach_data_call = function(data){
        var wrap_dom = $('#J_attach_select');
        if(data.status !== '1'){
            return;
        }
        var page_html = data.page.replace(/onclick\=\'javascript\:goto\((\d{1,3}) ?\,\"attach\"\)\;\'/g,'data-page="$1"')
                                 .replace('onChange="change_goto(\'attach\')"','');
        var tags_gonglue_list = wrap_dom.find('.J_tags_list').html('').hide();
        $(data.list).each(function(){
            var name = this.name;
            var id = this.id;
            tags_gonglue_list.append('<label><input type="checkbox" data-tag_id="'+id+'">'+name+'</label>');
        })
        if(tags_gonglue_list.find('label').length>0){
            tags_gonglue_list.show();
        }
        if(tags_gonglue_list.find('label').length === 0){
            tags_gonglue_list.append('<label>暂无内容</label>');
        }
        tags_gonglue_list.show();
        wrap_dom.find('.tags_pagin').remove();
        if(page_html){
            tags_gonglue_list.after('<div class="tags_pagin">'+page_html+'</div>');
            wrap_dom.find('.tags_pagin a').off().on('click',function(){
                cncn_attach_lib.show(attach_data_call,$(this).data('page'));
            })
            wrap_dom.find('.tags_pagin select').off().on('change',function(){
                cncn_attach_lib.show(attach_data_call,$(this).val());
            })
        }
        add_tags(wrap_dom,3,'最多关联3个附件');
    }
    $('.J_add_attach').click(function(){
        var wrap_dom = $('#J_attach_select');
        if(wrap_dom.data('checkbox_select')){
            wrap_dom.data('cncn_type','open');
        }
        cncn_attach_lib.show(attach_data_call,1);
    })
    
 
    //旅游保险
    var safe_data_call = function(data){
        var wrap_dom = $('#J_safe_select');
        if(data.status !== '1'){
            return;
        }
        var page_html = data.page.replace(/onclick\=\'javascript\:goto\((\d{1,3}) ?\,\"attach\"\)\;\'/g,'data-page="$1"')
                                 .replace('onChange="change_goto(\'attach\')"','');
        var tags_gonglue_list = wrap_dom.find('.J_tags_list').html('').hide();
        $(data.list).each(function(){
            var name = this.title;
            var id = this.id;
            tags_gonglue_list.append('<label><input type="checkbox" data-tag_id="'+id+'">'+name+'</label>');
        })
        if(tags_gonglue_list.find('label').length>0){
            tags_gonglue_list.show();
        }
        if(tags_gonglue_list.find('label').length === 0){
            tags_gonglue_list.append('<label>暂无内容</label>');
        }
        tags_gonglue_list.show();
        wrap_dom.find('.tags_pagin').remove();
        if(page_html){
            tags_gonglue_list.after('<div class="tags_pagin">'+page_html+'</div>');
            wrap_dom.find('.tags_pagin a').off().on('click',function(){
                cncn_safe_lib.show(safe_data_call,$(this).data('page'));
            })
            wrap_dom.find('.tags_pagin select').off().on('change',function(){
                cncn_safe_lib.show(safe_data_call,$(this).val());
            })
        }
        add_tags(wrap_dom,99999999,'最多关联99999999个附件');
    }
    $('.J_add_safe').click(function(){
        var wrap_dom = $('#J_safe_select');
        if(wrap_dom.data('checkbox_select')){
            wrap_dom.data('cncn_type','open');
        }
        cncn_safe_lib.show(safe_data_call,1);
    })
    
    //线路图片
    $('.pro_form').on('click','.J_add_pic',function(){
        var self = $(this);
        cncn_album(function(url,pid){
            var pro_img = self.siblings('.pro_img');
            var type = $('[name=sch_sheet]:checked').val()+'';
            var type_name = $.trim($('[name=sch_sheet]:checked').parent().text());
            if(type === '0'){
                return;
            }
            var allow_num = type === '2'?1:3;
            if(pro_img.length>0){
                if(pro_img.find('span:visible').length === allow_num){
                    alert_fail(type_name+'只允许'+allow_num+'张行程图片');
                }else{
                    pro_img.append('<span><img src="'+url+'" width="135" height="85"><a href="javascript:;" class="J_remove_img">删除</a></span>');
                }
                pro_img.show();
            }else{
                self.before(
                    '<div class="pro_img">'+
                        '<span><img src="'+url+'" width="135" height="85"><a href="javascript:;" class="J_remove_img">删除</a></span>'+
                    '</div>')
            }
            self.parents('.J_xingcheng_img').trigger('get_img_form_val');
        })
    })
    $('.pro_form').on('click','.J_xingcheng_img .J_remove_img',function(){
        var self = $(this);
        var pro_img = self.parents('.pro_img')
        self.parent().hide();
        self.parents('.J_xingcheng_img').trigger('get_img_form_val');
        var left_img = pro_img.find('span:visible').length;
        if(left_img === 0){
            pro_img.hide();
        }
    })
    $('.pro_form .J_xingcheng_bg').on('click','.J_remove_img',function(){
        var self = $(this);
        self.parents('.pro_img').remove();
        $('[name=shc_img]').val('');
    })
    $('.J_add_shc_img').click(function(){
        var self = $(this);
        var input = self.siblings('input');
        cncn_album(function(url,pid){
            var pro_img = self.siblings('.pro_img');
            var data_url = url.replace(/http\:\/\/[^\/]{6,40}\//,'/');
            if(pro_img.length>0){
                var span = pro_img.find('span:visible');
                if(span.length === 1){
                    span.find('img').attr('src',url);
                    pro_img.find('a').data('url',data_url);
                }else{
                    pro_img.append('<span><img src="'+url+'" width="135" height="85"><a href="javascript:;" class="J_remove_img" data-url="'+data_url+'">删除</a></span>');
                }
                pro_img.show();
            }else{
                self.before(
                    '<div class="pro_img">'+
                        '<span><img src="'+url+'" width="135" height="85"><a href="javascript:;" class="J_remove_img" data-url="'+data_url+'">删除</a></span>'+
                    '</div>')
            }
            input.val(data_url);
        })
    })
    $(".J_add_scheduling_img").click(function(){
        cncn_album(function(path,pid){
            var img_url = path.replace('_s.jpg','_b.jpg');
            var editor = FCKeditorAPI.GetInstance("scheduling");
            var str = '<img src="'+img_url+'">';
            editor.InsertHtml(str);
        });
    });
    

    //添加行程天数
    $('#J_add_xingcheng_days').on('click',function(){
        var type = $('[name=sch_sheet]:checked').val()+'';
        var img_is_hide = '';
        var img_num = 1;
        if(type === '0'){
            img_is_hide = 'style="display:none"';
        }
        if(type === '1'){
            img_num = 3;
        }
        var self = $(this);
        var text = self.text();
        var cur_day = text.match(/\d{1,2}/)[0];
        if(parseInt(cur_day,10)>60){
            alert_fail('按天编辑的最大天数不能超过60天～');
            return;
        }
        var html = $('#J_xingcheng_tem').html();
        html = html.replace(/\$day/g,cur_day)
                   .replace(/\$index/g,parseInt(cur_day,10)-1)
                   .replace('$img_num',img_num)
                   .replace('$img_is_hide',img_is_hide);
        self.parents('.row').before(html);
        if ($.browser.msie && $.browser.version=="6.0") {

        }else{
            KindEditor.ready(function (K) {
                var editor1 = K.create('textarea[data-name="kind_body"]', {
                    cssPath: '__ADDONS__/kindeditor/plugins/code/prettify.css',
                    uploadJson: '__ADDONS__/kindeditor/php/upload_json.php',
                    fileManagerJson: '__ADDONS__/kindeditor/php/file_manager_json.php',
                    
                    allowFileManager: true,
                    afterChange: function (){
                        var self = this;
                        self.sync();
                    }
                });
                prettyPrint();
            });
            // make_editor();
            // cncn_textarea_left();
        }
        order_xingcheng();
        if(type === '1'){
            $('.J_shangxia_tip').show();
        }else{
            $('.J_shangxia_tip').hide();
        }
    })
    
    
    // $(".J_del_xingcheng").live("click", function(){
    //         alert_confirm('确认'+$(this).text()+'?',function(){        
    //             $(this).parent().parent().next().remove();
    //             $(this).parent().parent().next().remove();
    //             $(this).parent().parent().next().remove();
    //             $(this).parent().parent().remove();
    //             order_xingcheng();
    //         })
    //     });
    //删除行程天数
    $('#J_edit_by_day_wrap').on('click','.J_del_xingcheng',function(){
        var rows = $('#J_edit_by_day_wrap .row');
        var index = rows.index($(this).parents('.row'));
        alert_confirm('确认'+$(this).text()+'?',function(){
            rows.slice( index, index+4).remove();
            order_xingcheng();
        })
    })
    //排序行程天数
    function order_xingcheng(){
        var rows = $('#J_edit_by_day_wrap .J_del_xingcheng');
        var days = rows.length;
        rows.each(function(i){
            var self = $(this);
            var row = self.parents('.row');
            var day = i+1;
            var day_dom = row.find('.pro_name i');
            var old_index = parseInt(day_dom.html(),10)-1;
            day_dom.html(day);
            self.html('删除第'+day+'天行程');
            if(old_index !== i){
                $([0,1,2,3,4,5,6]).each(function(){
                    var old_name = 'att[xingcheng]['+old_index+']['+this+']';
                    var new_name = 'att[xingcheng]['+i+']['+this+']';
                    $('#J_edit_by_day_wrap input,#J_edit_by_day_wrap textarea').each(function(){
                        if($(this).attr('name') === old_name){
                            $(this).attr('name',new_name);
                        }
                    })
                })
            }
        });
        $('#J_add_xingcheng_days').text('添加第'+(days+1)+'天行程');
    }
    //主题标签
    $('.J_zhuti_tag input').on('click',function(){
        var self = $(this);
        if(this.checked && $('.J_zhuti_tag input:checked').length === 4){
            alert_fail('最多选择3个主题标签');
            this.checked = false;
        }
    })
    //提交
    $('.J_submit_btn').click(function(){
        var type = $('[name=sch_tc]').val();
        var tese = $('.J_xingcheng_tese').data('text');
        if(tese&&tese.length > 400){
            alert_fail('行程亮点不能超过400个字');
            return;
        }
        if($('.J_xingcheng_tese')){}
        if(type==='1'){
            var allow_submit = true;
            // $('.J_del_xingcheng').siblings().find('input').each(function(){
                // var day = $(this).parents('.row').find('.pro_name i').text();
                // if($(this).val() === '' && allow_submit){
                    // alert_fail('请填写第'+day+'天的标题~');
                    // allow_submit = false;
                // }
            // })
            $('#J_edit_by_day_wrap .J_editor').each(function(){
                var day = $(this).parents('.row').prev().find('.pro_name i').text();
                var text = $(this).data('text');
                if(text.length < 10 && allow_submit){
                    alert_fail('请详细填写第'+day+'天的行程安排，不能少于10个字～');
                    allow_submit = false;
                    $('html, body').animate({
                        scrollTop: $(this).parents('.row').prev().offset().top
                    }, 500);
                }
                if(text.length > 3000 && allow_submit){
                    alert_fail('第'+day+'天的行程安排字数不能超过3000个字～');
                    allow_submit = false;
                    $('html, body').animate({
                        scrollTop: $(this).parents('.row').prev().offset().top
                    }, 500);
                }
            })
            if(!allow_submit){
                return false;
            }
            $('.J_input').each(function(){
                var filter_arr = [];
                var arr = this.value.split(',');
                $.each(arr,function(){
                    if(/^\d+$/.test(this)){
                        filter_arr.push(this);
                    }
                })
                this.value = filter_arr.join(',')
            })
        }else{
            var daynum = $("input[name='daynum']").val();
            if (daynum<1)
            {   
                alert_fail('行程天数不能小于0天');
                return false;
            }
            var editor = FCKeditorAPI.GetInstance('scheduling');
            if(editor.EditMode==FCK_EDITMODE_SOURCE){
                alert_fail('源码无法提交保存，请切回正常的可视化编辑模式');
                return false;
            }

            var content_text = editor.EditorDocument.body.innerText;
            var content_html = editor.EditorDocument.body.innerHTML;
            if(typeof(content_text)=='undefined'){
                content_text = editor.EditorDocument.body.textContent;
            }

            if(content_text.length < 10){
                alert_fail('请填写具体的行程安排，你写的太少啦～');
                return false;
            }
            var content_html_len = content_html.length;
            var xingcheng_len = 60000;
            if($('#J_typeid').val() === '4'){
                xingcheng_len = 100000;
            }
            if(content_html_len > xingcheng_len){
                alert_fail('行程安排超过了'+xingcheng_len+'个字符数，请减少一点再发！目前字符数为：' + content_html_len );
                return false;
            }
        }
        $('#modiform').submit();
    })
})
})(jQuery_1_10_2)

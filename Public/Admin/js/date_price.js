(function($){
$(function(){
    var caigou_type = false;
    if($('#J_caigou_line_type').length){
        caigou_type = true;
    }
    //var edit_single_date_price_html = $('#J_price_table').html();
    // var edit_single_date_price = function(date){
        // $.confirm({
            // title:'添加价格('+date+')',
            // html:edit_single_date_price_html,
            // init_fun:function(){
                // if(!line_date_price_list_json[date]){
                    // return;
                // }
                // var price = line_date_price_list_json[date].price_info;
                // $('.J_single_date_price_table tr').each(function(){
                    // var self = $(this);
                    // var id = self.data('id');
                    // if(id){
                        // $(price).each(function(){
                            // if(this.price_type_id == id){
                                // self.find('.J_jiesuan_price').val(this.price);
                                // self.find('.J_kucun').val(this.current_stock);
                                // if(this.recommend_price !== '0'){
                                    // self.find('.J_zuidi_price').val(this.recommend_price);
                                // }
                                // if(this.market_price !== '0'){
                                    // self.find('.J_shichang_price').val(this.market_price);
                                // }
                                // if(this.price_difference !== '0'){
                                    // self.find('.J_danfangcha').val(this.price_difference);
                                // }
                            // }
                        // })
                    // }
                // })
            // },
            // width:660
        // });
    // }
    var new_date = function(str) { 
        var date = new Date(); 
        date.setUTCFullYear(parseInt(str[0],10), parseInt(str[1],10) - 1, parseInt(str[2],10)); 
        date.setUTCHours(-8, 0, 0, 0); 
        //return date.getTime(); 
        return date;
    }
    var stop_bubble = function(event){
        if (event.stopPropagation) {
            event.stopPropagation();
        } else {
            event.cancelBubble = true;
        }
    }
    var check_price = function(youhui_price){
        var price = $('[name=price]').val();
        if(price.length == 0){
            return true;
        }
        price = parseInt(price,10);
        if(price == 0){
            return true;
        }
        if(youhui_price > price){
            alert_fail('优惠价不能高过市场价～');
            return false;
        }
        return true;
    }
    //批量操作栏事件绑定
    $('#J_range').click(function(){
        $(this).addClass('on');
        $(this).siblings().removeClass('on');
        $('.J_date_area').show();
        $('.J_batch_area').hide();
        $('.J_operate_area').show();
        setTimeout(function(){
            $('.month_row').trigger('end_quick_mode');
        },1)
    })
    $('#J_batch').click(function(){
        $(this).addClass('on');
        $(this).siblings().removeClass('on');
        $('.J_date_area').hide();
        $('.J_batch_area').show();
        $('.J_operate_area').show();
        setTimeout(function(){
            $('.month_row').trigger('end_quick_mode');
        },1)
    })
    
    $('#J_quick').click(function(){
        $(this).addClass('on');
        $(this).siblings().removeClass('on');
        $('.J_operate_area').hide();
        setTimeout(function(){
            $('.month_row').trigger('start_quick_mode');
        },1)
    })
    $('.J_clear_all_price').click(function(){
        alert_confirm('确认清空所有报价么？',function(){
            $('.month_row .bd li:not(.disable)').each(function(){
                var self = $(this)
                if(self.find('.li_wrap').length === 1){
                    if(self.data('youhui_price')){
                        self.data({ youhui_price:'', child_price:''})
                            .find('.li_wrap')
                            .append('<a class="add_date_price J_add_date_price" href="javascript:;">添加价格</a>')
                            .find('.price')
                            .remove();
                    }
                }else{
                    var li_wrap = self.find('.li_wrap').eq(1);
                    li_wrap.find('.youhui').val('').removeClass('on');
                    li_wrap.find('.child').val('').removeClass('on');
                }
            })
        })
    })
    $('.J_week_all_select').click(function(){
        var val = this.checked;
        $('.J_week_select').each(function(){
            this.checked = val;
        })
    })
    $('.J_week_select').click(function(){
        var val = this.checked;
        if(!val){
            $('.J_week_all_select')[0].checked = val;
        }
    })
    $('#J_batch_add_by_week').click(function(){
        var inputs = $(this).parent().find('input')
        var youhui_price = inputs.eq(0).val();
        var child_price = inputs.eq(1).val();
        if(!youhui_price){
            alert_fail('没输入优惠价～');
            return;
        }
        if(!check_price(parseInt(youhui_price,10))){
            return;
        }
        var week_select_doms = $('.J_week_select:checked');
        if(week_select_doms.length === 0){
            alert_fail('要勾选日期哦～');
            return;
        }
        week_select_doms.each(function(){
            var val = this.value;
            $('.month_row .bd li').each(function(){
                var self = $(this);
                var index = self.index();
                if(index%7+'' === val+''&&!self.hasClass('disable')){
                    self.data({
                        youhui_price:youhui_price,
                        child_price:child_price
                    })
                    var price_add_btn = self.find('.J_add_date_price');
                    if(price_add_btn.length>0){
                        price_add_btn.remove();
                        self.find('.li_wrap').append('<a class="price" href="javascript:;">￥'+youhui_price+'<i class="J_del_price"></i></a>');
                    }else{
                        var quick_edit_inputs = self.find('.J_quick_edit_input');
                        if(quick_edit_inputs.length>0){
                            quick_edit_inputs.eq(0).val(youhui_price);
                            quick_edit_inputs.eq(1).val(child_price);
                            quick_edit_inputs.addClass('on');
                        }else{
                            self.find('.price').html(youhui_price+'<i class="J_del_price"></i>');
                        }
                    }
                }
            })
            this.checked = false;
        });
        $('.J_week_all_select')[0].checked = false;
        inputs.val('');
    })
	
	$('#J_batch_add_by_dateandweek').click(function(){
        var price_inputs = $(this).parent().find('input');
        var youhui_price = price_inputs.eq(0).val();
        var child_price = price_inputs.eq(1).val();
        var time_inputs = $('.J_date_area .input_calendar input');
        var start_date = time_inputs.eq(0).val();
        var end_date = time_inputs.eq(1).val();
        if(!youhui_price){
            alert_fail('没输入优惠价～');
            return;
        }
        if(!check_price(parseInt(youhui_price,10))){
            return;
        }
        if(!start_date){
            alert_fail('没选择开始时间哦～');
            return;
        }
        if(!end_date){
            alert_fail('没选择结束时间哦～');
            return;
        }
        var start_date_t = new_date(start_date.split('-')).getTime();
        var end_date_t = new_date(end_date.split('-')).getTime();
        if(start_date_t >= end_date_t){
            alert_fail('开始日期比结束日期大，要重新选择～');
            return;
        }
        
        var week_select_doms1 = $('.J_week_select1:checked');
        if(week_select_doms1.length === 0){
            alert_fail('没有选择周几哦～');
            return;
        }
        
        week_select_doms1.each(function(){
            var val = this.value;
            $('.month_row .bd li').each(function(){
                var self = $(this);
                if(self.hasClass('disable')){
                    return;
                }
                var index = self.index();
                if(index%7+'' === val+''&&!self.hasClass('disable')){
                    var cur_date_t = new_date(self.data('date').split('-')).getTime();
                    if(cur_date_t >= start_date_t && cur_date_t <= end_date_t){
                        self.data({
                            youhui_price:youhui_price,
                            child_price:child_price
                        })
                        var price_add_btn = self.find('.J_add_date_price');
                        if(price_add_btn.length>0){
                            price_add_btn.remove();
                            self.find('.li_wrap').append('<a class="price" href="javascript:;">￥'+youhui_price+'<i class="J_del_price"></i></a>');
                        }else{
                            var quick_edit_inputs = self.find('.J_quick_edit_input');
                            if(quick_edit_inputs.length>0){
                                quick_edit_inputs.eq(0).val(youhui_price);
                                quick_edit_inputs.eq(1).val(child_price);
                                quick_edit_inputs.addClass('on');
                            }else{
                                self.find('.price').html(youhui_price+'<i class="J_del_price"></i>');
                            }
                        }
                    }
                }
            })
        })
        price_inputs.val('');
        time_inputs.val('');
    })
	
    $('#J_batch_add_by_date').click(function(){
        var price_inputs = $(this).parent().find('input');
        var youhui_price = price_inputs.eq(0).val();
        var child_price = price_inputs.eq(1).val();
        var time_inputs = $('.J_date_area .input_calendar input');
        var start_date = time_inputs.eq(0).val();
        var end_date = time_inputs.eq(1).val();
        if(!youhui_price){
            alert_fail('没输入优惠价～');
            return;
        }
        if(!check_price(parseInt(youhui_price,10))){
            return;
        }
        if(!start_date){
            alert_fail('没选择开始时间哦～');
            return;
        }
        if(!end_date){
            alert_fail('没选择结束时间哦～');
            return;
        }
        var start_date_t = new_date(start_date.split('-')).getTime();
        var end_date_t = new_date(end_date.split('-')).getTime();
        if(start_date_t >= end_date_t){
            alert_fail('开始日期比结束日期大，要重新选择～');
            return;
        }
        $('.month_row .bd li').each(function(){
            var self = $(this);
            if(self.hasClass('disable')){
                return;
            }
            var cur_date_t = new_date(self.data('date').split('-')).getTime();
            if(cur_date_t >= start_date_t && cur_date_t <= end_date_t){
                self.data({
                    youhui_price:youhui_price,
                    child_price:child_price
                })
                var price_add_btn = self.find('.J_add_date_price');
                if(price_add_btn.length>0){
                    price_add_btn.remove();
                    self.find('.li_wrap').append('<a class="price" href="javascript:;">￥'+youhui_price+'<i class="J_del_price"></i></a>');
                }else{
                    var quick_edit_inputs = self.find('.J_quick_edit_input');
                    if(quick_edit_inputs.length>0){
                        quick_edit_inputs.eq(0).val(youhui_price);
                        quick_edit_inputs.eq(1).val(child_price);
                        quick_edit_inputs.addClass('on');
                    }else{
                        self.find('.price').html(youhui_price+'<i class="J_del_price"></i>');
                    }
                }
            }
        })
        price_inputs.val('');
        time_inputs.val('');
    })
    
    //事件代理
    $('#J_date_table').on('click','.J_add_date_price',function(event){
        stop_bubble(event)
        var self = $(this);
        var parent = self.parents('li');
        var position = parent.position();
        var li = self.parents('li');
        var add_price_dialog = self.parents('.bd').find('.add_price_dialog');
        add_price_dialog.find('p').html(li.data('date').split('-')[2]);
        add_price_dialog.find('.youhui').val('').removeClass('on');
        if(parent.data('child_price')){
            add_price_dialog.find('.child').val(parent.data('child_price')).addClass('on');
        }else{
            add_price_dialog.find('.child').val('').removeClass('on');
        }
        add_price_dialog.find('.ok_btn').data('li_target',li)
        add_price_dialog.css({
            top:position.top,
            left:position.left
        }).show();
    })
    $('#J_date_table').on('click','.J_del_price',function(event){
        stop_bubble(event)
        var self = $(this);
        var parent = self.parents('li');
        var position = parent.position();
        var li = self.parents('li');
        // var add_price_dialog = self.parents('.bd').find('.add_price_dialog');
        // add_price_dialog.find('p').html(li.data('date').split('-')[2]);
        // add_price_dialog.find('.youhui').val('').removeClass('on');
        // add_price_dialog.find('.child').val('').removeClass('on');
        // add_price_dialog.find('.ok_btn').data('li_target',li)
        // add_price_dialog.css({
            // top:position.top,
            // left:position.left
        // }).show();
        li.data('youhui_price','');
        li.data('child_price','');
        li.find('.price').remove();
        li.find('.li_wrap').append('<a class="add_date_price J_add_date_price" href="javascript:;">添加价格</a>');
    })
    $('#J_date_table').on('click','.price',function(event){
        stop_bubble(event)
        var self = $(this);
        var li = self.parents('li');
        if(caigou_type){
            // edit_single_date_price(li.data('date'));
            return;
        }
        var parent = self.parents('li');
        var position = parent.position();
        var add_price_dialog = self.parents('.bd').find('.add_price_dialog');
        add_price_dialog.find('p').html(li.data('date').split('-')[2]);
        add_price_dialog.find('.youhui').val(li.data('youhui_price')).addClass('on');
        var child_price = li.data('child_price');
        if(child_price){
            add_price_dialog.find('.child').val(child_price).addClass('on');
        }else{
            add_price_dialog.find('.child').val('').removeClass('on');
        }
        add_price_dialog.find('.ok_btn').data('li_target',li)
        add_price_dialog.css({
            top:position.top,
            left:position.left
        }).show();
    })
    $('#J_date_table').on('click','.J_quick_edit_input',function(){
        $(this).addClass('on').off('blur').blur(function(){
            var self = $(this);
            if(self.val() === ''){
                self.removeClass('on')
            }
        })
    })
    
    //表格html生成，依赖今天的日期，今后3个月的价格数据
    var earlier_date = parseInt($('#earlier_date').val(),10);
    var today = $('#today').val();
    var expire_day = $('#expire_day').val();
    var today_arr = today.split('-');
    today_arr[0] = parseInt(today_arr[0],10);
    today_arr[1] = parseInt(today_arr[1],10);
    today_arr[2] = parseInt(today_arr[2],10);
    var expire_day_arr = expire_day.split('-');
    expire_day_arr[0] = parseInt(expire_day_arr[0],10);
    expire_day_arr[1] = parseInt(expire_day_arr[1],10);
    expire_day_arr[2] = parseInt(expire_day_arr[2],10);
    var new_date_today = new_date(today_arr);
    var new_date_expire_day = new_date(expire_day_arr);
    var data_arr = $('#date_price_data').val();
    data_arr = data_arr?data_arr.split(','):[];
    for(var i = 0;i<data_arr.length;i++){
        var arr = data_arr[i].split('|');
        //{'date_1380447009460':[2600,1200]}
        data_arr['date_'+new_date(arr[0].split('-')).getTime()] = arr[1].split('-');
    }
    var html = '';
    var section_month_template = $('#date_price_template').html();
    //判断今天是否月末最后一天，是的话就只排列3个月份的表格
    var y_m_arr = [];//构建月份表格[[2013,11],[2013,12]]
    //将日期对象往前加一天，看月份数字是否变化，例如3月31号加一天就成了4月1号了，从3变到4
    // new_date_today.setDate(new_date_today.getDate() + 1);
    // if(new_date_today.getMonth() - parseInt(today_arr[1],10) === -1){
        // y_m_arr.push([new_date_today.getFullYear(),new_date_today.getMonth()+1])
    // }
    y_m_arr.push([new_date_today.getFullYear(),new_date_today.getMonth()+1])
    //对今天的date对象重置
    new_date_today = new_date(today_arr);
    new_date_today.setDate(15);//避免出现月头和月尾，月头，如果月尾是31号那么在setMonth+1后可能会出现跳月的现象
    new_date_today.setMonth(new_date_today.getMonth() + 1);//月份+1
    while(
        new_date_today.getTime() < new_date_expire_day.getTime() &&
        new_date_today.getMonth() !== new_date_expire_day.getMonth()
    ){
        y_m_arr.push([new_date_today.getFullYear(),new_date_today.getMonth()+1]);
        new_date_today.setMonth(new_date_today.getMonth() + 1);//月份+1
    }
    if(!(today_arr[0] === expire_day_arr[0] && today_arr[1] === expire_day_arr[1])){
        y_m_arr.push([new_date_expire_day.getFullYear(),new_date_expire_day.getMonth()+1]);//装载结束日的年份和月份
    }
    
    //对今天的date对象重置
    new_date_today = new_date(today_arr);
    for(var i = 0; i < y_m_arr.length; i++){
        var lis = '';
        var from = new_date([y_m_arr[i][0],y_m_arr[i][1],1]);
        var hd_is_display = 'style="display:none;"';
        //判断循环的月份是否是今天的月份
        if(today_arr[0] === y_m_arr[i][0] && today_arr[1] === y_m_arr[i][1]){
            from = new_date_today;
            hd_is_display = '';
        }
        var to = new_date([y_m_arr[i][0],y_m_arr[i][1]+1,1]);
        to.setDate(to.getDate() - 1);
        //判断循环的月份是否是结束日的月份
        if(expire_day_arr[0] === y_m_arr[i][0] && expire_day_arr[1] === y_m_arr[i][1]){
            to = new_date_expire_day;
        }
        //对月始补全
        var week = from.getDay();
        var complete_start_date = new_date([from.getFullYear(),from.getMonth()+1,from.getDate()]);//克隆from
        complete_start_date.setDate(complete_start_date.getDate() - week - 1);
        // if(to.getDate() - from.getDate() < 7){
            // complete_start_date.setDate(complete_start_date.getDate() - 7);
            // week = week+7;
        // }
        for(k = 0; k < week; k++){
            complete_start_date.setDate(complete_start_date.getDate() + 1);
            if(complete_start_date.getMonth()+1 === y_m_arr[i][1]){
                lis += '<li class="disable"><div class="li_wrap"><p>'+complete_start_date.getDate()+'</p></div></li>';
            }else{
                lis += '<li class="disable"><div class="li_wrap"></div></li>';
            }
        }
        var temp_today = new_date(today_arr);
        temp_today.setDate(temp_today.getDate() + earlier_date - 1);
        for(j = from; j <= to; j.setDate(j.getDate() + 1)){
            var date_text = j.getFullYear()+'-'+(j.getMonth()+1)+'-'+j.getDate();
            var price = data_arr['date_'+j.getTime()]
            var price_date_string = '';
            if(price){
                price_date_string = 'data-youhui_price="'+price[0]+'" data-child_price="'+price[1]+'"';
            }
            var J_batch_li_str = 'J_batch_li';
            //是否在有效期内
            if(j <= temp_today){
                lis += '<li class="disable" data-date="'+date_text+'" '+price_date_string+'>';
                J_batch_li_str = '';
            }else{
                lis += '<li data-date="'+date_text+'" '+price_date_string+'>';
            }
            //是否节日
            if(false){
                lis += '<div class="li_wrap '+J_batch_li_str+' jieri">';
            }else{
                lis += '<div class="li_wrap '+J_batch_li_str+'">';
            }
            //是否今天
            if(j.toString() === new_date(today_arr).toString()){
                lis += '<p>今天</p>';
            }else{
                lis += '<p>'+j.getDate()+'</p>';
            }

            //当前日期是否有价格
            if(j > temp_today){
                if(price){
                    lis += '<a class="price" href="javascript:;">￥'+price[0]+(caigou_type?'':'<i class="J_del_price"></i>')+'</a>';
                }else{
                    if(!caigou_type){
                        lis += '<a class="add_date_price J_add_date_price" href="javascript:;">添加价格</a>'
                    }
                }
            }
            //'<i class="jieri_tit">中秋节</i>'
            lis += '</div>'
            lis += '</li>'
        }
        html += section_month_template.replace('$year',y_m_arr[i][0])
                                      .replace('$month',y_m_arr[i][1])
                                      .replace('$lis',lis)
                                      .replace('$is_display',hd_is_display)
                                      .replace('$z_index',10-i);
    }
    $('#J_date_table').append(html);
    //日期表格事件绑定
    $('.month_row .bd li').on('data_insert',function(){
        var self = $(this);
        var youhui_price = self.data('youhui_price');
        if(youhui_price){
            self.find('.J_add_date_price').remove();
            if(self.find('.price').length==0){
                self.find('.li_wrap').append('<a class="price" href="javascript:;">￥'+youhui_price+'<i class="J_del_price"></i></a>');
            }else{
                self.find('.price').html('￥'+youhui_price+'<i class="J_del_price"></i>');
            }
        }else{
            self.find('.price').remove();
            if(self.find('.J_add_date_price').length==0){
                self.find('.li_wrap').append('<a class="add_date_price J_add_date_price" href="javascript:;">添加价格</a>');
            }
        }
    })
    $('.J_add_price_dialog').click(function(event){
        stop_bubble(event);
    })
    $('.J_add_price_dialog').on('click','.J_quick_edit_input',function(){
        $(this).addClass('on').off('blur').blur(function(){
            var self = $(this);
            if(self.val() === ''){
                self.removeClass('on')
            }
        })
    })
    $('.J_add_price_dialog .ok_btn').click(function(){
        var self = $(this);
        var youhui_price = self.siblings('.youhui').val();
        var child_price = self.siblings('.child').val();
        // if(child_price && parseInt(youhui_price,10) < parseInt(child_price,10)){
            // alert_fail('儿童价不能高于优惠价，可不填儿童价');
            // return;
        // }
        if(!check_price(parseInt(youhui_price,10))){
            return;
        }
        self.parent().hide();
        var li = self.data('li_target');
        li.data('youhui_price',youhui_price);
        li.data('child_price',child_price);
        li.trigger('data_insert');
    })
    var timeout_event_fun = function(){};
    var timeout_event = function(pretime){
        setTimeout(function(){
            timeout_event_fun();
            timeout_event(pretime);
        },pretime)
    }
    timeout_event(500);
    var add_price_dialog_inputs = $('.month_row .J_add_price_dialog input');
    timeout_event_fun = function(){
        add_price_dialog_inputs.each(function(){
            var val = this.value;
            if(val === ''){
                return;
            }
            var filter_val = val.replace(/[^0-9]/g,'');//剔除非数字字符
            filter_val = filter_val.replace(/^0+/g,'');//剔除首位为0的数字
            if(filter_val === val){
                return;
            }
            this.value = filter_val;
        });
    }
    $('.month_row').on('start_quick_mode',function(){
        $(this).find('.bd li:not(.disable)').each(function(){
            var self = $(this);
            var youhui_price = self.data('youhui_price');
            youhui_price = youhui_price?youhui_price:'';
            var child_price = self.data('child_price');
            child_price = child_price?child_price:'';
            var html = ''+
                    '<div class="li_wrap J_quick_li">'+
                        '<p>'+self.data('date').split('-')[2]+'</p>'+
                        '<input type="text" class="youhui J_quick_edit_input '+(youhui_price?'on':'')+'" value="'+youhui_price+'"/>'+
                        '<input type="text" class="child J_quick_edit_input '+(child_price?'on':'')+'" value="'+child_price+'"/>'+
                    '</div>';
            self.append(html);
        })
        $(this).addClass('quick_price_edit').find('.J_batch_li').hide();
        $('.J_quick_edit_input').off().focus(function(){
            var self = this;
            var type = 'youhui';
            var parent_li = $(this).parents('li');
            parent_li.addClass('J_has_change');
            if($(this).hasClass('child')){
                type = 'child';
            }
            timeout_event_fun = function(){
                var val = self.value;
                if(val === ''){
                    return;
                }
                var filter_val = val.replace(/[^0-9]/g,'');//剔除非数字字符
                filter_val = filter_val.replace(/^0+/g,'');//剔除首位为0的数字
                parent_li.data(type+'_price',filter_val);
                if(filter_val === val){
                    return;
                }
                self.value = filter_val;
            }
        });
        
    })
    $('.month_row').on('end_quick_mode',function(){
        var self = $(this);
        if(self.hasClass('quick_price_edit')){
            var lis = self.find('.bd li:not(.disable)');
            lis.each(function(){
                var self = $(this);
                self.find('.J_quick_li').hide();
                self.find('.J_batch_li').show();
            })
            lis.filter('.J_has_change').trigger('data_insert');
            self.removeClass('quick_price_edit');
            timeout_event_fun = function(){
                add_price_dialog_inputs.each(function(){
                    var val = this.value;
                    if(val === ''){
                        return;
                    }
                    var filter_val = val.replace(/[^0-9]/g,'');//剔除非数字字符
                    filter_val = filter_val.replace(/^0+/g,'');//剔除首位为0的数字
                    if(filter_val === val){
                        return;
                    }
                    this.value = filter_val;
                });
            }
        }
    })
    $('body').click(function(){
        $('.J_add_price_dialog').hide();
    })
    
    //日历控件
        $('.input_calendar input').each(function(){
            var self = $(this);
            if( 'on' !== self.data('input_calendar') ){
                self.data('input_calendar','on');
                self.click(function(event){
                    $('body').trigger('click');
                    var self = this;
                    var $self = $(self);
                    stop_bubble(event);
                    $self.blur();
                    if(self.date_select){
                        self.date_select.toggle();
                    }else{
                        var today = [];
                        var min_date = $self.data('min_date');
                        var max_date = $self.data('max_date');
                        $self.data('orign_min_date',min_date);
                        $self.data('orign_max_date',max_date);
                        self.reset_data_select = function(){
                            var date_select = self.date_select;
                            if(date_select){
                                date_select.con.min_date = $(self).data('orign_min_date');
                                date_select.con.max_date = $(self).data('orign_max_date');
                            }
                            self.value = '';
                        };
                        var day_limit = $self.data('day_limit');
                        $.each($('#today').val().split('-'),function(){
                            today[today.length] = parseInt(this,10);
                        })
                        $self.date_select({
                            dom : self,
                            cur_date : today,
                            min_date : min_date,
                            max_date : max_date,
                            day_limit: day_limit,
                            today : $.merge([],today),
                            day_callback : function(){
                                var con = this;
                                var $self = $(con.dom);
                                var select_date = con.cur_date[0]+'-'+con.cur_date[1]+'-'+con.cur_date[2];
                                $self.val(select_date);
                                con.dom.date_select.hide();
                                var date_select = null;
                                var target = null;
                                
                                //日期改变(天)
                                if((typeof date_change_item) === 'function'){
                                    date_change_item();
                                }
                                if($self.data('start_date_selecter')){
                                    target = $($self.data('start_date_selecter'));
                                    date_select = target[0].date_select;
                                    if(date_select){
                                        date_select.con.max_date = select_date;
                                    }else{
                                        target.data('max_date',select_date);
                                    }
                                    
                                }
                                if($self.data('end_date_selecter')){
                                    target = $($self.data('end_date_selecter'));
                                    date_select = target[0].date_select;
                                    if(date_select){
                                        date_select.con.min_date = select_date;
                                    }else{
                                        target.data('min_date',select_date);
                                    }
                                }
                                $self.focus();
                                $self.blur();
                                $self.change();
                            },
                            year_month_callback : function(){
                                var con = this;
                            },
                            init_callback : function(){
                                var con = this;
                                $(document).bind('click',function(){
                                    con.dom.date_select.hide();
                                })
                            },
                            hide_callback:function(){
                                $(this.dom).removeClass('selected');
                            },
                            show_callback:function(){
                                $(this.dom).addClass('selected');
                            },
                            clear_callback:function(){
                                var $self = $(this.dom);
                                this.dom.date_select.hide();
                                $self.val('');
                                $self.focus();
                                $self.blur();
                                $self.change();
                                date_change_item();
                            }
                        })
                    }
                });
            }
        });
    
})
})(jQuery_1_10_2)

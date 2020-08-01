$(function(){

    if(!window.base.getLocalStorage('token')){
        window.location.href = 'login.html';
    }
    //循环左边的按钮，点击时给清除所有按钮的样式，让右边的内容都隐藏
    // 同时给自己加上样式，根据自己的索引值，让对应位置的右边内容显示
    //实现点击不同按钮，显示不同内容
    $('.leftbar-item a').each(function(){
        var _this = $(this);
        _this.on('click',function () {
            clearActive();
            _this.attr('class','active');
            var index = $('.leftbar-item a').index(_this);
            $('.desktop-main').eq(index).attr('class','desktop-main show')
        })
    })

    //清除样式，隐藏内容
    function clearActive(){
        $('.leftbar-item a').each(function(){
            var _this = $(this);
            _this.attr('class','')
        })
        $('.desktop-main').each(function(){
            var _this = $(this);
            _this.attr('class','desktop-main')
        })
    }

    var orderPageIndex=1,
        basicPageIndex = 1,
        imgPageIndex=1,
        detailPageIndex=1,
        pestPageIndex=1,
        propertyPageIndex=1,
        worthPageIndex=1,
        moreOrderFlag=true,
        imgTotalPages = 0,
        basicTotalPages = 0,
        pestTotalPages = 0,
        detailTotalPages = 0,
        propertyTotalPages = 0,
        worthTotalPages = 0;
    getOrders(orderPageIndex);
    getBasic(basicPageIndex);
    getImg(imgPageIndex);
    getDetailImg(detailPageIndex);
    getPest(pestPageIndex);
    getProperty(propertyPageIndex);
    getWorth(worthPageIndex);


    /*
    * 获取订单数据 分页
    * params:
    * pageIndex - {int} 分页下表  1开始
    */

    function getOrders(orderPageIndex){
        var params={
            url:'order/by_super/' + orderPageIndex,
            tokenFlag:true,
            sCallback:function(res) {
                var str = getOrderHtmlStr(res);
                $('#order-table').append(str);
            }
        };
        window.base.getData(params);
    }


    /*
    * 获取植物基本数据 分页
    * params:
    * pageIndex - {int} 分页下表  1开始
    */

    function getBasic(basicPageIndex){
        var params={
            url:'admin/product/' + basicPageIndex,
            tokenFlag:true,
            sCallback:function(res) {
                $('.plantCurrent').text('第' + res.currentPage + '页');
                basicTotalPages = getTotalPages(res);
                $('.plantTotal').text('共' + basicTotalPages + '页');
                var str = getBasicHtmlStr(res);
                $('#basic-table').empty();
                $('#basic-table').append(str);
            }
        };
        window.base.getData(params);
    }

    /*
    * 获取所有图片数据 分页
    * params:
    * pageIndex - {int} 分页下表  1开始
    */

    function getImg(imgPageIndex){
        var params={
            url:'admin/img/' + imgPageIndex,
            tokenFlag:true,
            sCallback:function(res) {
                $('.imgCurrent').text('第' + res.currentPage + '页');
                imgTotalPages = getTotalPages(res);
                $('.imgTotal').text('共' + imgTotalPages + '页');
                var str = getImgHtmlStr(res);
                $('#img-table').empty();
                $('#img-table').append(str);
            }
        };
        window.base.getData(params);
    }

    /*
    * 获取植物详情图片数据 分页
    * params:
    * pageIndex - {int} 分页下表  1开始
    */

    function getDetailImg(detailPageIndex){
        var params={
            url:'admin/detailImg/' + detailPageIndex,
            tokenFlag:true,
            sCallback:function(res) {
                $('.detailCurrent').text('第' + res.currentPage + '页');
                detailTotalPages = getTotalPages(res);
                $('.detailTotal').text('共' + detailTotalPages + '页');
                var str = getDetailHtmlStr(res);
                $('#detailImg-table').empty();
                $('#detailImg-table').append(str);
            }
        };
        window.base.getData(params);
    }

    /*
        * 获取植物病虫害数据 分页
        * params:
        * pageIndex - {int} 分页下表  1开始
        */
    function getPest(pestPageIndex){
        var params={
            url:'admin/pest/' + pestPageIndex,
            tokenFlag:true,
            sCallback:function(res) {
                $('.pestCurrent').text('第' + res.currentPage + '页');
               pestTotalPages = getTotalPages(res);
                $('.pestTotal').text('共' + pestTotalPages + '页');
                var str = getPestHtmlStr(res);
                $('#pest-table').empty();
                $('#pest-table').append(str);
            }
        };
        window.base.getData(params);
    }


    //分页获取植物属性信息
    function getProperty(propertyPageIndex){
        var params={
            url:'admin/property/' + propertyPageIndex,
            tokenFlag:true,
            sCallback:function(res) {
                $('.propertyCurrent').text('第' + res.currentPage + '页');
                propertyTotalPages = getTotalPages(res);
                $('.propertyTotal').text('共' + propertyTotalPages + '页');
                var str = getPropertyHtmlStr(res);
                $('#property-table').empty();
                $('#property-table').append(str);
            }
        };
        window.base.getData(params);
    }

    //分页获取植物价值
    function getWorth(worthPageIndex){
        var params={
            url:'admin/worth/' + worthPageIndex,
            tokenFlag:true,
            sCallback:function(res) {
                $('.worthCurrent').text('第' + res.currentPage + '页');
                worthTotalPages = getTotalPages(res);
                $('.worthTotal').text('共' + worthTotalPages + '页');
                var str = getWorthHtmlStr(res);
                $('#worth-table').empty();
                $('#worth-table').append(str);
            }
        };
        window.base.getData(params);
    }

    /*拼接订单html字符串*/
    function getOrderHtmlStr(res){
        var data = res.data;
        if (data){
            var len = data.length,
                str = '', item;
            if(len>0) {
                for (var i = 0; i < len; i++) {
                    item = data[i];
                    str += '<tr>' +
                        '<td>' + item.order_no + '</td>' +
                        '<td>' + item.snap_name + '</td>' +
                        '<td>' + item.total_count + '</td>' +
                        '<td>￥' + item.total_price + '</td>' +
                        '<td>' + getOrderStatus(item.status) + '</td>' +
                        '<td>' + item.create_time + '</td>' +
                        '<td data-id="' + item.id + '">' + getBtns(item.status) + '</td>' +
                        '</tr>';
                }
            }
            else{
                ctrlLoadMoreBtn();
                moreOrderFlag = false;
            }
            return str;
        }
        return '';
    }

    /*根据订单状态获得标志*/
    function getOrderStatus(status){
        var arr=[{
            cName:'unpay',
            txt:'未付款'
        },{
            cName:'payed',
            txt:'已付款'
        },{
            cName:'done',
            txt:'已发货'
        },{
            cName:'unstock',
            txt:'缺货'
        }];
        return '<span class="order-status-txt '+arr[status-1].cName+'">'+arr[status-1].txt+'</span>';
    }

    /*根据订单状态获得 操作按钮*/
    function getBtns(status){
        var arr=[{
            cName:'done',
            txt:'发货'
        },{
            cName:'unstock',
            txt:'缺货'
        }];
        if(status==2 || status==4){
            var index=0;
            if(status==4){
                index=1;
            }
            return '<span class="order-btn '+arr[index].cName+'">'+arr[index].txt+'</span>';
        }else{
            return '';
        }
    }

    /*控制加载更多按钮的显示*/
    function ctrlLoadMoreBtn(){
        if(moreOrderFlag) {
            $('.load-more').hide().next().show();
        }
    }

    // 根据数据表总共条数，计算总页数
    function getTotalPages(res){
        var total = res.total;
        var pages = 0;
        if(total % 10 != 0){
            pages = parseInt(total / 10)  + 1;
        }else{
            pages = parseInt(total / 10);
        }
        return pages;
    }


    /*拼接植物基本信息html字符串*/
    function getBasicHtmlStr(res){
        var data = res.data;
        if (data){
            var len = data.length,
                str = '', item;
            if(len>0) {
                for (var i = 0; i < len; i++) {
                    item = data[i];
                    str += '<tr>' +
                        '<td>' + item.id + '</td>' +
                        '<td>' + item.name + '</td>' +
                        '<td>￥' + item.price + '</td>' +
                        '<td>' + item.stock + '</td>' +
                        '<td>' + item.category_id+ '</td>' +
                        '<td>' + item.main_img_url + '</td>' +
                        '<td>' + item.img_id + '</td>' +
                        '<td>' + item.star + '</td>' +
                        '<td>' + item.flower_language + '</td>' +
                        '<td data-id="' + item.id + '">' + '<span class="deletePlant-btn">'+'删除'+'</span>' + '</td>' +
                        '<td data-id="' + item.id + '">' + '<span class="updatePlant-btn">'+'更新'+'</span>' + '</td>' +
                        '</tr>';
                }
            }
            return str;
        }
        return '';
    }

    /*拼接所有图片html字符串*/
    function getImgHtmlStr(res){
        var data = res.data;
        if (data){
            var len = data.length,
                str = '', item;
            if(len>0) {
                for (var i = 0; i < len; i++) {
                    item = data[i];
                    str += '<tr>' +
                        '<td>' + item.id + '</td>' +
                        '<td>' + item.url + '</td>' +
                        '<td>' + item.from + '</td>' +
                        '<td data-id="' + item.id + '">' + '<span class="deleteImg-btn">'+'删除'+'</span>' + '</td>' +
                        '<td data-id="' + item.id + '">' + '<span class="updateImg-btn">'+'更新'+'</span>' + '</td>' +
                        '</tr>';
                }
            }
            return str;
        }
        return '';
    }

    /*拼接植物详细图片html字符串*/
    function getDetailHtmlStr(res){
        var data = res.data;
        if (data){
            var len = data.length,
                str = '', item;
            if(len>0) {
                for (var i = 0; i < len; i++) {
                    item = data[i];
                    str += '<tr>' +
                        '<td>' + item.id + '</td>' +
                        '<td>' + item.img_id + '</td>' +
                        '<td>' + item.product_id + '</td>' +
                        '<td data-id="' + item.id + '">' + '<span class="deleteDetail-btn">'+'删除'+'</span>' + '</td>' +
                        '<td data-id="' + item.id + '">' + '<span class="updateDetail-btn">'+'更新'+'</span>' + '</td>' +
                        '</tr>';
                }
            }
            return str;
        }
        return '';
    }

    /*拼接植物病虫害html字符串*/
    function getPestHtmlStr(res){
        var data = res.data;
        if (data){
            var len = data.length,
                str = '', item;
            if(len>0) {
                for (var i = 0; i < len; i++) {
                    item = data[i];
                    str += '<tr>' +
                        '<td>' + item.id + '</td>' +
                        '<td>' + item.name + '</td>' +
                        '<td nowrap="nowrap">' + item.detail + '</td>' +
                        '<td>' + item.product_id + '</td>' +
                        '<td data-id="' + item.id + '">' + '<span class="deletePest-btn">'+'删除'+'</span>' + '</td>' +
                        '<td data-id="' + item.id + '">' + '<span class="updatePest-btn">'+'更新'+'</span>' + '</td>' +
                        '</tr>';
                }
            }
            return str;
        }
        return '';
    }

    /*拼接植物属性html字符串*/
    function getPropertyHtmlStr(res){
        var data = res.data;
        if (data){
            var len = data.length,
                str = '',
                item;
            if(len>0) {
                for (var i = 0; i < len; i++) {
                    item = data[i];
                    str += '<tr>' +
                        '<td>' + item.id + '</td>' +
                        '<td>' + item.name + '</td>' +
                        '<td nowrap="nowrap">' + item.detail + '</td>' +
                        '<td>' + item.product_id + '</td>' +
                        '<td data-id="' + item.id + '">' + '<span class="deleteProperty-btn">'+'删除'+'</span>' + '</td>' +
                        '<td data-id="' + item.id + '">' + '<span class="updateProperty-btn">'+'更新'+'</span>' + '</td>' +
                        '</tr>';
                }
            }
            return str;
        }
        return '';
    }

    /*拼接植物价值html字符串*/
    function getWorthHtmlStr(res){
        var data = res.data;
        if (data){
            var len = data.length,
                str = '',
                item;
            if(len>0) {
                for (var i = 0; i < len; i++) {
                    item = data[i];
                    str += '<tr>' +
                        '<td>' + item.id + '</td>' +
                        '<td>' + item.name + '</td>' +
                        '<td nowrap="nowrap">' + item.detail + '</td>' +
                        '<td>' + item.product_id + '</td>' +
                        '<td data-id="' + item.id + '">' + '<span class="deleteWorth-btn">'+'删除'+'</span>' + '</td>' +
                        '<td data-id="' + item.id + '">' + '<span class="updateWorth-btn">'+'更新'+'</span>' + '</td>' +
                        '</tr>';
                }
            }
            return str;
        }
        return '';
    }


    /*加载更多订单*/
    $(document).on('click','.load-more',function(){
        if(moreOrderFlag) {
            orderPageIndex++;
            getOrders(orderPageIndex);
        }
    });

    /*发货*/
    $(document).on('click','.order-btn.done',function(){
        var $this=$(this),
            $td=$this.closest('td'),
            $tr=$this.closest('tr'),
            id=$td.attr('data-id'),
            $tips=$('.global-tips'),
            $p=$tips.find('p');
        var params={
            url:'order/update',
            type:'post',
            data:{
                'id':id,
                'status':3
            },
            tokenFlag:true,
            sCallback:function(res) {
                if(res.code.toString().indexOf('2')==0){
                    $tr.find('.order-status-txt')
                        .removeClass('payed').addClass('done')
                        .text('已发货');
                    $this.remove();
                    $p.text('操作成功');
                }else{
                    $p.text('操作失败');
                }
                $tips.show().delay(1500).hide(0);
            },
            eCallback:function(){
                $p.text('操作失败');
                $tips.show().delay(1500).hide(0);
            }
        };
        window.base.getData(params);
    });


    /*加载下一页图片*/
    $(document).on('click','.nextImg',function(){
            imgPageIndex++;
            if(imgPageIndex > imgTotalPages){
                alert('已经是最后一页了');
                imgPageIndex = imgPageIndex - 1;
            }else{
                getImg(imgPageIndex);
            }
    });

    /*加载上一页图片*/
    $(document).on('click','.preImg',function(){
        imgPageIndex--;
            if(imgPageIndex == 0){
                alert('已经是第一页了');
                imgPageIndex = 1;
            }else{
                getImg(imgPageIndex);
            }
    });

    /*加载下一页植物*/
    $(document).on('click','.nextPlant',function(){
        basicPageIndex++;
        if(basicPageIndex > basicTotalPages){
            alert('已经是最后一页了');
            basicPageIndex = basicPageIndex - 1;
        }else{
            getBasic(basicPageIndex);
        }
    });

    /*加载上一页植物*/
    $(document).on('click','.prePlant',function(){
        basicPageIndex--;
        if(basicPageIndex == 0){
            alert('已经是第一页了');
            basicPageIndex = 1;
        }else{
            getBasic(basicPageIndex);
        }
    });


    /*加载下一页植物详情图片*/
    $(document).on('click','.nextDetail',function(){
        detailPageIndex++;
        if(detailPageIndex > detailTotalPages){
            alert('已经是最后一页了');
            detailPageIndex = detailPageIndex - 1;
        }else{
            getDetailImg(detailPageIndex);
        }
    });

    /*加载上一页植物详情图片*/
    $(document).on('click','.preDetail',function(){
        detailPageIndex--;
        if(detailPageIndex == 0){
            alert('已经是第一页了');
            detailPageIndex = 1;
        }else{
            getDetailImg(detailPageIndex);
        }
    });

    /*加载下一页植物病虫害*/
    $(document).on('click','.nextPest',function(){
        pestPageIndex++;
        if(pestPageIndex > pestTotalPages){
            alert('已经是最后一页了');
            pestPageIndex = pestPageIndex - 1;
        }else{
            getPest(pestPageIndex);
        }
    });

    /*加载上一页植物病虫害*/
    $(document).on('click','.prePest',function(){
        pestPageIndex--;
        if(pestPageIndex == 0){
            alert('已经是第一页了');
            pestPageIndex = 1;
        }else{
            getPest(pestPageIndex);
        }
    });

    /*加载下一页植物属性*/
    $(document).on('click','.nextProperty',function(){
        propertyPageIndex++;
        if(propertyPageIndex > propertyTotalPages){
            alert('已经是最后一页了');
            propertyPageIndex = propertyPageIndex - 1;
        }else{
            getProperty(propertyPageIndex);
        }
    });

    /*加载上一页植物属性*/
    $(document).on('click','.preProperty',function(){
        propertyPageIndex--;
        if(propertyPageIndex == 0){
            alert('已经是第一页了');
            propertyPageIndex = 1;
        }else{
            getProperty(propertyPageIndex);
        }
    });

    /*加载下一页植物价值*/
    $(document).on('click','.nextWorth',function(){
        worthPageIndex++;
        if(worthPageIndex > worthTotalPages){
            alert('已经是最后一页了');
            worthPageIndex = worthPageIndex - 1;
        }else{
            getWorth(worthPageIndex);
        }
    });

    /*加载上一页植物价值*/
    $(document).on('click','.preWorth',function(){
        worthPageIndex--;
        if(worthPageIndex == 0){
            alert('已经是第一页了');
            worthPageIndex = 1;
        }else{
            getWorth(worthPageIndex);
        }
    });

    /*删除图片*/
    $(document).on('click','.deleteImg-btn',function(){
        var $this=$(this),
            $td=$this.closest('td'),
            id=$td.attr('data-id');
            $tips=$('.global-tips'),
            $p=$tips.find('p');
        var params={
            url:'delete/img',
            type:'post',
            data:{
                'id':id
            },
            tokenFlag:true,
            sCallback:function(res) {
                if(res.code.toString().indexOf('2')==0){
                    $p.text('删除成功');
                    getImg(imgPageIndex);
                }else{
                    $p.text('操作失败');
                }
                $tips.show().delay(1500).hide(0);
            },
            eCallback:function(){
                $p.text('操作失败');
                $tips.show().delay(1500).hide(0);
            }
        };
        window.base.getData(params);
    });


    //点击了更新图片
    $(document).on('click','.updateImg-btn',function(){
        var $this=$(this),
            //找到绑定在单元格上的id号
            $td=$this.closest('td'),
            $id=$td.attr('data-id'),
            //找到当前行
            $tr=$this.parents('tr');
        $('.createImg').css({"display":"flex"});
        $('.bgGrey').css({"display":"block"});
        $('.createImg .message:first').val($id);
        $('.createImg .imgName').val($tr.children("td:nth-child(2)").text().slice(35));
    });
    // 新增图片
    // 点击了新增
    $(document).on('click','.newImg',function(){
        $('.createImg').css({"display":"flex"});
        $('.bgGrey').css({"display":"block"});
    });
    //点击了取消
    $(document).on('click','.createImg .cancel',function(){
        clearImgNew();
    });
    //点击了重置
    $(document).on('click','.createImg .reset',function(){
        $('.createImg .message:first').val('');
        $('.createImg .imgName').val('')
    });
    //点击了提交
    $(document).on('click','.createImg .submit',function(){
        var obj = {
            "id":$('.createImg .message:first').val(),
            "url":$('.createImg .imgName').val()
        }
        clearImgNew();
        $tips=$('.global-tips'),
            $p=$tips.find('p');
        var params={
            url:'create/img',
            type:'post',
            data:obj,
            tokenFlag:true,
            sCallback:function(res) {
                if(res.code.toString().indexOf('2')==0){
                    $p.text('已经新增或更新一条记录');
                    getImg(imgPageIndex);
                }else{
                    $p.text('操作失败');
                }
                $tips.show().delay(1500).hide(0);
            },
            eCallback:function(){
                $p.text('操作失败');
                $tips.show().delay(1500).hide(0);
            }
        };
        window.base.getData(params);
    });


    //隐藏新增图片 表单并清空
    function clearImgNew(){
        $('.createImg').css({"display":"none"});
        $('.bgGrey').css({"display":"none"});
        $('.createImg .message:first').val('');
        $('.createImg .imgName').val('')
    }



    /*删除植物*/
    $(document).on('click','.deletePlant-btn',function(){
        var $this=$(this),
            $td=$this.closest('td'),
            id=$td.attr('data-id');
        $tips=$('.global-tips'),
            $p=$tips.find('p');
        var params={
            url:'delete/product',
            type:'post',
            data:{
                'id':id
            },
            tokenFlag:true,
            sCallback:function(res) {
                if(res.code.toString().indexOf('2')==0){
                    $p.text('删除成功');
                    getBasic(basicPageIndex);
                }else{
                    $p.text('操作失败');
                }
                $tips.show().delay(1500).hide(0);
            },
            eCallback:function(){
                $p.text('操作失败');
                $tips.show().delay(1500).hide(0);
            }
        };
        window.base.getData(params);
    });
    //点击了更新植物
    $(document).on('click','.updatePlant-btn',function(){
        var $this=$(this),
            //找到绑定在单元格上的id号
            $td=$this.closest('td'),
            $id=$td.attr('data-id'),
            //找到当前行
            $tr=$this.parents('tr');
        $('.createPlant').css({"display":"flex"});
        $('.bgGrey').css({"display":"block"});
        $('.createPlant .message:first').val($id);
        $('.createPlant .plantName').val($tr.children("td:nth-child(2)").text());
        $('.createPlant .plantPrice').val($tr.children("td:nth-child(3)").text().slice(1));
        $('.createPlant .plantStock').val($tr.children("td:nth-child(4)").text());
        $('.createPlant .plantCategory').val($tr.children("td:nth-child(5)").text());
        $('.createPlant .basicImg').val($tr.children("td:nth-child(6)").text().slice(35));
        $('.createPlant .basicImgId').val($tr.children("td:nth-child(7)").text());
        $('.createPlant .plantStar').val($tr.children("td:nth-child(8)").text());
        $('.createPlant .flowerLanguage').val($tr.children("td:nth-child(9)").text());
    });
    // 新增植物
    //点击了新增
    $(document).on('click','.newPlant',function(){
        $('.createPlant').css({"display":"flex"});
        $('.bgGrey').css({"display":"block"});
    });
    //点击了取消
    $(document).on('click','.createPlant .cancel',function(){
        clearPlantNew();
    });
    //点击了重置
    $(document).on('click','.createPlant .reset',function(){
        $('.createPlant .content input').val('');
    });
    //点击了提交
    $(document).on('click','.createPlant .submit',function(){
        var obj = {
            "id":$('.createPlant .message:first').val(),
            "name":$('.createPlant .plantName').val(),
            "price":$('.createPlant .plantPrice').val(),
            "stock":$('.createPlant .plantStock').val(),
            "category":$('.createPlant .plantCategory').val(),
            "url":$('.createPlant .basicImg').val(),
            "img_id":$('.createPlant .basicImgId').val(),
            "star":$('.createPlant .plantStar').val(),
            "flower_language":$('.createPlant .flowerLanguage').val()
        }
        clearPlantNew();
        $tips=$('.global-tips'),
            $p=$tips.find('p');
        var params={
            url:'create/plant',
            type:'post',
            data:obj,
            tokenFlag:true,
            sCallback:function(res) {
                if(res.code.toString().indexOf('2')==0){
                    $p.text('已经新增或更新一条记录');
                    getBasic(basicPageIndex);
                }else{
                    $p.text('操作失败');
                }
                $tips.show().delay(1500).hide(0);
            },
            eCallback:function(){
                $p.text('操作失败');
                $tips.show().delay(1500).hide(0);
            }
        };
        window.base.getData(params);
    });

    //隐藏新增植物表单并清空
    function clearPlantNew(){
        $('.createPlant').css({"display":"none"});
        $('.bgGrey').css({"display":"none"});
        $('.createPlant .content input').val('');
    }




    /*删除植物详细图片*/
    $(document).on('click','.deleteDetail-btn',function(){
        var $this=$(this),
            $td=$this.closest('td'),
            id=$td.attr('data-id');
        $tips=$('.global-tips'),
            $p=$tips.find('p');
        var params={
            url:'delete/detail',
            type:'post',
            data:{
                'id':id
            },
            tokenFlag:true,
            sCallback:function(res) {
                if(res.code.toString().indexOf('2')==0){
                    $p.text('删除成功');
                    getDetailImg(detailPageIndex);
                }else{
                    $p.text('操作失败');
                }
                $tips.show().delay(1500).hide(0);
            },
            eCallback:function(){
                $p.text('操作失败');
                $tips.show().delay(1500).hide(0);
            }
        };
        window.base.getData(params);
    });

    //隐藏新增植物表单并清空
    function clearDetailNew(){
        $('.createDetail').css({"display":"none"});
        $('.bgGrey').css({"display":"none"});
        $('.createDetail .content input').val('');
    }
    //点击了更新详情图片
    $(document).on('click','.updateDetail-btn',function(){
        var $this=$(this),
            //找到绑定在单元格上的id号
            $td=$this.closest('td'),
            $id=$td.attr('data-id'),
            //找到当前行
            $tr=$this.parents('tr');
        $('.createDetail').css({"display":"flex"});
        $('.bgGrey').css({"display":"block"});
        $('.createDetail .message:first').val($id);
        $('.createDetail .img_id').val($tr.children("td:nth-child(2)").text());
        $('.createDetail .product_id').val($tr.children("td:nth-child(3)").text());
    });
    // 新增植物详情图片
    //点击了新增
    $(document).on('click','.newDetail',function(){
        $('.createDetail').css({"display":"flex"});
        $('.bgGrey').css({"display":"block"});
    })
    //点击了取消
    $(document).on('click','.createDetail .cancel',function(){
        clearDetailNew();
    })
    //点击了重置
    $(document).on('click','.createDetail .reset',function(){
        $('.createDetail .content input').val('');
    })
    //点击了提交
    $(document).on('click','.createDetail .submit',function(){
        var obj = {
            "id":$('.createDetail .message:first').val(),
            "img_id":$('.createDetail .img_id').val(),
            "product_id":$('.createDetail .product_id').val()
        }
        clearDetailNew();
        $tips=$('.global-tips'),
            $p=$tips.find('p');
        var params={
            url:'create/detail',
            type:'post',
            data:obj,
            tokenFlag:true,
            sCallback:function(res) {
                if(res.code.toString().indexOf('2')==0){
                    $p.text('已经新增或更新一条记录');
                    getDetailImg(detailPageIndex);
                }else{
                    $p.text('操作失败');
                }
                $tips.show().delay(1500).hide(0);
            },
            eCallback:function(){
                $p.text('操作失败');
                $tips.show().delay(1500).hide(0);
            }
        };
        window.base.getData(params);
    })




    /*删除植物病虫害*/
    $(document).on('click','.deletePest-btn',function(){
        var $this=$(this),
            $td=$this.closest('td'),
            id=$td.attr('data-id');
        $tips=$('.global-tips'),
            $p=$tips.find('p');
        var params={
            url:'delete/pest',
            type:'post',
            data:{
                'id':id
            },
            tokenFlag:true,
            sCallback:function(res) {
                if(res.code.toString().indexOf('2')==0){
                    $p.text('删除成功');
                    getPest(pestPageIndex);
                }else{
                    $p.text('操作失败');
                }
                $tips.show().delay(1500).hide(0);
            },
            eCallback:function(){
                $p.text('操作失败');
                $tips.show().delay(1500).hide(0);
            }
        };
        window.base.getData(params);
    });
    //点击了更新病虫害
    $(document).on('click','.updatePest-btn',function(){
        var $this=$(this),
            //找到绑定在单元格上的id号
            $td=$this.closest('td'),
            $id=$td.attr('data-id'),
            //找到当前行
            $tr=$this.parents('tr');
        $('.createPest').css({"display":"flex"});
        $('.bgGrey').css({"display":"block"});
        $('.createPest .message:first').val($id);
        $('.createPest .pest_name').val($tr.children("td:nth-child(2)").text());
        $('.createPest .pest_detail').val($tr.children("td:nth-child(3)").text());
        $('.createPest .product_id').val($tr.children("td:nth-child(4)").text());
    });
    // 新增植物病虫害
    //点击了新增
    $(document).on('click','.newPest',function(){
        $('.createPest').css({"display":"flex"});
        $('.bgGrey').css({"display":"block"});
    });
    //点击了取消
    $(document).on('click','.createPest .cancel',function(){
        clearPestNew();
    });
    //点击了重置
    $(document).on('click','.createPest .reset',function(){
        $('.createPest .content .message').val('');
    });
    //点击了提交
    $(document).on('click','.createPest .submit',function(){
        var obj = {
            "id":$('.createPest .message:first-child').val(),
            "name":$('.createPest .pest_name').val(),
            "detail":$('.createPest .pest_detail').val(),
            "product_id":$('.createPest .product_id').val()
        }
        clearPestNew();
        $tips=$('.global-tips'),
            $p=$tips.find('p');
        var params={
            url:'create/pest',
            type:'post',
            data:obj,
            tokenFlag:true,
            sCallback:function(res) {
                if(res.code.toString().indexOf('2')==0){
                    $p.text('已经新增或更新一条记录');
                    getPest(pestPageIndex);
                }else{
                    $p.text('操作失败');
                }
                $tips.show().delay(1500).hide(0);
            },
            eCallback:function(){
                $p.text('操作失败');
                $tips.show().delay(1500).hide(0);
            }
        };
        window.base.getData(params);
    });
    //隐藏新增病虫害表单并清空
    function clearPestNew(){
        $('.createPest').css({"display":"none"});
        $('.bgGrey').css({"display":"none"});
        $('.createPest .content .message').val('');
    }


    /*删除植物属性*/
    $(document).on('click','.deleteProperty-btn',function(){
        var $this=$(this),
            $td=$this.closest('td'),
            id=$td.attr('data-id');
        $tips=$('.global-tips'),
            $p=$tips.find('p');
        var params={
            url:'delete/property',
            type:'post',
            data:{
                'id':id
            },
            tokenFlag:true,
            sCallback:function(res) {
                if(res.code.toString().indexOf('2')==0){
                    $p.text('删除成功');
                    getProperty(propertyPageIndex);
                }else{
                    $p.text('操作失败');
                }
                $tips.show().delay(1500).hide(0);
            },
            eCallback:function(){
                $p.text('操作失败');
                $tips.show().delay(1500).hide(0);
            }
        };
        window.base.getData(params);
    });
    //点击了更新植物属性
    $(document).on('click','.updateProperty-btn',function(){
        var $this=$(this),
            //找到绑定在单元格上的id号
            $td=$this.closest('td'),
            $id=$td.attr('data-id'),
            //找到当前行
            $tr=$this.parents('tr');
        $('.createProperty').css({"display":"flex"});
        $('.bgGrey').css({"display":"block"});
        $('.createProperty .message:first').val($id);
        $('.createProperty .property_name').val($tr.children("td:nth-child(2)").text());
        $('.createProperty .property_detail').val($tr.children("td:nth-child(3)").text());
        $('.createProperty .product_id').val($tr.children("td:nth-child(4)").text());
    });
    // 新增植物属性
    //点击了新增
    $(document).on('click','.newProperty',function(){
        $('.createProperty').css({"display":"flex"});
        $('.bgGrey').css({"display":"block"});
    });
    //点击了取消
    $(document).on('click','.createProperty .cancel',function(){
        clearPropertyNew();
    });
    //点击了重置
    $(document).on('click','.createProperty .reset',function(){
        $('.createProperty .content .message').val('');
    });
    //点击了提交
    $(document).on('click','.createProperty .submit',function(){
        var obj = {
            "id":$('.createProperty .message:first-child').val(),
            "name":$('.createProperty .property_name').val(),
            "detail":$('.createProperty .property_detail').val(),
            "product_id":$('.createProperty .product_id').val()
        }
        clearPropertyNew();
        $tips=$('.global-tips'),
            $p=$tips.find('p');
        var params={
            url:'create/property',
            type:'post',
            data:obj,
            tokenFlag:true,
            sCallback:function(res) {
                if(res.code.toString().indexOf('2')==0){
                    $p.text('已经新增或更新一条记录');
                    getProperty(propertyPageIndex);
                }else{
                    $p.text('操作失败');
                }
                $tips.show().delay(1500).hide(0);
            },
            eCallback:function(){
                $p.text('操作失败');
                $tips.show().delay(1500).hide(0);
            }
        };
        window.base.getData(params);
    });
    //隐藏新增属性表单并清空
    function clearPropertyNew(){
        $('.createProperty').css({"display":"none"});
        $('.bgGrey').css({"display":"none"});
        $('.createProperty .content .message').val('');
    }


    /*删除植物价值*/
    $(document).on('click','.deleteWorth-btn',function(){
        var $this=$(this),
            $td=$this.closest('td'),
            id=$td.attr('data-id');
        $tips=$('.global-tips'),
            $p=$tips.find('p');
        var params={
            url:'delete/worth',
            type:'post',
            data:{
                'id':id
            },
            tokenFlag:true,
            sCallback:function(res) {
                if(res.code.toString().indexOf('2')==0){
                    $p.text('删除成功');
                    getWorth(worthPageIndex);
                }else{
                    $p.text('操作失败');
                }
                $tips.show().delay(1500).hide(0);
            },
            eCallback:function(){
                $p.text('操作失败');
                $tips.show().delay(1500).hide(0);
            }
        };
        window.base.getData(params);
    });
    //点击了更新植物价值
    $(document).on('click','.updateWorth-btn',function(){
        var $this=$(this),
            //找到绑定在单元格上的id号
            $td=$this.closest('td'),
            $id=$td.attr('data-id'),
            //找到当前行
            $tr=$this.parents('tr');
        $('.createWorth').css({"display":"flex"});
        $('.bgGrey').css({"display":"block"});
        $('.createWorth .message:first').val($id);
        $('.createWorth .worth_name').val($tr.children("td:nth-child(2)").text());
        $('.createWorth .worth_detail').val($tr.children("td:nth-child(3)").text());
        $('.createWorth .product_id').val($tr.children("td:nth-child(4)").text());
    });
    // 新增植物价值
    //点击了新增
    $(document).on('click','.newWorth',function(){
        $('.createWorth').css({"display":"flex"});
        $('.bgGrey').css({"display":"block"});
    });
    //点击了取消
    $(document).on('click','.createWorth .cancel',function(){
        clearWorthNew();
    });
    //点击了重置
    $(document).on('click','.createWorth .reset',function(){
        $('.createWorth .content .message').val('');
    });
    //点击了提交
    $(document).on('click','.createWorth .submit',function(){
        var obj = {
            "id":$('.createWorth .message:first-child').val(),
            "name":$('.createWorth .worth_name').val(),
            "detail":$('.createWorth .worth_detail').val(),
            "product_id":$('.createWorth .product_id').val()
        }
        clearWorthNew();
        $tips=$('.global-tips'),
            $p=$tips.find('p');
        var params={
            url:'create/worth',
            type:'post',
            data:obj,
            tokenFlag:true,
            sCallback:function(res) {
                if(res.code.toString().indexOf('2')==0){
                    $p.text('已经新增或更新一条记录');
                    getWorth(worthPageIndex);
                }else{
                    $p.text('操作失败');
                }
                $tips.show().delay(1500).hide(0);
            },
            eCallback:function(){
                $p.text('操作失败');
                $tips.show().delay(1500).hide(0);
            }
        };
        window.base.getData(params);
    });
    //隐藏新增价值表单并清空
    function clearWorthNew(){
        $('.createWorth').css({"display":"none"});
        $('.bgGrey').css({"display":"none"});
        $('.createWorth .content .message').val('');
    }


    /*退出*/
    $(document).on('click','#login-out',function(){
        window.base.deleteLocalStorage('token');
        window.location.href = 'login.html';
    });
});
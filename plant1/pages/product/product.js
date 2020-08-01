// var productObj = require('product-model.js');

import {
    Product
} from 'product-model.js';

var product = new Product(); //实例化 商品详情 对象

import {
    Cart
} from '../cart/cart-model.js';

var cart = new Cart(); //实例化 商品详情 对象
import { Integral } from '../../utils/integral.js';
var integral = new Integral();
Page({
    data: {
        currentTabsIndex: 0,
        countsArray: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        productCounts: 1,
        animationData: {}
    },
    onLoad: function(option) {
        var id = option.id;
        this.data.id = id;
        var collectSto = wx.getStorageSync('collect');
        if (collectSto) {
            var hasInfo = cart._isHasThatOne(id, collectSto);
            if (hasInfo.index != -1) {
                this.setData({
                    collect: hasInfo.data.collect
                })
            } else {
                this.setData({
                    collect: false
                })
            }
        } else {
            this.setData({
                collect: false
            })
        }
        this._loadData();
    },

    /*加载所有数据*/
    _loadData: function(callback) {
        var that = this;
        product.getDetailInfo(this.data.id, (res) => {
            // 取出植物的星星的第一个数
            var num = res.data.star.toString().substring(0, 1);

            //根据第一个数生成对应的数组
            var starArr = [];
            for (var j = 0; j < 5; j++) {
                if (j < num) {
                    starArr.push(1);
                } else {
                    starArr.push(0);
                }
            }

            var worthArr = [];
            var worthLength = res.data.detail_worth.length;
            for (var k = 0; k < worthLength; k++) {
                worthArr.push(res.data.detail_worth[k].detail);
            }
            that.setData({
                product: res.data,
                starArr: starArr,
                worthArr: worthArr,
                cartTotalCounts: cart.getCartTotalCounts().counts1,
            });
            callback && callback();
        });
    },

    //浏览大图
    viewPostImg: function(event) {
        var src = event.currentTarget.dataset.src;
        wx.previewImage({
            current: src,
            urls: [src]
        })
    },

    //设置收藏的缓存
    setCollection: function() {
        this.data.collect = !this.data.collect;
        this.setData({
            collect: this.data.collect
        })
        var obj = {},
            collectSto = wx.getStorageSync('collect');
        //如果缓存不存在
        if (!collectSto) {
            collectSto = [];
            obj.id = this.data.id;
            obj.collect = this.data.collect;
            collectSto.push(obj);
        } else {
            var hasInfo = cart._isHasThatOne(this.data.id, collectSto);
            if (hasInfo.index != -1) {
                hasInfo.data.collect = this.data.collect;
            } else {
                obj.id = this.data.id;
                obj.collect = this.data.collect;
                collectSto.push(obj);
            }
        }
        wx.setStorageSync('collect', collectSto);
    },

    //切换养殖技巧详情面板
    onTabsItemTap: function(event) {
        var index = product.getDataSet(event, 'index');
        this.setData({
            currentTabsIndex: index
        });
    },

    //拉起弹窗
    onViewDetail: function(event) {
        var index = product.getDataSet(event, 'index');
        this.setData({
            contentIndex: index
        });
        wx.showToast({
            title: this.data.worthArr[this.data.contentIndex],
            icon: 'none',
            duration: 3000
        })
    },

    //改变选择的数量
    bindPickerChange: function(e) {
        this.setData({
            productCounts: this.data.countsArray[e.detail.value],
        })
    },

    /*添加到购物车*/
    onAddingToCartTap: function(events) {
        /*定义动画*/
        var animation = wx.createAnimation({
            duration: 200
        })

        this.animation = animation;

        this.animation.scale(1.5, 1.5).step();
        this.animation.scale(1, 1).step();

        this.setData({
            animationData: animation.export()
        })
        var tempObj = {},
            keys = ['id', 'name', 'main_img_url', 'price'];
        for (var key in this.data.product) {
            if (keys.indexOf(key) >= 0) {
                tempObj[key] = this.data.product[key];
            }
        }

        cart.add(tempObj, this.data.productCounts);

        this.data.cartTotalCounts += this.data.productCounts;
        this.setData({
            cartTotalCounts: this.data.cartTotalCounts
        })
    },

    /*跳转到购物车*/
    onCartTap: function() {
        wx.navigateTo({
            url: '/pages/cart/cart'
        });
    },

    //开始积分计时器
    startSetInter: function() {
        var that = this;
        that.data.setInter = setInterval(
            function() {
                that.data.currentIntegral++;
                console.log(that.data.currentIntegral);
            }, 30000);
    },

    //清除计时器 即清除setInter
    endSetInter: function() {
        var that = this;
        clearInterval(that.data.setInter)
    },

    onShow: function() {
        //从缓存获取用户之前的积分，并且开始计时器
        this.data.basicIntegral = wx.getStorageSync('integral');
        this.data.currentIntegral = wx.getStorageSync('integral');
        this.startSetInter();

        //页面onShow 的时候，可能是从购物车来的，可能购物车的东西已经生成订单，从缓存中删除了，所以需要更新购物车的数量
        this.setData({
            cartTotalCounts: cart.getCartTotalCounts().counts1,
        })
    },

    onHide: function() {
        this.endSetInter();
        if (this.data.basicIntegral == this.data.currentIntegral) {
            console.log('分数还没增加，什么都不干，缓存不变');
        } else {
            integral.upDataSerAndSto(this.data.currentIntegral);
            console.log('分数已经改变，缓存也更新啦，数据库也更新啦');
        }

    },

    onUnload: function() {
        this.endSetInter();
        if (this.data.basicIntegral == this.data.currentIntegral) {
            console.log('分数还没增加，什么都不干，缓存不变');
        } else {
            integral.upDataSerAndSto(this.data.currentIntegral);
            console.log('分数已经改变，缓存也更新啦');
        }
    },

})
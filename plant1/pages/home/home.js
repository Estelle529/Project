// pages/home/home.js
import { Home } from "../home/home-model.js";
var home = new Home();
import { Integral } from '../../utils/integral.js';
var integral = new Integral;
Page({

    /**
     * 页面的初始数据
     */
    data: {

    },
    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(options) {
        this.data.currentIndex = 1;
        this._loadData();

        //获取用户积分并保存至缓存中
        integral.getUserIntegral();
    },

    _loadData: function() {
        /*获取轮播图信息*/
        var id = 1;
        var that = this;
        //加载第一个轮播图的信息
        home.getBannerData(id, (res) => {
            that.setData({
                "bannerArr": res.data.items
            });
        });

        /*获取专题信息*/
        home.getThemeData((res) => {
                that.setData({
                    "themeArr": res.data
                });
            }),

            /*获取热门植物信息*/
            home.getProductorData((res) => {
                var serverData = res.data;
                var productsArr = home.getStarNewData(serverData);
                that.setData({
                    productsArr: productsArr
                });
            }),

            /*获取最近植物文化*/
            home.getStoryData((res) => {
                that.setData({
                    recentStory: res.data
                });
            })

        /*分页获取误区信息*/
        home.getPageMis(this.data.currentIndex, (res) => {
            that.setData({
                pageMis: res.data.data
            });
        })
    },
    //轮播图进行跳转
    bannerItemTap: function(event) {
        var key = home.getDataSet(event, 'key');
        var type = home.getDataSet(event, 'type');
        if (type == 1) {
            wx.navigateTo({
                url: '../product/product?id=' + key
            })
        } else if (type == 2) {
            wx.navigateTo({
                url: '../theme/theme?id=' + key
            })
        } else {
            wx.navigateTo({
                url: '../flowerLanguage/flowerLanguage'
            })
        }
    },

    /*跳转到主题列表*/
    onThemesItemTap: function(event) {
        var id = home.getDataSet(event, 'id');
        var name = home.getDataSet(event, 'name');
        wx.navigateTo({
            url: '../theme/theme?id=' + id
        })
    },

    /*跳转到商品详情*/
    onProductsItemTap: function(event) {
        var id = home.getDataSet(event, 'id');
        wx.navigateTo({
            url: '../product/product?id=' + id
        })
    },

    /*跳转到植物文化详情*/
    onDetailStory: function(event) {
        var id = home.getDataSet(event, 'id');
        wx.navigateTo({
            url: '../story/story?id=' + id
        })
    },

    /*跳转到所有植物文化*/
    onAllStory: function(event) {
        wx.navigateTo({
            url: '../allStory/allStory'
        })
    },

    /*换一批误区，其实就是分页加载*/
    changeMis: function(event) {
        var that = this;
        /*定义动画*/
        var animation = wx.createAnimation({
            duration: 200
        })

        this.animation = animation;

        this.animation.rotate(180).step();
        this.animation.rotate(0).step();

        this.setData({
            animationData: animation.export()
        })
        that.data.currentIndex++;
        /*分页获取误区信息*/
        home.getPageMis(that.data.currentIndex, (res) => {
            if (res.data.data.length == 0) {
                that.data.currentIndex = 1;
                home.getPageMis(that.data.currentIndex, (res) => {
                    that.setData({
                        pageMis: res.data.data
                    });
                })
            }
            that.setData({
                pageMis: res.data.data
            });
        })
    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady: function() {

    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function() {

    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide: function() {

    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload: function() {

    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh: function() {

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function() {

    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage: function() {

    }
})
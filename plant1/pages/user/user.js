var app = getApp();
import { Order } from "../order/order-model.js"
var order = new Order();
import { Base } from "../../utils/base.js";
var base = new Base();
import { Address } from '../../utils/address.js';
var address = new Address();
Page({

    /**
     * 页面的初始数据
     */
    data: {
        pageIndex: 1,
        orders: [],
        finish: false
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(options) {
        this.setData({
            userInfo: app.globalData.userInfo
        })
        this._getOrders();
    },

    gotoCart: function() {
        wx.navigateTo({
            url: '/pages/cart/cart'
        });
    },
    gotoLike: function() {
        wx.navigateTo({
            url: '/pages/like/like'
        });
    },
    showExplain: function() {
        wx.showModal({
            title: '积分规则',
            content: '进入植物详情页面，每30秒加1，可根据植物价格进行兑换'
        })
    },
    orderTap: function(event) {
        var id = base.getDataSet(event, 'id');
        wx.navigateTo({
            url: '../order/order?id=' + id + '&from=myOrder'
        });
    },
    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function() {
        this.data.integral = wx.getStorageSync('integral')
        this.setData({
            integral: this.data.integral
        })
    },
    _getOrders: function() {
        var that = this;
        order.getBrieflyOrder(that.data.pageIndex, (res) => {
            if (res.data.data.length > 0) {
                res.data.data.forEach(order => {
                    that.data.orders.push(order);
                });
                that.setData({
                    orders: this.data.orders,
                    finish: this.data.finish
                })
            } else {
                that.data.finish = true;
                that.setData({
                    finish: that.data.finish
                })
            }
        })
    },
    onReachBottom: function() {
        if (!this.data.finish) {
            this.data.pageIndex++;
            this._getOrders();
        }
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
        this.data.pageIndex = 1;
        this.data.orders = [];
        this.data.finish = false;
        this._getOrders();
    },



    /**
     * 用户点击右上角分享
     */
    onShareAppMessage: function() {

    }
})
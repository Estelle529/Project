// pages/flowerLanguage/flowerLanguage.js
import { Language } from "../flowerLanguage/flowerLanguage-model.js";
var language = new Language();
Page({

    /**
     * 页面的初始数据
     */
    data: {
        currentIndex: 1
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(options) {
        var that = this;
        /*定义动画*/
        var right = wx.createAnimation({
            duration: 200
        })
        var down = wx.createAnimation({
            duration: 200
        })

        that.right = right;
        that.down = down;

        that.right.rotate(-90).step();
        that.down.rotate(0).step();

        that.setData({
            right: right.export(),
            down: down.export()
        })
        language.getLanguage("玫瑰", function(res) {
            that.setData({
                language1: res.data
            })
        });
    },
    changeFlower: function(event) {
        var index = language.getDataSet(event, 'index');
        var flower = language.getDataSet(event, 'flower');
        this.setData({
            currentIndex: index
        });
        //如果数据是第一次请求 向服务器发送请求 并绑定数据，如果不是（系统中已经有数据），则不用请求服务器，直接加载数据
        if (!this.isloadedData(index)) {
            var that = this;
            language.getLanguage(flower, (res) => {
                that.setData(that.getDataObjForBind(index, res));
            });
        }
    },

    //判断当前花语的数据是否已经被加载
    isloadedData: function(index) {
        if (this.data['language' + index]) {
            return true;
        }
        return false;
    },
    getDataObjForBind: function(index, res) {
        var obj = {};
        obj['language' + index] = res.data;
        return obj;
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
// pages/allStory/allStory.js
import { AllStory } from "../allStory/allStory-model.js"
var allStroy = new AllStory();
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
        this._loadData();
    },
    _loadData: function() {
        var that = this;
        allStroy.getAllStory((res) => {
            that.setData({
                allStory: res.data
            })
        })
    },

    /*跳转到植物文化详情*/
    onDetailStory: function(event) {
        var id = allStroy.getDataSet(event, 'id');
        wx.navigateTo({
            url: '../story/story?id=' + id
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
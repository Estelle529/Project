// pages/like/like.js
import { Like } from "../like/like-model.js"
var like = new Like();
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
        var collectSto = wx.getStorageSync('collect');
        var isHaveLike = 0;
        var idArr = [];
        if (collectSto) {
            if (collectSto.length > 0) {
                for (var i = 0; i < collectSto.length; i++) {
                    if (collectSto[i].collect == true) {
                        this.setData({
                            noLike: false
                        })
                        idArr.push(collectSto[i].id);
                        isHaveLike++;
                    }
                }
                if (isHaveLike == 0) {
                    that.setData({
                        noLike: true
                    })
                } else {
                    var ids = idArr.join(",");
                    like.getLikeData(ids, (res) => {
                        that.setData({
                            likePlants: res.data
                        })
                    });
                }
            }
        } else {
            that.setData({
                noLike: true
            })
        }
    },
    cancelLike: function(event) {
        var index = like.getDataSet(event, 'index');
        var id = like.getDataSet(event, 'id');
        //删除从服务器加载过来的数据，使前端页面发生改变
        this.data.likePlants.splice(index, 1);
        if (this.data.likePlants.length == 0) {
            this.setData({
                noLike: true
            })
        }
        this.setData({
                likePlants: this.data.likePlants
            })
            //更新缓存
        var collectSto = wx.getStorageSync('collect');
        collectSto.forEach(element => {
            if (element.id == id) {
                element.collect = false;
            }
        });
        wx.setStorageSync('collect', collectSto);
    },

    /*跳转到商品详情*/
    onProductTap: function(event) {
        var id = like.getDataSet(event, 'id');
        wx.navigateTo({
            url: '../product/product?id=' + id
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
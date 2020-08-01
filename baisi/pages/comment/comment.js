// pages/comment/comment.js
let baseUrl = getApp().globalData.baseUrl;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    id: null,
    currPage: 1,
    hot: [],
    com: []
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // 根据id请求评论的数据 并且动态设置页面头部内容
    this.setData({
      id: options.id
    })
    wx.setNavigationBarTitle({
      title: options.name + '的评论'
    })
    this.getComment();
  },
  getComment() {
    wx.request({
      url: baseUrl + '?a=dataList&c=comment&data_id=' + this.data.id + '&hot=1' + '&page=' + this.data.currPage,
      success: (res) => {
        if (res.data.data.length == 0) {
          wx.showToast({
            title: '已经没有更多数据',
            icon:"none"
          })
        } else {
          this.setData({
            hot: res.data.hot,
            com: this.data.com.concat(res.data.data)
          })
        }

      }
    })
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
    this.setData({
      currPage: this.data.currPage + 1
    })
    this.getComment();
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})
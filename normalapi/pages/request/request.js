// pages/request/request.js
// http://m.douyu.com/api/room/list?page=4
// 跨域是浏览器的限制  小程序里面没有浏览器
// 微信小程序里面没有跨域问题 开心写代码
Page({

  /**
   * 页面的初始数据
   */
  data: {
    page: 1,
    list: []
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getdata();
  },
  getdata() {
    wx.showLoading({
      title: '正在加载',
    })
    wx.request({
      url: 'http://m.douyu.com/api/room/list',
      data: {
        page: this.data.page
      },
      success: (res) => {
        this.setData({
          list: this.data.list.concat(res.data.data.list)
        })
        wx.hideLoading({
          success: (res) => {},
        })
      }
    })
  },
  getid(e){
    wx.navigateTo({
      url: '../roomdetail/roomdetail?id='+e.detail,
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
    this.setData({
      page: this.data.page + 1,
      list: []
    })
    wx.showLoading({
      title: '正在加载',
    })
    wx.request({
      url: 'http://m.douyu.com/api/room/list',
      data: {
        page: this.data.page
      },
      success: (res) => {
        this.setData({
          list: this.data.list.concat(res.data.data.list)
        })
        wx.hideLoading({
          success: (res) => {},
        })
        wx.stopPullDownRefresh()
      }
    })
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
    this.setData({
      page: this.data.page + 1
    })
    this.getdata();

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})
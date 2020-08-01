// pages/menu/menu.js
Page({

  /**
   * 页面的初始数据
   */
  data: {

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

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
  gotoDouyu(){
    wx.navigateTo({
      url: '../request/request'
    })
  },
  gotoAnimate(){
    wx.navigateTo({
      url: '../animate/animate'
    })
  },
  gotoCamera(){
    wx.navigateTo({
      url: '../camera/camera'
    })
  },
  gotoQrcode(){
    wx.navigateTo({
      url: '../qrcode/qrcode'
    })
  },
  gotoCanvas(){
    wx.navigateTo({
      url: '../canvas/canvas'
    })
  },
  gotoPage(){
    wx.navigateTo({
      url: '../index/index'
    })
  },
  gotoLocation(){
    wx.navigateTo({
      url: '../location/location'
    })
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

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})
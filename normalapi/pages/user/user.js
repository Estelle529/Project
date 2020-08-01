// pages/user/user.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    userInfo: {},
    electricity:0,
    light:0,
    pasteMessage:""
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    wx.getStorage({
      key: 'userInfo',
      success: (res)=>{
        this.setData({
          userInfo:res.data
        })
      },
    })
    // 获取电量
    wx.getBatteryInfo({
      success:(res)=>{
        this.setData({
          electricity:res.level
        })
      }
    })
    // 获取屏幕亮度
    wx.getScreenBrightness({
      success:(res)=>{
        this.setData({
          light:res.value
        })
      }
    })


  },
  login(res) {
    // 获取用户信息
    this.setData({
      userInfo: res.detail.userInfo
    })
    wx.setStorage({
      data: res.detail.userInfo,
      key: 'userInfo',
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

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})
// pages/user/user.js
let baseUrl = getApp().globalData.baseUrl;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    userInfo: {}, //用户信息
    islogin: false, //是否登录
    detail: false, //是否显示详细内容
    show: null, //show动画
    hide: null //hide动画
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var showAni = wx.createAnimation();
    showAni.top('181rpx').step();
    var hideAni = wx.createAnimation();
    hideAni.top('-300rpx').step();
    this.setData({
      show: showAni.export(),
      hide: hideAni.export()
    })
  },
  getInfo(res) {
    // 有登录信息  说明用户授权了
    if (res.detail.userInfo) {
      var userInfo = res.detail.userInfo;
      // 调用wx.login接口 获取code码
      wx.login({
        success: (res) => {
          if (res.code) {
            wx.request({
              method: 'POST',
              url: baseUrl,
              data: {
                a: "login",
                code: "res.code",
                name: userInfo.nickName
              },
              success: (res) => {
                if (res.data.code == 1) {
                  // 登陆成功
                  // 将拿到的openid以及session_key加入userInfo存储缓存
                  userInfo.openid = res.data.openid;
                  userInfo.session_key = res.data.session_key;
                  wx.setStorage({
                    data: userInfo,
                    key: 'user',
                  })
                  this.setData({
                    islogin: true,
                    userInfo: userInfo
                  });
                  wx.showToast({
                    title: '登陆成功',
                    icon: 'success'
                  })
                }
              }
            })
          } else {
            wx.showToast({
              title: '登陆失败，稍等重试',
              icon: 'none'
            })
          }
        }
      })
    } else {
      // 没有信息说明没有授权  登陆失败
      wx.showModal({
        title: '登陆结果',
        content: "登陆失败，因为没有授权"
      })
    }

  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },
  getDetail() {
    this.setData({
      detail: !this.data.detail
    })
  },
  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    wx.getStorage({
      key: 'user',
      success: (res) => {
        this.setData({
          islogin: true,
          userInfo: res.data
        })
      },
      fail: (res) => {
        this.setData({
          islogin: false
        })
      }
    })
  },
  // 前往空间页面
  gotoSpace() {
    wx.navigateTo({
      url: '../space/space'
    })
  },
  // 前往历史记录页面
  gotoHistory() {
    wx.navigateTo({
      url: '../history/history'
    })
  },
  // 前往关注页面
  gotoFocus() {
    wx.switchTab({
      url: '../like/like',
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
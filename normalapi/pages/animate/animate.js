// pages/animate/animate.js
var toRight;
var toLeft;
var rotate;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    myAnimate: null,
    left: null,
    right: null,
    rot: null,
    flag: false
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
  setAnimate() {

    var animate = wx.createAnimation()

    //  一个step表示一步，如果有多个step  就一步一步执行
    // animate.scale(1.5,1.5).step()
    // animate.backgroundColor("red").step();
    //  一个step表示一步，如果只有一个step  就一块执行
    animate.translateX("60px").backgroundColor("red").step();


    this.setData({
      myAnimate: animate.export()
    })
  },
  changeAnimate() {
    toRight = wx.createAnimation()
    toLeft = wx.createAnimation()
    rotate = wx.createAnimation()
    rotate.rotate(180).step().rotate(0).step();
    toRight.left("505rpx").step();
    toLeft.left("30rpx").step();
    this.setData({
      flag: !this.data.flag,
      left: toLeft.export(),
      right: toRight.export(),
      rot: rotate.export()
    })
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
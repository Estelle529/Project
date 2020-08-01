// pages/space/space.js
var baseUrl = getApp().globalData.baseUrl;
// 创建唯一的audio音频 子组件传递过来路径之后 播放音乐 一次只能播放一个
let audio = wx.createInnerAudioContext();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // 热门空间动态数据
    hotList: [],
    // 关注的空间动态数据
    focusList: [],
    curr: "focus",
    openid: "",
    showImg: false, //音乐按钮是否显示
    isPlay: false //音乐是否播放
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    wx.getStorage({
      key: 'user',
      success: (res) => {
        this.setData({
          openid: res.data.openid
        })
        // 关注
        wx.request({
          url: baseUrl + "?a=square&c=newslist&open&openid=" + res.data.openid,
          success: (res) => {
            this.setData({
              focusList: res.data.data
            })
          }
        })
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
  // 关注动态
  goFocus() {
    this.setData({
      curr: 'focus'
    })
  },
  // 热门动态
  goHot() {
    this.setData({
      curr: 'hot'
    })
    if (this.data.hotList.length == 0) {
      // 热门
      wx.request({
        url: baseUrl + "?a=square&c=hot&open&openid=" + this.data.openid,
        success: (res) => {
          this.setData({
            hotList: res.data.data
          })
        }
      })
    } else {
      console.log("已经有数据了")
    }
  },
  // 接收子组件中传递过来的数id以及作者的名称直接传递到评论页面  展示评论
  getId(res) {
    wx.navigateTo({
      url: '../comment/comment?id=' + res.detail.id + "&name=" + res.detail.name,
    })
  },
  // 接收子组件中音乐传递过来的数据
  getAudio(res) {
    audio.src = res.detail;
    audio.play();
    this.setData({
      showImg: true,
      isPlay: true
    })
  },
  // 点击按钮改变音乐的播放状态
  changePlay() {
    if (this.data.isPlay) {
      audio.pause()
    } else {
      audio.play()
    }
    this.setData({
      isPlay: !this.data.isPlay
    })
  },
  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload(){
    //返回的时候 页面会卸载而不是隐藏
    //暂停播放
    audio.pause();
    this.setData({
      isPlay: false
    })
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
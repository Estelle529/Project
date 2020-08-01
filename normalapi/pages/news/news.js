// pages/news/news.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    start: "", //选择日期的范围开始  XXXX-XX-XX
    end: "", //选择日期的范围结束  XXXX-XX-XX
    date: "今天", //展示给用户看的日期
    topList: [], //轮播数据
    newList: [] //下面数据
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // 获取当前时间
    var date = new Date();
    // 获取当天的日期作为日期范围的结束
    var todaYy = date.getFullYear();
    var todaYm = date.getMonth() + 1 >= 10 ? date.getMonth() + 1 : "0" + (date.getMonth() + 1);
    var todaYd = date.getDate();
    this.setData({
      end: todaYy + '-' + todaYm + '-' + todaYd
    })

    // 获取两周前的时间作为日期范围的开始
    date.setDate(date.getDate() - 14);
    var agOy = date.getFullYear();
    var agOm = date.getMonth() + 1 >= 10 ? date.getMonth() + 1 : "0" + (date.getMonth() + 1);
    var agOd = date.getDate();
    this.setData({
      start: agOy + '-' + agOm + '-' + agOd
    })


    wx.showLoading({
      title: '正在加载',
    })
    wx.request({
      url: 'https://news-at.zhihu.com/api/4/news/latest',
      success: (res) => {
        this.setData({
          topList: res.data.top_stories,
          newList: res.data.stories
        })
        wx.hideLoading();
      }
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },
  // 获取子组件的数据并进行跳转
  getUrl(e) {
    wx.navigateTo({
      url: '../newdetail/newdetail?id=' + e.detail,
    })
  },
  // banner进行跳转
  godetail(e) {
    var arr = e.currentTarget.dataset.url.split("/");
    wx.navigateTo({
      url: '../newdetail/newdetail?id=' + arr[arr.length - 1],
    })
  },
  // 改变日期
  changeData(e) {
    console.log(e.detail.value) //XXXX-XX-XX
    // 选择日期之后修改显示的date  并进行判断  如果是今天那么直接返回
    if (e.detail.value == this.data.end) {
      wx.showToast({
        title: '你选择了今天',
        icon: "none"
      })
      this.setData({
        date: "今天"
      })
      wx.request({
        url: 'https://news-at.zhihu.com/api/4/news/latest',
        success: (res) => {
          this.setData({
            topList: res.data.top_stories,
            newList: res.data.stories
          })
        }
      })
    } else {
      var arr = e.detail.value.split("-");
      // 设置用户看到的日期
      this.setData({
        date: arr[0] + "年" + arr[1] + "月" + arr[2] + "日"
      })

      // 请求对应那天的数据
      wx.showLoading({
        title: "正在加载"
      })
      wx.request({
        url: 'https://news-at.zhihu.com/api/4/news/before/' + arr.join(""),
        success: (res) => {
          this.setData({
            newList: res.data.stories
          })
          wx.hideLoading();
        }
      })
    }

  },
  // 改变新闻模式
  changeType() {
    wx.navigateTo({
      url: '../newsrefresh/newsrefresh',
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
// pages/newsrefresh/newsrefresh.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // 每一天的总数据
    daysarr: [],
    // 获取之前日期的变量
    beforeCount: 1
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // 加载今天的数据
    wx.showLoading({
      title: '正在加载',
    })
    wx.request({
      url: 'https://news-at.zhihu.com/api/4/news/latest',
      success: (res) => {
        res.data.date = "今天";
        this.setData({
          daysarr: [...this.data.daysarr, res.data]
        })
        wx.hideLoading();
        console.log(this.data.daysarr)
      }
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {},
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
  // 处理日期的函数   输入20201122   输出2020年11月22日 星期几
  weekDay(date) {
    var dt = new Date(date.slice(0, 4), date.slice(4, 6), date.slice(6, 8));
    var weekDay = ["星期四", "星期五", "星期六", "星期天", "星期一", "星期二", "星期三"];
    return date.slice(0, 4) + "年" + date.slice(4, 6) + "月" + date.slice(6, 8) + "日" + weekDay[dt.getDay()];
  },

  // 获取之前如期的函数  输入-1, -2  输出20201121
  getDateBefore(AddDayCount) {
    var dd = new Date();
    dd.setDate(dd.getDate() + AddDayCount); //获取AddDayCount天后的日期
    var y = dd.getFullYear();
    var m = dd.getMonth() + 1; //获取当前月份的日期
    var d = dd.getDate();
    return y + (m < 10 ? '0' + m : m) + d;
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
      beforeCount: this.data.beforeCount - 1
    })
    // 加载前n天的数据
    wx.showLoading({
      title: '正在加载',
    })
    wx.request({
      url: 'https://news-at.zhihu.com/api/4/news/before/' + this.getDateBefore(this.data.beforeCount),
      success: (res) => {
        // 将20200202转换成2020年02月02日 星期几 在赋值回去
        // 在显示的时候就可以显示2020年02月02日 星期几
        res.data.date = this.weekDay(res.data.date);
        this.setData({
          daysarr: [...this.data.daysarr, res.data]
        })
        wx.hideLoading();
        console.log(this.data.daysarr)
      }
    })
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})
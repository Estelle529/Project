// pages/home/home.js
// 获取app实例可以获取baseUrl用来请求数据
let app = getApp();
// 引入获取自定义的属性的方法，方便开发
let baseUrl = app.globalData.baseUrl;
// 创建唯一的audio音频 子组件传递过来路径之后 播放音乐 一次只能播放一个
let audio = wx.createInnerAudioContext();
import {
  getdataset
} from '../../utils/util'
Page({

  /**
   * 页面的初始数据
   */
  data: {
    activenav: 0, // 页面的索引
    catArr: [1, 41, 10, 29, 31], // 所有的分类
    pageArr: [1, 1, 1, 1, 1], // 所有的分类当前的页码
    data0: [], // 第一页的数据
    data1: [], // 第二页的数据
    data2: [], // 第三页的数据
    data3: [], // 第四页的数据
    data4: [], // 第五页的数据
    showImg: false, //音乐按钮是否显示
    isPlay: false //音乐是否播放
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // 默认请求第0页的数据
    this.checkData(0);
  },
  // 点击切换内容区域
  gotoSwiper(e) {
    this.setData({
      activenav: getdataset(e, "index")
    })
  },
  // 监听内容区域的改变
  changePage(res) {
    this.setData({
      activenav: res.detail.current
    })
    this.checkData(res.detail.current)
  },
  // 判断对应的页面是否有数据，没有就加载 有就什么也不干
  checkData(index) {
    // 没有数据就根据对应的分类加载数据
    if (this.data["data" + index].length == 0) {
      wx.showLoading({
        title: '正在加载',
      })
      wx.request({
        url: baseUrl + '?a=list&c=data&type=' + this.data.catArr[index] + '&page=' + this.data.pageArr[index],
        success: (res) => {
          // 动态设置data+index的值比如
          // this.setData({
          //   'data'+index:res.data.list
          // })
          // 会报错
          // 所以换一种方式
          var obj = {};
          obj['data' + index] = this.data['data' + index].concat(res.data.list);
          this.setData(obj);
          wx.hideLoading();
          console.log(obj)
        }
      })
    } else {
      return;
    }
  },
  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },
  // scrollView滚动到底部时出发
  scrollBottom() {
    //根据当前页面的索引找到当前页面的页码
    // 将当前页面的页码加一，不影响其他页面的数据
    var arr = this.data.pageArr;
    arr[this.data.activenav]++;
    this.setData({
      pageArr: arr
    })
    wx.showLoading({
      title: '正在加载',
    })
    wx.request({
      url: baseUrl + '?a=list&c=data&type=' + this.data.catArr[this.data.activenav] + '&page=' + this.data.pageArr[this.data.activenav],
      success: (res) => {
        // 动态设置data+index的值比如
        // this.setData({
        //   'data'+index:res.data.list
        // })
        // 会报错
        // 所以换一种方式
        var obj = {};
        obj['data' + this.data.activenav] = this.data['data' + this.data.activenav].concat(res.data.list);
        this.setData(obj);
        wx.hideLoading();
        console.log(obj)
      }
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
  // 接收子组件中传递过来的数id以及作者的名称直接传递到评论页面  展示评论
  getId(res) {
    wx.navigateTo({
      url: '../comment/comment?id=' + res.detail.id + "&name=" + res.detail.name,
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
  onShow() {
    this.setData({
      activenav: this.data.activenav
    })
  },
  onHide(){
    // 页面隐藏  暂停播放
    audio.pause();
    this.setData({
      isPlay:false
    })
  },
  onShareAppMessage() {

  }
})
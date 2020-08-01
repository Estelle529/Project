// pages/suggest/suggest.js
let baseUrl = getApp().globalData.baseUrl;
// 引入获取自定义的工具方法 用于获取自定义属性
import {
  getdataset
} from '../../utils/util.js';
Page({

  /**
   * 页面的初始数据
   */
  data: {
    allcat: [],
    // up主list  可能哔哩哔哩看多了
    upList: [],
    // 处理之后的列表
    resList: [],
    // 当前页面
    currentPage: 1,
    // 当前分类索引
    currentIndex: 0,
    // 用户是否登录
    isLogin: false
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {

  },

  // 页面显示
  onShow() {
    // 在页面显示的时候进行判断是否登录
    // 如果已经登陆  那么需要进行是否关注的判断
    // 如果没有登陆  那么提醒登录 并且不在进行判断 全部都是没有关注\
    this.setData({
      upList: [],
      resList: [],
      currentPage: 1
    })
    this.baseMethord();
  },
  // 请求原来的数据列表
  baseMethord() {
    // 请求左边的分类数据
    wx.showLoading({
      title: '正在加载',
    })
    //左边分类
    wx.request({
      url: baseUrl + '?a=category&c=subscribe',
      success: (res) => {
        this.setData({
          allcat: res.data.list
        })
        var index = this.data.currentIndex;
        // 右边数据
        wx.request({
          url: baseUrl + '?a=list&c=subscribe&category_id=' + this.data.allcat[index].id + "&page=" + this.data.currentPage,
          success: (res) => {
            wx.hideLoading();
            if (res.data.list.length > 0) {
              this.setData({
                upList: this.data.upList.concat(res.data.list)
              })
              this.checkIsFocus();
            } else {
              wx.showToast({
                title: '没有更多数据',
                icon: "none"
              })
            }
          }
        })
      }
    })
  },
  // 检查是否关注
  checkIsFocus() {
    // 已经加载过的upList  默认列表
    var defaultList = this.data.upList;
    let focusidList = [];
    // 判断是否已经登陆 如果已经登陆 那么进行判断 是否已经关注
    // 没有登陆 就不用判断直接显示   都没有关注
    wx.getStorage({
      key: 'user',
      success: (res) => {
        this.setData({
          isLogin: true
        })
        // 已经关注的列表
        wx.request({
          url: baseUrl + '?a=square&c=userlist&openid=' + res.data.openid,
          success: (res) => {
            if (res.data.data) {
              // 获取所有的关注id
              for (var i = 0; i < res.data.data.length; i++) {
                focusidList.push(res.data.data[i].uid);
              }
              // 检查每一个默认的列表是否已经关注  并添加自定义属性
              for (var j = 0; j < defaultList.length; j++) {
                if (focusidList.indexOf(defaultList[j].uid) != -1) {
                  // 说明默认列表的id在关注的id中存在 说明已经关注
                  // 添加自定义属性
                  defaultList[j].focus = true;
                } else {
                  defaultList[j].focus = false;
                }
              }
              this.setData({
                resList: defaultList
              })
            } else {
              this.setData({
                resList: defaultList
              })
            }
          }
        })

      },
      fail: (res) => {
        this.setData({
          isLogin: false
        })
        // 温馨提示
        wx.showModal({
          title: '温馨提示',
          content: "请先登录登陆，登录之后，展示个人关注",
          success: (res) => {
            if (res.confirm) {
              wx.switchTab({
                url: '../like/like',
              })
            }
          }
        })
      }
    })
  },

  // 改变分类
  changeCat(e) {
    this.setData({
      currentIndex: getdataset(e, 'index'),
      currentPage: 1,
      upList: [],
      resList: []
    })
    this.baseMethord();
  },
  // 触底加载
  getBottom() {
    this.setData({
      currentPage: this.data.currentPage + 1
    })
    this.baseMethord();
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})
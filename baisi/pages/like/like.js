// pages/like/like.js
let baseUrl = getApp().globalData.baseUrl;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    islogin: null,
    focusList: [],
    specialSuggest: []
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
    this.setData({
      specialSuggest:[]
    })
    wx.getStorage({
      key: 'user',
      success: (res) => {
        // 如果获取成功说明已经登陆
        this.setData({
          islogin: true
        })
        // openid
        var openid = res.data.openid;
        // 加载关注列表
        this.getFocusList(openid);
      },
      fail: (res) => {
        // 因为在登录的时候 会进行缓存
        // 如果获取失败说明没有缓存  说明没有登录
        this.setData({
          islogin: false
        })
      }
    })
  },
  // 登录
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
                    islogin: true
                  });
                  wx.showToast({
                    title: '登陆成功',
                    icon: 'success'
                  })
                  // 加载关注列表
                  this.getFocusList(res.data.openid);
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
  // 获取用户的关注列表
  getFocusList(openid) {
    wx.request({
      url: baseUrl + '?a=square&c=userlist&openid=' + openid,
      success: (res) => {
        if (res.data.data) {
          this.setData({
            focusList: res.data.data
          })
        }
        // 加载推荐关注的列表
        wx.request({
          url: baseUrl + '?a=recommend&c=attent',
          success: (res) => {
            // 同样判断是否已经关注
            // 关注的id列表
            var focusidList = [];
            // 推荐的关注列表
            var defaultList = res.data.data
            if (this.data.focusList.length == 0) {
              this.setData({
                specialSuggest: defaultList
              })
            } else {
              // 获取所有的关注id
              for (var i = 0; i < this.data.focusList.length; i++) {
                focusidList.push(this.data.focusList[i].uid);
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
                specialSuggest: defaultList
              })
            }
          }
        })
      }
    })
  },

  // 取消关注
  realyCancel(e) {
    var id = e.detail;
    wx.getStorage({
      key: 'user',
      success: (res) => {
        var openid = res.data.openid;
        // 根据id 取消关注
        wx.request({
          url: baseUrl,
          method: "POST",
          data: {
            a: "cancleAtt",
            uid: id,
            openid: openid
          },
          success: (res) => {
            if (res.data.code == 1) {
              wx.showToast({
                title: '取消关注成功'
              })
              // 取消关注成功之后  把对应的页面数据删掉
              for (var i = 0; i < this.data.focusList.length; i++) {
                if (this.data.focusList[i].uid == id) {
                  this.data.focusList.splice(i, 1);
                  this.setData({
                    focusList: this.data.focusList
                  })
                }
              }
            }
          }
        })
      }
    })
  },
  // 重新加载
  refresh() {
    this.onShow();
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
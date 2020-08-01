// component/oneUp/oneUp.js
let baseUrl = getApp().globalData.baseUrl;
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    oneUpdata: {
      type: Object,
      value: {}
    }
  },

  /**
   * 组件的初始数据
   */
  data: {
    isfocus: false
  },
  lifetimes: {
    attached: function() {
      // 在组件实例进入页面节点树时执行
      this.setData({
        isfocus:this.data.oneUpdata.focus
      })
    },
  },
  /**
   * 组件的方法列表
   */
  methods: {
    // 点击关注
    // 首先判断是否登录
    // 因为登录的时候必然会存储缓存
    // 所以我们先读取缓存 看有没有  如果失败  说明没有相关缓存 没有登陆  那先跳转到登陆页面进行登录
    changeFocus() {
      wx.getStorage({
        key: 'user',
        success: (res) => {
          // 如果获取成功说明已经登陆
          // 进行请求关注
          // 如果已经关注 那就取消关注
          // 如果没有关注就关注
          if (this.data.isfocus) {
            // 取消关注
            wx.request({
              url: baseUrl,
              method: "POST",
              data: {
                a: "cancleAtt",
                uid: this.data.oneUpdata.uid,
                openid: res.data.openid
              },
              success: (res) => {
                if (res.data.code == 1) {
                  this.setData({
                    isfocus:false
                  })
                  wx.showToast({
                    title: '取消成功'
                  })
                }
              }
            })
          } else {
            // 进行关注
            wx.request({
              url: baseUrl,
              method: "POST",
              data: {
                a: "attention",
                uid: this.data.oneUpdata.uid,
                openid: res.data.openid
              },
              success: (res) => {
                if (res.data.code == 1) {
                  this.setData({
                    isfocus:true
                  })
                  wx.showToast({
                    title: '关注成功'
                  })
                }
              }
            })
          }
        },
        fail: (res) => {
          // 因为在登录的时候 会进行缓存
          // 如果获取失败说明没有缓存  说明没有登录
          wx.showModal({
            title: '温馨提示',
            content: '您还没有登陆，是否进行登录',
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
    }
  }
})
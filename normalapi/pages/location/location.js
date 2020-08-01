// pages/location/location.js
// 地图上下文对象
let myMap;
// 引入SDK核心类
var QQMapWX = require('../../utils/qqmap-wx-jssdk.js');
var qqmapsdk;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    scale: 16,
    latitude: "",
    longitude: "",
    markers: [],
    scaleArr: ["1000km", "500km", "200km", "100km", "50km", "50km", "20km", "10km", "5km", "2km", "1km", "500m", "200m", "100m", "50m", "50m", "20m", "10m"],
    scaleRes: "100m",
    traffic: false,
    isfocus: false,
    inputkey: "输入关键字"
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

    // 实例化API核心类
    qqmapsdk = new QQMapWX({
      key: 'FPZBZ-OX2K6-C3TSL-EI4AM-77UK2-INF7O'
    });

    // 提前向用户发起授权请求  用户已经同意 下次不再有弹窗 如果没同意  每次都有弹窗
    wx.authorize({
      scope: 'scope.userLocation',
      success: () => {
        // 进行定位
        wx.getLocation({
          type: "gcj02",
          success: (res) => {
            // 设置经纬度
            this.setData({
              latitude: res.latitude,
              longitude: res.longitude
            })
            // // 展示内置地图
            // wx.openLocation({
            //   latitude: this.data.latitude,
            //   longitude: this.data.longitude,
            //   name: "我的位置",
            // })
          }
        })
      }
    })

    // 用户手动打开权限
    // wx.openSetting({
    //   withSubscriptions: true,
    // })

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    // 创建地图的上下文对象
    myMap = wx.createMapContext("myMap");
  },
  // 回到当前位置
  gotoCurrent() {
    this.setData({
      scale: 16,
      scaleRes: "100m"
    })
    myMap.moveToLocation({
      longitude: this.data.longitude,
      latitude: this.data.latitude,
    })
  },
  // 加减尺度
  changeScale(e) {
    if (e.currentTarget.dataset.type == "add") {
      this.setData({
        scale: this.data.scale + 1 >= 20 ? 20 : this.data.scale + 1,
        scaleRes: this.data.scale + 1 >= 20 ? this.data.scaleArr[17] : this.data.scaleArr[this.data.scale + 1 - 3]
      })
    } else {
      this.setData({
        scale: this.data.scale - 1 <= 3 ? 3 : this.data.scale - 1,
        scaleRes: this.data.scale - 1 <= 3 ? this.data.scaleArr[0] : this.data.scaleArr[this.data.scale - 1 - 3]
      })
    }
  },
  // 用户缩放
  userchnage(res) {
    if (res.type == "end") {
      myMap.getScale().then(res => {
        // 平移的话 scale不变  不用重新赋值  当不一样 说明改变了  重新赋值
        // 在模拟器上只能放到18 手机上正常
        if (this.data.scale != res.scale) {
          this.setData({
            // 取整赋值
            scale: Math.round(res.scale),
            scaleRes: this.data.scaleArr[Math.round(res.scale) - 3]
          })
        }

      })
    }
  },
  // 实时路况
  changeDesc() {
    this.setData({
      traffic: !this.data.traffic
    })
  },
  // 输入框获取焦点
  inputFocus() {
    this.setData({
      isfocus: true
    })
  },
  // 正在输入
  inputing(e) {
    this.setData({
      inputkey: e.detail.value
    })
  },
  //进行搜索
  gosearch() {
    if (this.data.inputkey == '输入关键字' || this.data.inputkey.length == 0) {
      wx.showToast({
        title: '请输入有效信息',
        icon: "none"
      })
      return;
    } else {
      // 调用接口
      qqmapsdk.search({
        keyword: this.data.inputkey,
        success: (res) => {
          console.log(res);
          var arr = res.data.map((item, index) => {
            return {
              id: index,
              latitude: item.location.lat,
              longitude: item.location.lng,
              width: 50,
              height: 50,
              callout: {
                content: item.address,
                color: "red"
              },
              label:{
                content: item.title,
                color: "red"
              }
            }
          })
          console.log(arr)
          this.setData({
            markers: arr
          })
        },
        fail: function (res) {
          console.log(res);
        },
        complete: function (res) {
          // console.log(res);
        }
      })
    }
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
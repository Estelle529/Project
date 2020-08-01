// pages/camera/camera.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // 相机显示
    isshowcamera: false,
    // 展示的图片
    imgUrl: "",
    // 是否展示图片
    showImg: false,
    // 相机方向
    direction: "back"
  },
  // 点击上传头像
  submit: function() {
    wx.showActionSheet({
      itemList: ["本地相册", "打开相机"],
      // 保留this指向
      success: (res) => {
        // 点击本地相册
        if (res.tapIndex == 0) {
          this.openLocalImg();
          // 拍照
        } else {
          this.useCamera();
        }
      }
    })
  },
  // 相册
  openLocalImg() {
    // 选择图片
    wx.chooseImage({
      count: 1,
      success: (res) => {
        // 进行展示
        this.setData({
          imgUrl: res.tempFilePaths[0],
          showImg: true
        })
      },
    })
  },
  // 打开相机
  useCamera() {
    this.setData({
      isshowcamera: true
    })
  },
  // 拍照片
  getImg() {
    // 创建相机上下文对象
    let context = wx.createCameraContext(this);
    context.takePhoto({
      quality: "low",
      // 进行展示
      success: (res) => {
        this.setData({
          imgUrl: res.tempImagePath,
          showImg: true,
          isshowcamera: false
        })
      }
    })
  },
  // 改变相机方向
  changeDirection() {
    this.setData({
      direction: this.data.direction == "back" ? "front" : "back"
    })
  },
  // 长按保存图片
  saveImg() {
    if (!this.data.imgUrl) {
      return;
    }
    wx.showActionSheet({
      itemList: ["保存到本地", "删除"],
      // 保留this指向
      success: (res) => {
        // 保存到本地
        if (res.tapIndex == 0) {
          // 保存
          wx.saveImageToPhotosAlbum({
            filePath: this.data.imgUrl,
            // 保存成功
            success: () => {
              wx.showToast({
                title: "保存成功"
              })
            }
          })
          // 删除
        } else {
          this.setData({
            imgUrl: "",
            showImg: false
          })
        }
      }
    })
  },

  // 生物认证
  soter() {
    wx.startSoterAuthentication({
      requestAuthModes: ["fingerPrint", "facial"],
      challenge:"qwertyuiop",
      authContent:"请进行指纹识别",
      success:(res)=>{
        console.log(res);
        // 指纹认证成功跳转到相册页
        wx.navigateTo({
          url: '../album/album'
        })
      }
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function() {

  }
})
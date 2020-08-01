// pages/qrcode/qrcode.js
// 生成二维码的插件
import QRCode from "../../utils/weapp-qrcode.js";
var qrcode;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    //自己填写的二维码信息
    message: "",
    // 二维码生成之后自动返回的图片地址
    imgUrl:""
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    qrcode = new QRCode('myCanvas', {
      // usingIn: this,
      text: "",
      width: 256,
      height: 256,
      padding: 10,
      colorDark: "#1CA4FC",
      colorLight: "white",
      correctLevel: QRCode.CorrectLevel.H,
      // 二维码生成之后 会自动调用这个函数
      callback:(res)=>{
        this.setData({
          imgUrl:res.path
        })
      }
    });
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },
  // 输入信息
  setMessage(e) {
    this.setData({
      message: e.detail.value
    })
  },
  // 生成二维码
  getQrcode() {
    qrcode.makeCode(this.data.message)
  },
  // 保存图片
  saveImg() {
    wx.showActionSheet({
      itemList: ['保存图片'],
      success: (res)=>{
        if (res.tapIndex == 0) {
          //因为前面在生成二维码时，已经自动将图片地址 保存下来了  这里就可以直接拿到
          console.log(this.data.imgUrl)
          // 进行保存
          wx.saveImageToPhotosAlbum({
            filePath: this.data.imgUrl,
            // 保存成功
            success: () => {
              wx.showToast({
                title: "保存成功"
              })
            }
          })
        }
      }
    })
  },
  // 扫描二维码
  scanQrcode(){
      wx.scanCode({
        success:res=>{
          wx.showModal({
            title:"扫描结果",
            content:res.result
          })
        }
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
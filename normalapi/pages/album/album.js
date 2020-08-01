// pages/album/album.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    imgList: [],
    // 当前预览的图片
    currIndex:0,
    // 是否显示大图预览
    isbig:false
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
    // 尝试读取之前的缓存
    wx.getStorage({
      key: 'list',
      success: (res)=>{
        this.setData({
          imgList:res.data
        })
      },
    })
  },
// 上传图片
  subImg() {
    wx.chooseImage({
      success: (res) => {
        var arr = this.data.imgList.concat(res.tempFilePaths);
        // 存入页面数据
        this.setData({
          imgList: arr
        })
        // 并且存入缓存
        wx.setStorage({
          key: 'list',
          data: arr
        })
      },
    })
  },
// 显示大图
  showBig(e){
    this.setData({
      isbig:true,
      // 图片的自定义属性 也就是图片的索引  用来找到大图的路径
      currIndex:e.target.dataset.index
    })
  },
  // 上一张图片
  preImg(){
    var index = this.data.currIndex - 1;
    if(index < 0){
      wx.showToast({
        title: '已经是第一张了',
        icon:"none"
      })
      index = 0;
    }
    this.setData({
      currIndex: index
    })
  },
  // 删除图片
  delImg(){
    // 根据当前图片的索引 删除缓存以及页面数据中的图片
    var arr = this.data.imgList;
    arr.splice(this.data.currIndex, 1);
    // 如果删完了  就把索引重置为默认值  并且关掉大图  并且提示删除完了
    if(arr.length == 0){
      wx.showToast({
        title: '已经删完了',
        icon:"none"
      })
      this.closeBig();
      this.setData({
        currIndex:0
      })
    }
    // 更新页面数据
    this.setData({
      imgList:arr,
      currIndex: this.data.currIndex - 1 >= 0 ? this.data.currIndex - 1 : 0
    })
    // 更新缓存数据
    wx.setStorage({
      key: 'list',
      data: arr
    })
  },
  // 下一张图片
  nextImg(){
    var index = this.data.currIndex + 1;
    if (index > this.data.imgList.length -1) {
      wx.showToast({
        title: '已经是最后一张了',
        icon: "none"
      })
      index = this.data.imgList.length - 1;
    }
    this.setData({
      currIndex: index
    })
  },
  // 关闭大图预览
  closeBig(){
    this.setData({
      isbig:false
    })
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
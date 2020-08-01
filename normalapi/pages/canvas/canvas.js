// pages/canvas/canvas.js
let canvas;
let ctx;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    one: 30,
    two: 60,
    three: 100,
    count:3
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
    // 创建方法 用于在wxml中查找元素
    const query = wx.createSelectorQuery()
    query.select('#myCanvas').fields({
      node: true,
      size: true
    }).exec((res) => {
      canvas = res[0].node
      // 获得的最终画布的绘制对象
      ctx = canvas.getContext('2d')
    })
  },


  // 画折线段
  drawLine() {
    ctx.clearRect(0, 0, 350, 200);
    ctx.beginPath();
    ctx.strokeStyle = "rgb(0,255,0)"
    ctx.lineWidth = 2;
    ctx.moveTo(20, 20);
    ctx.lineTo(300, 90);
    ctx.lineTo(80, 80);
    ctx.stroke();
  },
  // 画圆形
  drawcircular() {
    ctx.clearRect(0, 0, 350, 200);
    ctx.beginPath();
    ctx.arc(50, 50, 50, 0, 2 * Math.PI)
    ctx.fillStyle = "rgb(255,255,0)"
    ctx.fill()
  },
  // 画四边形
  drawQuadrilateral() {
    ctx.clearRect(0, 0, 350, 200);
    ctx.beginPath();
    ctx.fillStyle = "rgba(255,0,0)"
    ctx.fillRect(50, 10, 100, 60)
  },
  // 画三角形
  drawTriangle() {
    ctx.clearRect(0, 0, 350, 200);
    ctx.beginPath();
    ctx.lineWidth = 1;
    ctx.moveTo(20, 20);
    ctx.lineTo(300, 90);
    ctx.lineTo(50, 90);
    ctx.fillStyle = "rgb(0,0,255)"
    ctx.fill();
  },
  // 画弧线
  drawArc() {
    ctx.clearRect(0, 0, 350, 200);
    ctx.beginPath();
    ctx.arc(100, 50, 50, 0, Math.PI)
    ctx.strokeStyle = "rgb(255,0,255)"
    ctx.stroke();
  },
  // 画文字
  drawText() {
    ctx.clearRect(0, 0, 350, 200);
    ctx.font = "30px 宋体";
    ctx.fillStyle = "rgb(255,255,0)"
    ctx.fillText('MINA', 100, 100);
  },
  // 画图片
  drawImg() {
    wx.downloadFile({
      url: "https://tse1-mm.cn.bing.net/th/id/OIP.O1CyeKs-ES3CZTfWbTjA2gHaEo?w=301&h=187&c=7&o=5&dpr=1.25&pid=1.7",
      success: function (res) {
        var img = canvas.createImage();
        img.src = res.tempFilePath;
        img.onload = () => {
          ctx.drawImage(img, 0, 0, 300, 200);
        }
      }
    })
  },
  // 验证码
  drawTest() {
    ctx.clearRect(0, 0, 350, 200);
    var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    function random(a, b) {
      return Math.floor(Math.random() * (b - a + 1)) + a
    }
    var code = "";
    for (var i = 0; i < 6; i++) {
      code += str[random(0, str.length - 1)];
    }
    // 画线段
    for (var i = 0; i < 100; i++) {
      ctx.beginPath();
      // 随机颜色
      ctx.strokeStyle = "rgba(" + random(0, 255) + "," + random(0, 255) + "," + random(0, 255) + "," + Math.random() + ")";
      ctx.lineWidth = 1;
      ctx.moveTo(random(0, 350), random(0, 250))
      ctx.lineTo(random(0, 350), random(0, 250))
      ctx.stroke();
    }
    // 画圆形
    for (var i = 0; i < 50; i++) {
      ctx.beginPath();
      // 随机颜色
      ctx.fillStyle = "rgba(" + random(0, 255) + "," + random(0, 255) + "," + random(0, 255) + "," + Math.random() + ")";
      ctx.arc(random(0, 350), random(0, 250), random(2, 10), 0, Math.PI * 2)
      ctx.fill();
    }
    // 绘制文本
    for (var i = 0; i < code.length; i++) {
      ctx.font = random(30, 50) + "px 微软雅黑"
      // 随机颜色
      ctx.fillStyle = "rgba(" + random(0, 255) + "," + random(0, 255) + "," + random(0, 255) + "," + random(7, 10) / 10 + ")";
      // 上下居中
      ctx.textBaseline = "middle";
      // 绘制文本的位置
      ctx.fillText(code[i], 50 * i + 20, random(50, 125));
    }
  },
  // 贝塞尔曲线
  drawBsr() {
    ctx.clearRect(0, 0, 350, 200);
    ctx.beginPath();
    ctx.strokeStyle = "rgb(255,0,255)";
    ctx.bezierCurveTo(10, this.data.one, 150, this.data.two, 290, this.data.three);
    ctx.stroke();
  },
  changeOne(e) {
    this.setData({
      one: e.detail.value
    })
    this.drawBsr();
  },
  changeTwo(e) {
    this.setData({
      two: e.detail.value
    })
    this.drawBsr();
  },
  changeThree(e) {
    this.setData({
      three: e.detail.value
    })
    this.drawBsr();
  },

  drawPolygon() {
    ctx.clearRect(0,0,350,200);
    var x = 150; //中心点x坐标
    var y = 100; //中心点y坐标
    var num = this.data.count; //图形边的个数
    var r = 50; //图形的半径
    //开始路径
    ctx.beginPath();
    ctx.strokeStyle = "red";
    var startX = x + r * Math.cos(2 * Math.PI * 0 / num);
    var startY = y + r * Math.sin(2 * Math.PI * 0 / num);
    ctx.moveTo(startX, startY);
    for (var i = 1; i <= num; i++) {
      var newX = x + r * Math.cos(2 * Math.PI * i / num);
      var newY = y + r * Math.sin(2 * Math.PI * i / num);
      ctx.lineTo(newX, newY);
    }
    ctx.closePath();
    ctx.stroke();
  },
  changeCount(e){
    this.setData({
      count:e.detail.value
    })
    this.drawPolygon();
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
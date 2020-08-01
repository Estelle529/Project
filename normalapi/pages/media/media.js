// pages/media/media.js
// 获取背景音频管理器
let bgaudio = wx.getBackgroundAudioManager();
// 音乐
let audio = wx.createInnerAudioContext();
// 录音管理器
let recorder = wx.getRecorderManager();
let video;
var temp;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    recordMessage: "录音",
    recordBgcolor: "lightskyblue",
    recordList: [],
    danmumessage: "",
    time: 0,
    danmuList: [{
      text: '第 1s 出现的弹幕',
      color: '#ff0000',
      time: 1
    }, {
      text: '第 3s 出现的弹幕',
      color: '#ff00ff',
      time: 3
    }]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // 背景音乐路径 必填
    // bgaudio.src = "http://m8.music.126.net/20200723100628/0bc2121591c91e988ba4441a15709671/ymusic/0fd6/4f65/43ed/a8772889f38dfcb91c04da915b301617.mp3";
    // 背景音乐标题 必填
    // bgaudio.title = "bg";     //背景音乐路径一给自己就开始播放了

    // 音乐路径 必填
    audio.src = "http://music.163.com/song/media/outer/url?id=513360721.mp3";
    // 给音乐添加监听事件
    audio.onTimeUpdate(this.audioUpdate);
    // 监听录音结束
    recorder.onStop(this.stopRecord);
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    // 视频
    video = wx.createVideoContext("myVideo", this)
  },
  // 背景音乐  可允许在后台
  playbgmusic() {
    // 播放背景音乐
    bgaudio.play();
  },
  pausebgmusic() {
    // 暂停背景音乐
    bgaudio.pause();
  },

  // 音乐 只能在前台
  playmusic() {
    // 播放音乐
    audio.play();
  },
  pausemusic() {
    // 暂停音乐
    audio.pause();
  },
  audioUpdate() {
    console.log(audio.duration, audio.currentTime)
  },
  //调节音量  只能调节音频
  changeVolume(e) {
    audio.volume = e.detail.value;
  },

  // 开始录音
  beginRecord() {
    this.setData({
      recordMessage: "正在录音",
      recordBgcolor: "red"
    })
    recorder.start({
      duration: 10000
    });
    this.timer = setInterval(() => {
      temp = (this.data.time + 0.1).toFixed(1);
      this.setData({
        time: temp * 1
      })
    }, 100)
  },
  // 结束录音
  endRecord() {
    this.setData({
      recordMessage: "录音",
      recordBgcolor: "lightskyblue"
    })
    recorder.stop();
    clearInterval(this.timer);
    this.setData({
      time: 0
    })
    temp = 0;
  },
  // 监听到结束录音之后干的事情
  stopRecord(res) {
    res.duration = (res.duration / 1000).toFixed(1)
    this.setData({
      recordList: [...this.data.recordList, res]
    })
  },
  // 播放录音
  playRecord(e) {
    audio.src = e.target.dataset.src;
    audio.play();
  },
  getMessage(e) {
    this.setData({
      danmumessage: e.detail.value
    })
  },
  getRandomColor() {
    const rgb = []
    for (let i = 0; i < 3; ++i) {
      let color = Math.floor(Math.random() * 256).toString(16)
      color = color.length === 1 ? '0' + color : color
      rgb.push(color)
    }
    return '#' + rgb.join('')
  },
  // 发送弹幕
  sendDanmu() {
    video.sendDanmu({
      text: this.data.danmumessage,
      color: this.getRandomColor()
    })
    this.setData({
      danmumessage: ""
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
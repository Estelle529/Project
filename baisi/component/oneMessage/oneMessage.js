// component/oneMessage/oneMessage.js
let baseUrl = getApp().globalData.baseUrl; 
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    oneMessageData: {
      type: Object,
      value:{}
    }
  },

  /**
   * 组件的初始数据
   */
  data: {
    
  },

  /**
   * 组件的方法列表
   */
  methods: {
    // 预览大图
    viewBig(){
      wx.previewImage({
        urls: [this.data.oneMessageData.cdn_img]
      })
    },
    // 发射音频数据
    sendAudio(){
      var url = this.data.oneMessageData.voiceuri;
      this.triggerEvent('myaudio', url)
    },
    // 发射Id
    sendId(){
      var id = this.data.oneMessageData.id;
      var name = this.data.oneMessageData.name
      var obj = {
        id:id,
        name:name
      }
      this.triggerEvent('myId', obj)
    },
    // 设置浏览记录
    setStory(){
      wx.getStorage({
        key: 'user',
        success:(res)=>{
          wx.request({
            url: baseUrl + '?a=history&c=add&openid=' + res.data.openid + "&newsid=" + this.data.oneMessageData.id,
            success:(res)=>{
              console.log(res.data.message)
            }
          })
        },
        fail:(res)=>{
          wx.showToast({
            title: '你还没有登陆，只有登陆才会有历史记录哦，快去登陆吧',
            icon:"none"
          })
        }
      })
    }
  }
})
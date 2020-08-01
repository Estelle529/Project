//index.js
//获取应用实例
const app = getApp()
var order = ['green', 'red', 'yellow', 'blue']
Page({
  data: {
    toView: "green",
    startTouch: 0,
    endTouch: 0
  },
  onTouchstart: function(e) {
    this.setData({
      startTouch: e.changedTouches[0].pageY
    })
  },
  onTouchend: function(e) {
    this.setData({
      endTouch: e.changedTouches[0].pageY
    })
    if (this.data.endTouch - this.data.startTouch > 10) {
      console.log("向下滑动")
      for (var i = 0; i < order.length; i++) {
        if (order[i] === this.data.toView) {
          var j = i-1>=0?i-1:0
          this.setData({
            toView: order[j]
          })
          break
        }
      }
    } else if (this.data.endTouch - this.data.startTouch < -10) {
      console.log("向上滑动")
      for (var i = 0; i < order.length; i++) {
        if (order[i] === this.data.toView) {
          var j = i + 1 <= 3 ? i + 1 : 3
          this.setData({
            toView: order[j]
          })
          break
        }
      }
    }
  },
  onLoad: function() {

  }
})
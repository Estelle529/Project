// component/oneFocus/oneFocus.js
var timeout;
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    onefocusdata: {
      type: Object,
      value: {}
    }
  },

  /**
   * 组件的初始数据
   */
  data: {
    cancel: false
  },

  /**
   * 组件的方法列表
   */
  methods: {
    //将取消关注显示出来
    showCancel() {
      this.setData({
        cancel: true
      })
      timeout = setTimeout(() => {
        this.setData({
          cancel: false
        })
      }, 3000)
    },
    // 发射id 确定取消
    cancelFocus(e) {
      // 将id发射出去，在父组件中进行取消
      this.triggerEvent('sendId', e.currentTarget.dataset.id)
      // 取消定时器
      this.setData({
        cancel: false
      })
      clearTimeout(timeout);
    },
  }
})
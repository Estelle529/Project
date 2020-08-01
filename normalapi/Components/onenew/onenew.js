// Components/onenew.js
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    newdata: {
      type: Object,
      value: {

      }
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
    sendUrl() {
      var arr = this.data.newdata.url.split("/");
      var id = arr[arr.length - 1]
      this.triggerEvent('myevent', id)
    }
  }
})
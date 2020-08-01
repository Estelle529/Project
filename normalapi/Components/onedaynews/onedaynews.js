// Components/onedaynews/onedaynews.js
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    onedaydata:{
      type:Object,
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
    getId(e){
      this.triggerEvent('myevent1', e.detail)
    }
  }
})

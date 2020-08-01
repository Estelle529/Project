Component({
  // 样式配置
  options:{
    styleIsolation: 'isolated'
  },
  properties: {
    roomdata: {
      type: Object, //必须是对象
      value: {} //默认值
    }
  },
  data: {
    // 这里是一些组件内部数据
    someData: {}
  },
  methods: {
    // 这里是一个自定义方法
    customMethod: function () {},
    sengid(){
      this.triggerEvent('myevent', this.data.roomdata.rid)
    }
  },
  lifetimes: {
    created: function () {
      // 组将刚刚被创建时
    },
    attached: function () {
      // 在组件实例进入页面节点树时执行
    },
    ready: function () {
      // 在组件在视图层布局完成后执行
    },
    moved: function () {
      // 在组件实例被移动到节点树另一个位置时执行
    },
    detached: function () {
      // 在组件实例被从页面节点树移除时执行
    },
    error: function () {

    }
  },
})
import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'


// element组件库
import { Input, Button, Carousel, CarouselItem, Icon } from 'element-ui'
Vue.use(Input);
Vue.use(Button);
Vue.use(Carousel);
Vue.use(CarouselItem);
Vue.use(Icon);



// axios
import axios from 'axios'
Vue.prototype.axios = axios.create({
  baseURL: "http://vebcoder.cn:9527/api"
});

// 懒加载
import lazyload from 'vue-lazyload'
Vue.use(lazyload, {
  loading: require('./assets/loading.gif')
})

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

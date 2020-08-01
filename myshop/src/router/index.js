import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

// 网上解决方案,避免路有重复时报错
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/Login')
  },
  {
    path: '/register',
    name: 'Register',
    component: () => import('../views/Register')
  },
  {
    path: '/search/:word',
    name: 'Searchresult',
    component: () => import('../views/Searchresult')
  },
  {
    path: '/onecat',
    name: 'Getonecat',
    component: () => import('../views/Getonecat')
  }, 
  {
    path: '/detail/:id',
    name: 'Productdetail',
    component: () => import('../views/Productdetail')
  },
  {
    path: '/cart',
    name: 'Mycart',
    component: () => import('../views/Mycart')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

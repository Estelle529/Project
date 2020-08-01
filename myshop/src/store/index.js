import Vue from 'vue'
import Vuex from 'vuex'

// 因为状态管理中的数据刷新之后会被清空,所以将数据存到本地 方便刷新之后读取
import ls from '../localstorage.js'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    // 是否显示分类 如果缓存中有 就用缓存的 没有就默认
    isallcat: ls.getItem("isallcat") || true,

    // 是否登录成功   如果缓存中有 就用缓存的 没有就默认没有登陆
    islogin: ls.getItem("islogin") || "",
    // 令牌  如果缓存中有 就用缓存的 没有就默认没有
    token: ls.getItem("token") || "",
    // 登陆成功的用户名  如果缓存中有 就用缓存的 没有就默认没有
    user: ls.getItem("user") || "",

    // 是否显示loading
    allloading: false,

    // 分类的索引
    currcat: ls.getItem("currcat") || 7,
  },
  mutations: {
    setcat(state, value) {
      // 赋值并存入本地
      state.isallcat = value
      ls.setItem("isallcat", value)
    },

    setloginstause(state, value) {
      // 赋值并存入本地
      state.islogin = value
      ls.setItem("islogin", value)
    },
    settoken(state, value) {
      // 赋值并存入本地
      state.token = value
      ls.setItem("token", value)
    },
    setuser(state, value) {
      // 赋值并存入本地
      state.user = value
      ls.setItem("user", value)
    },

    setallloading(state, value) {
      state.allloading = value
    },

    setcatindex(state, value) {
      // 赋值并存入本地
      state.currcat = value
      ls.setItem("currcat", value)
    }
  },
  actions: {
  },
  modules: {
  }
})

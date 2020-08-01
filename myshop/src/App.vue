<template>
  <div id="app">
    <Head :isfixed="isfixed"></Head>
    <Allcat v-show="isallcat"></Allcat>
    <!-- 为什么这样写,因为在搜索的时候 用的是同一个组件 搜索不同的东西 数据重用机制 页面不会刷新-->
    <!-- 动态生成状态key 避免数据重用 就刷新 -->
    <router-view v-if="isRouterActive" :key="key" />
    <!-- 回到顶部 -->
    <div v-show="isgotop" class="gotop" @click="gotop">up</div>
    <!-- 全局加载 -->
    <div class="allloading" v-show="allloading"><img src="@/assets/allloading.gif" alt=""></div>
  </div>
</template>
<script>
  import Head from "@/components/Head.vue"
  import Allcat from "@/components/Allcat.vue"
  import { mapState } from 'vuex'

  export default {
    components: {
      Head,
      Allcat
    },
    data() {
      return {
        isgotop: false,
        isfixed: false,
        isRouterActive: true,
        key: ''
      }
    },
    created() {
      window.addEventListener('scroll', this.check);
    },
    methods: {
      check() {
        // 是否回到顶部
        if (document.documentElement.scrollTop || document.body.scrollTop > 300) {
          this.isgotop = true
        } else {
          this.isgotop = false
        }

        // 检查是否头部固定定位
        if (document.documentElement.scrollTop || document.body.scrollTop > 70) {
          // 传值给head子组件
          this.isfixed = true;
        } else {
          // 传值给head子组件
          this.isfixed = false;
        }
      },
      gotop() {
        var timer = setInterval(function () {
          document.documentElement.scrollTop -= 100;
          if (document.documentElement.scrollTop <= 0) {
            document.documentElement.scrollTop = 0;
            clearInterval(timer);
          }
        }, 16.7)
      }
    },
    computed: {
      ...mapState(["isallcat", "allloading"])
    },
    watch: {
      $route(newdata, olddata) {

        this.isRouterActive = false;

        this.key = Math.random() * 1000;

        this.$nextTick(() => (this.isRouterActive = true))
      }
    },
  }
</script>
<style>
  body,
  html {
    margin: 0;
    padding: 0;
    overflow-y: scroll;
  }

  #app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
  }

  .setWidth {
    width: 1200px;
    min-width: 1200px;
    margin: 0 auto;
  }


  .gotop {
    width: 50px;
    height: 50px;
    border-radius: 10px;
    text-align: center;
    line-height: 50px;
    background-color: rgb(32, 85, 185);
    color: #fff;
    position: fixed;
    bottom: 100px;
    right: 100px;
    cursor: pointer;
  }

  .allloading {
    width: 100%;
    height: 100%;
    position: fixed;
    z-index: 100;
    top: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: rgba(0, 0, 0, 0.7);
  }

  .allloading img {
    transform: scale(0.6);
  }
</style>
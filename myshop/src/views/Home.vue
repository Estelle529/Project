<template>
  <div class="home">
    <div class="homecontent setWidth">
      <el-carousel height="500px">
        <el-carousel-item v-for="item,index in imglist" :key="index">
          <img :src="item" alt="">
        </el-carousel-item>
      </el-carousel>
      <div class="products">
        <Product v-for="(item,index) in productList" :productdata="item"></Product>
      </div>
      <div class="loadmsg">
        {{loadmsg}}
      </div>
    </div>
  </div>
</template>

<script>
  import Product from '../components/Product'

  export default {
    name: 'Home',
    data() {
      return {
        imglist: [
          "http://vebcoder.cn:9527/images/a.jpg",
          "http://vebcoder.cn:9527/images/b.jpg",
          "http://vebcoder.cn:9527/images/c.jpg",
          "http://vebcoder.cn:9527/images/d.jpg",
          "http://vebcoder.cn:9527/images/e.jpg"
        ],
        productList: [],
        page: 1,
        isgetting: false,
        loadmsg: "正在加载中..."
      }
    },
    created() {
      this.axios.get('/goodList?page=' + this.page).then((res) => {
        this.productList = res.data;
      })
      window.addEventListener('scroll', this.check);
      // 显示分类
      this.$store.commit('setcat', true)
      // 分类索引整成7  谁也不具有样式
      this.$store.commit("setcatindex",7)
    },
    methods: {
      check() {
        if (document.documentElement.scrollHeight - window.innerHeight - (document.documentElement.scrollTop || document.body.scrollTop) < 10) {
          if (this.isgetting) return;  // 正在请求就返回
          this.isgetting = true;     // 如果上次请求已完成,开始请求
          // 加载下一页数据
          this.page++;
          this.$store.commit('setallloading', true)
          this.axios.get('/goodList?page=' + this.page).then((res) => {
            if (res.data.length > 0) {
              this.productList = this.productList.concat(res.data);
            } else {
              this.loadmsg = "没有更多数据了"
            }
            this.isgetting = false;
            this.$store.commit('setallloading', false)
          })
          console.log("触底")
        }
      }
    },
    mounted() {
      
    },
    destroyed() {
      // 虽然切换页面之后  主页被销毁  但是滚动监听还在  所以要在页面切换 主页销毁时解除事件绑定
      window.removeEventListener('scroll', this.check);
    },
    components: {
      Product
    }
  }
</script>
<style scoped>
  .el-carousel {
    border-radius: 20px;
  }

  .el-carousel__item img {
    width: 1200px;
    height: 500px;
  }

  .loadmsg {
    text-align: center;
    color: rgb(32, 85, 185);
  }


  /* 样式穿透 */
  /* 因为有scoped的样式限制,给别人的组件设置样式设置不上 */
  /* 用样式穿透摆脱限制 */
  /* 用的时候 自己组件的元素>>>第三方组件的元素 */
  .home>>>.el-carousel__container .el-carousel__arrow {
    background-color: rgb(32, 85, 185);
    color: #fff;
  }

  .home>>>.el-carousel__container .el-carousel__arrow:hover {
    width: 50px;
    height: 50px;
  }

  .products {
    width: 100%;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
  }
</style>
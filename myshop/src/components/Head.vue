<template>
    <div class="head" :class="{'befixed':isfixed}">
        <div class="headContent setWidth">
            <div class="left">
                <img src="http://vebcoder.cn:9527/img/logo.57933597.png" alt="" v-show="!isfixed">
                <div class="headrouters">
                    <router-link to="/">首页</router-link>
                    <router-link to="/login" v-if="!islogin">登录</router-link>
                    <router-link to="/cart" v-else>{{user}}的购物车</router-link>
                    <router-link to="/register" v-if="!islogin">注册</router-link>
                    <a v-else><span @click="singout">退出登录</span></a>
                </div>
            </div>
            <div class="right">
                <el-input placeholder="请输入想要的商品" type="text" v-model="searchText" class="input-with-select"
                    @keyup.enter="search">
                    <el-button slot="append" icon="el-icon-search" @click="search">搜索</el-button>
                </el-input>
            </div>
        </div>
    </div>
</template>
<script>
    import { mapState } from 'vuex'
    import { Message } from 'element-ui';
    export default {
        name: "Head",
        props: ["isfixed"],
        data() {
            return {
                searchText: ""
            }
        },
        created() {

        },
        methods: {
            search() {
                if (this.searchText.length == 0) {
                    Message({
                        message: "搜索内容不能为空!",
                        type: "warning",
                        showClose: true
                    });
                } else {
                    // 进行搜索
                    this.$store.commit('setcat', false)
                    this.$router.push("/search/" + this.searchText)
                }
            },
            singout() {
                this.$store.commit('setloginstause', false)
                this.$store.commit('settoken', "")
                this.$store.commit('setuser', "")
                Message({
                    message: "退出成功,再见",
                    type: "success",
                    showClose: true
                })
                // 如果是购物车页跳回主页  要是其他页面就不用管
                if (this.$route.path == "/cart") {
                    this.$router.push("/");
                }

            }
        },
        computed: {
            ...mapState(["islogin", "user"])
        },
        watch: {
            $route() {
                // 只要页面发生跳转就显示全局loading
                this.$store.commit('setallloading', true)
                var timer = setTimeout(() => {
                    this.$store.commit('setallloading', false);
                    clearTimeout(timer)
                }, 700)
            }
        },
    }
</script>
<style scoped>
    .head {
        box-shadow: 0px 5px 10px #999;
        background-color: #fff;
    }

    .befixed {
        width: 100%;
        position: fixed;
        z-index: 100;
        top: 0;
    }

    .headContent {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 0;
    }

    img {
        width: 188px;
        height: 74px;
    }

    .headrouters {
        width: 300px;
        height: 30px;
        align-items: center;
        line-height: 30px;
        display: flex;
        justify-content: space-around;
        padding: 5px;
    }

    .right {
        width: 450px;
        margin-right: 150px;
    }

    .headrouters a {
        padding: 0 5px;
        text-decoration: none;
        color: #444;
        font-size: 17px;
        font-weight: bold;
        cursor: pointer;
    }

    .headrouters a:hover {
        border-bottom: 2px solid rgb(32, 85, 185);
        color: rgb(32, 85, 185);
    }

    /* router-link-exact-active是当前路由自带的类名  当前在哪 谁就有这个类名  那就给这个类名加上样式不就行了 */
    .headrouters .router-link-exact-active {
        border-bottom: 2px solid rgb(32, 85, 185);
        color: rgb(32, 85, 185);
    }

    /* 样式穿透 */
    /* 因为有scoped的样式限制,给别人的组件设置样式设置不上 */
    /* 用样式穿透摆脱限制 */
    /* 用的时候 自己组件的元素>>>第三方组件的元素 */

    .right>>>.el-input__inner:focus {
        outline: none;
        border: 1px solid rgb(158, 40, 158);
    }

    .right>>>.el-input-group__append {
        background-color: transparent;
    }

    .right>>>.el-input-group__append:hover {
        border: 1px solid rgb(158, 40, 158);
        color: rgb(158, 40, 158);
        border-left: none;
    }
</style>
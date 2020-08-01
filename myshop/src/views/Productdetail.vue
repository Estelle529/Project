<template>
    <div class="productdetail">
        <div class="top">
            <div class="goback" @click="goback">返回</div>
            <div class="topcontent">
                <div class="left" ref="left">
                    <div class="beginImg" @mousemove="move($event)" @mouseenter="flag=true" @mouseleave="flag=false">
                        <img :src="currUrl" alt="">
                        <div class="shadow" ref="shadow" v-show="flag"></div>
                    </div>
                    <div class="tabs">
                        <img :src="item" @click="changeimg(item,index)" alt="" v-for="item,index in imglist"
                            :class="{currimg:index==currIndex}">
                    </div>
                    <div class="big" v-show="flag">
                        <img :src="currUrl" alt="" ref="bigimg">
                    </div>
                </div>
                <div class="right">
                    <h2>{{detaildata.title}}</h2>
                    <p>{{detaildata.supplier}}</p>
                    <p style="color: red;">${{detaildata.price}}</p>
                    <div class="star">
                        <div class="full">
                            <img src="../../public/star.png" v-for="item in 5" alt="">
                        </div>
                        <div class="white" :style="{width:white}"></div>
                        <div class="empty">
                            <img src="../../public/star-empty.png" v-for="item in 5" alt="">
                        </div>
                        <span>{{score}}</span>
                    </div>
                    <div class="addcart" @click="addcart(detaildata.Id)">添加到购物车</div>
                </div>
            </div>

        </div>

        <div class="aboutproduct">
            <span>相似商品推荐</span>
            <hr>
            <!-- 相似商品 -->
            <div class="products">
                <Product v-for="item,index in aboutlist" :productdata="item"></Product>
            </div>
        </div>
    </div>
</template>
<script>
    import Product from "../components/Product"
    import { mapState } from 'vuex'
    import { Message } from 'element-ui';
    export default {
        name: "Productdetail",
        created() {
            this.$store.commit('setcat', false)
            this.axios.get("/detail?goodId=" + this.$route.params.id).then((res) => {
                // 整个商品的详细数据
                this.detaildata = res.data[0];
                // 商品中图片列表
                this.imglist = JSON.parse(res.data[0].imgs);
                // 默认上头大图显示第一个
                this.currUrl = this.imglist[0];
                // 星星分数
                var num = res.data[0].nice / 200;
                this.score = num.toFixed(1)

                // 等商品详情加载完之后 再加载相似数据
                this.getAbout();

            });


        },
        data() {
            return {
                detaildata: {},
                imglist: [],
                aboutlist: [],
                currIndex: 0,
                currUrl: "",
                flag: false,
                score: 0
            }
        },
        methods: {
            changeimg(url, index) {
                this.currIndex = index;
                this.currUrl = url;
            },
            move(event) {
                this.$refs.shadow.style.left = event.clientX - this.$refs.left.offsetLeft - 100 + "px";
                this.$refs.shadow.style.top = event.clientY + document.documentElement.scrollTop - this.$refs.left.offsetTop - 100 + "px";
                this.$refs.bigimg.style.left = -2 * (event.clientX - this.$refs.left.offsetLeft - 100) + "px";
                this.$refs.bigimg.style.top = -2 * (event.clientY + document.documentElement.scrollTop - this.$refs.left.offsetTop - 100) + "px";
                if (event.clientX - this.$refs.left.offsetLeft - 100 < 0) {
                    this.$refs.shadow.style.left = "0px"
                    this.$refs.bigimg.style.left = "0px"
                }
                if (event.clientX - this.$refs.left.offsetLeft - 100 > 200) {
                    this.$refs.shadow.style.left = "200px"
                    this.$refs.bigimg.style.left = "-400px"
                }
                if (event.clientY + document.documentElement.scrollTop - this.$refs.left.offsetTop - 100 < 0) {
                    this.$refs.shadow.style.top = "0px"
                    this.$refs.bigimg.style.top = "0px";
                }
                if (event.clientY + document.documentElement.scrollTop - this.$refs.left.offsetTop - 100 > 200) {
                    this.$refs.shadow.style.top = "200px"
                    this.$refs.bigimg.style.top = "-400px"
                }
            },
            goback() {
                this.$router.go(-1);
            },
            getAbout() {
                // 请求相似商品列表     貌似有问题  不能这样写
                this.axios.get("/goodList", {
                    params: {
                        type_one: this.detaildata.type_one,
                        type_two: this.detaildata.type_two
                    }
                }).then((res) => {
                    // 加载出来很多我们只要前八个
                    this.aboutlist = res.data.slice(0, 8);
                });
            },
            addcart(id) {
                if (this.islogin) {
                    // 进行购物车添加
                    this.axios.get("/add?token=" + this.token + "&goodId=" + id).then((res) => {
                        if (res.data.code == 1) {
                            Message({
                                message: "该商品已经添加到购物车了,快去购物车看看吧",
                                type: "success",
                                showClose: true
                            })
                        } else {
                            Message({
                                message: "添加失败,似乎出了一点问题",
                                type: "error",
                                showClose: true
                            })
                        }
                    })
                } else {
                    // 跳转到登录页面
                    Message({
                        message: "您还没有登录,正在为您跳转登录页面...",
                        type: "info",
                        showClose: true
                    })
                    var timer = setTimeout(() => {
                        this.$router.push("/login");
                        clearTimeout(timer)
                    }, 1000)
                }
            }
        },
        computed: {
            ...mapState(["islogin", "token"]),
            white() {
                return 150 - this.score / 5 * 150 + "px"
            }
        },
        components: {
            Product
        }
    }
</script>
<style scoped>
    .productdetail {
        margin-top: 50px;
    }

    .goback {
        width: 100px;
        height: 40px;
        text-align: center;
        line-height: 40px;
        border: 1px solid #bbb;
        border-radius: 10px;
        cursor: pointer;
    }

    .top,
    .aboutproduct {
        width: 1000px;
        margin: 30px auto 0;
    }

    .topcontent {
        margin-top: 20px;
        display: flex;
    }

    .left {
        width: 400px;
        position: relative;
    }

    .beginImg {
        cursor: zoom-in;
        position: relative;
    }

    .beginImg img {
        width: 400px;
        height: 400px;

    }

    .tabs {
        margin-top: 20px;
        width: 400px;
        height: 70px;
        display: flex;
        justify-content: space-between;
    }

    .tabs img {
        width: 75px;
        height: 75px;
        transition: 0.5s;
    }

    .currimg {
        transform: translateY(-10px);
        box-shadow: 0 0 10px rgb(32, 85, 185);
    }

    .shadow {
        width: 200px;
        height: 200px;
        background-color: rgba(0, 0, 0, 0.3);
        position: absolute;
        top: 0;
    }

    .big {
        width: 400px;
        height: 400px;
        position: absolute;
        z-index: 3;
        overflow: hidden;
        left: 400px;
        top: 0;
    }

    .big img {
        width: 800px;
        height: 800px;
        position: absolute;
    }

    .right {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        margin: 100px 0 0 150px;
    }

    .star img,
    .star span {
        width: 20px;
        height: 20px;
        margin: 5px;
    }

    .star {
        position: relative;
        width: 180px;
        height: 34px;
    }

    .star span {
        position: absolute;
        right: 0;
        top: 5px;
    }

    .full,
    .empty,
    .white {
        position: absolute;
    }

    .white {
        background-color: #fff;
        height: 30px;
        right: 30px;
    }

    .addcart {
        width: 125px;
        height: 45px;
        background-color: #f78989;
        line-height: 45px;
        text-align: center;
        color: #eee;
        border-radius: 10px;
        cursor: pointer;
    }

    .aboutproduct {
        text-align: left;
    }

    .products {
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }
</style>
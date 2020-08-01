<template>
    <div class="mycart">
        <div class="cartcontent setWidth">
            <div class="onecartpro" v-for="item,index in cartlist">
                <input type="checkbox" :value="item.Id" v-model="choosearr" @change="chooseone">
                <img :src="item.img_list_url" alt="">
                <div class="right">
                    <div class="info">
                        <h3>{{item.title}}</h3>
                        <span style="color: red;">单价:${{item.price}}</span>
                        <span v-html="item.mack"></span>
                    </div>
                    <div class="control">
                        <span class="red" @click="changeCount(item.Id,index,'remove')">-</span>
                        <span>{{item.count}}</span>
                        <span class="add" @click="changeCount(item.Id,index,'add')">+</span>
                        <span class="totalpeice">小计:${{item.price*item.count}}</span>
                        <span class="del" @click="delthis(item.Id,index)">删除</span>
                    </div>
                </div>
            </div>
            <div class="message" v-show="!ishascartdata">暂无购物车数据</div>
        </div>
        <div class="gettotal" v-show="ishascartdata">
            <div class="setWidth gettotalContent">
                <label>
                    <input type="checkbox" v-model="ischoosAll" @change="chooseAll">全选
                </label>
                <span>总计:{{totalprice}}元</span>
                <button>去支付</button>
            </div>
        </div>
    </div>
</template>
<script>
    import { mapState } from 'vuex'
    import { Message } from 'element-ui';
    import { MessageBox } from 'element-ui';
    import ls from '../localstorage.js'
    export default {
        name: "Mycart",
        
        data() {
            return {
                cartlist: [],
                ishascartdata: true,
                choosearr: ls.getItem("choosedata") || [],
                ischoosAll: false
            }
        },
        created() {
            // 不显示分类
            this.$store.commit('setcat', false)
            // 加载购物车的数据
            this.axios.get("/shoplist", {
                params: {
                    token: this.token
                }
            }).then((res) => {
                this.cartlist = res.data;
                // 加载完数据后   直接判断是否全选
                this.chooseone();
            })
        },
        computed: {
            ...mapState(["token"]),
            // 计算总价钱
            totalprice() {
                var myprice = 0;
                for (var i = 0; i < this.choosearr.length; i++) {
                    var id = this.choosearr[i];
                    for (var j = 0; j < this.cartlist.length; j++) {
                        if (this.cartlist[j].Id == id) {
                            myprice += (this.cartlist[j].price) * (this.cartlist[j].count);
                            break;
                        }
                    }
                }
                return myprice;
            }
        },
        methods: {
            // 改变商品的数量
            changeCount(id, index, type) {
                //检查登录状态
                this.checktoken();

                // 如果商品数量是1 并且修改类型为减少 直接提示不能减少
                if (this.cartlist[index].count == 1 && type == "remove") {
                    Message({
                        message: "该商品至少选中一件",
                        type: "info",
                        showClose: true
                    })
                    return false;
                }
                //先将页面上请求下来的数据进行本地修改,在页面上渲染出来,然后在数据库中也要修改保持一致
                // 根据索引找到对应的数据对象 本地处理
                if (this.cartlist[index].count > 1 && type == "remove") {
                    this.cartlist[index].count--;
                    // 更新到数据库,调用增加接口
                    this.axios.get("/" + type + "?token=" + this.token + "&goodId=" + id).then((res) => {
                        Message({
                            message: "商品数量已经减少",
                            type: "success",
                            showClose: true
                        })
                    })
                }

                if (type == "add") {
                    this.cartlist[index].count++;
                    // 更新到数据库,调用增加接口
                    this.axios.get("/" + type + "?token=" + this.token + "&goodId=" + id).then((res) => {
                        Message({
                            message: "商品数量已经增加",
                            type: "success",
                            showClose: true
                        })
                    })
                }

            },

            // 删除商品
            delthis(id, index) {
                //检查登录状态
                this.checktoken();
                // 检查商品选中的状态  也就是商品的Id在不在选中的数组中
                if (this.choosearr.indexOf(id) != -1) {
                    // 询问是否删除
                    MessageBox.confirm('此操作将删除该购物车商品, 是否继续?', '提示', {
                        confirmButtonText: '残忍舍弃',
                        cancelButtonText: '再想想',
                        type: 'warning'
                    }).then(() => {
                        // 找到本地数据删除
                        this.cartlist.splice(index, 1);

                        // 同时删除选中数组中的id
                        for (var i = 0; i < this.choosearr.length; i++) {
                            if (this.choosearr[i] == id) {
                                this.choosearr.splice(i, 1)
                            }
                        }

                        // 更新数据库的数据
                        this.axios.get("/del?token=" + this.token + "&goodId=" + id).then((res) => {
                            Message({
                                message: "删除商品成功",
                                type: "success",
                                showClose: true
                            })
                        })
                    }).catch(() => {
                        return false;
                    });
                } else {
                    Message({
                        message: "您还未选中该商品",
                        type: "info",
                        showClose: true
                    })
                }


            },

            checktoken() {
                if (!this.token) {
                    Message({
                        message: "您的token令牌或许已经过期,快去重新登陆吧",
                        type: "info",
                        showClose: true
                    })
                    this.$router.push("/login")
                }
            },

            //选中一个商品时 判断是否全选
            chooseone() {
                // 判断是否全选
                if (this.choosearr.length == this.cartlist.length) {
                    this.ischoosAll = true;
                } else {
                    this.ischoosAll = false;
                }
            },

            // 选中所有的商品
            chooseAll() {
                if (this.ischoosAll) {
                    // 全选  先清空在全部放进去
                    this.choosearr = [];
                    for (var i = 0; i < this.cartlist.length; i++) {
                        this.choosearr.push(this.cartlist[i].Id);
                    }
                } else {
                    // 全不选
                    this.choosearr = [];
                }

            }
        },
        watch: {
            // 监听页面中的商品数据 一旦没有商品数据 显示没有购物车数据
            cartlist(newdata, olgdata) {
                if (newdata.length == 0) {
                    this.ishascartdata = false
                }
            },

            //监听选中数组的变化 一旦选中的数组发生变化  就可以存储到本地  刷新之后不会消失
            choosearr(newdata, olddate) {
                ls.setItem("choosedata",newdata);
            }

        },
    }
</script>
<style scoped>
    .mycart {
        margin-top: 50px;
    }

    .onecartpro {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .right {
        width: 900px;
    }

    .onecartpro img {
        width: 200px;
        height: 200px;
    }

    .onecartpro span {
        font-size: 20px;
    }

    .info,
    .control {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .control {
        background-color: #eee;
    }

    .add,
    .red {
        cursor: pointer;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        transition: 0.5s;
        text-align: center;
        line-height: 50px;
    }

    .add:hover,
    .red:hover {
        background-color: rgb(32, 85, 185);
        color: #fff;
    }

    .del {
        width: 100px;
        height: 50px;
        border-radius: 10px;
        cursor: pointer;
        line-height: 50px;
        transition: 0.5s;
    }

    .del:hover {
        background-color: rgb(180, 31, 31);
        color: #fff;
    }

    .onecartpro {
        border-bottom: 1px solid #999;
    }

    .cartcontent .onecartpro:last-child {
        border: none;
    }

    .gettotal {
        width: 100%;
        height: 60px;
        position: fixed;
        bottom: 0;
        background-color: #eee;
    }

    .gettotalContent {
        height: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
</style>
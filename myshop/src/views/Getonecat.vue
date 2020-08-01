<template>
    <div class="getonecat">
        <div class="getonecontent setWidth">
            <div class="typetwofloor" v-for="(item,index) in list">
                <h2>{{item.type}}</h2>
                <hr>
                <div class="products">
                    <Product v-for="(pro,index) in item.arr" :productdata="pro"></Product>
                </div>
            </div>
        </div>
        <div class="fixbutton">
            <div class="floorbutton" :class="{curr:index==floor}" v-for="(item,index) in list"
                @click="gotofloor(index)">{{item.type}}</div>
        </div>
    </div>
</template>
<script>
    import Product from '../components/Product';
    import scrollto from '../scrollTo.js'
    export default {
        name: "Getonecat",
        data() {
            return {
                // list包含多个二级分类对象 每个二级分类对象有二级分类名称和数组 数组中是当前分类的多个商品
                list: [],
                floor: 0
            }
        },
        created() {
            // 获取并处理数据
            this.axios.get("/goodList?type_one=" + this.$route.query.cat).then((res) => {
                //二级分类类型数组 ["手冲","咖啡粉","咖啡豆"]
                var typetwo = [];

                // 得出二级分类的类型数组
                for (const item of res.data) {
                    if (typetwo.indexOf(item.type_two) != -1) {
                        continue;
                    } else {
                        typetwo.push(item.type_two);
                    }
                }

                // 循环二级分类,将属于各个分类的商品添加到对应对象中去
                for (const item of typetwo) {
                    // 二级分类对象
                    var obj = {};
                    // 二级分类名称
                    obj.type = item;
                    // 二级分类数组  包含当前二级分类的商品
                    obj.arr = [];
                    for (const pro of res.data) {
                        if (pro.type_two == item) {
                            obj.arr.push(pro)
                        }
                    }
                    this.list.push(obj);
                }
            })


            // 添加楼层滚动监听
            window.addEventListener("scroll", this.floorcheck);

            // 在分类页面  上面分类是要显示的
            this.$store.commit('setcat', true)
        },
        methods: {
            gotofloor(index) {
                this.currindex = index;
                var floors = document.getElementsByClassName("typetwofloor");
                // 最终要到达的地方
                var end = floors[index].offsetTop;
                // 以一定的时间滚动到对应的地方
                scrollto.scrollTo(end, 500)
            },
            floorcheck() {
                var floors = document.getElementsByClassName("typetwofloor");
                for (let i = floors.length - 1; i >= 0; i--) {
                    if (document.documentElement.scrollTop + 500 > floors[i].offsetTop) {
                        // 在当前页面滚动 直接返回
                        if (i == this.floor) {
                            return;
                        } else {
                            this.floor = i;
                            return;
                        }

                    }
                }
            }
        },
        components: {
            Product
        },
        destroyed() {
            window.removeEventListener("scroll", this.floorcheck);
        },
    }
</script>
<style scoped>
    .products {
        width: 100%;
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }

    .fixbutton {
        position: fixed;
        top: 240px;
        left: 100px;
        width: 150px;
    }

    .floorbutton {
        width: 100%;
        height: 50px;
        line-height: 50px;
        cursor: pointer;
        border-radius: 20px;
        margin: 5px 0;
    }

    .floorbutton:hover {
        box-shadow: 0 0 20px rgb(230, 233, 40) inset;
    }

    .curr {
        box-shadow: 0 0 20px rgb(230, 233, 40) inset;
    }
</style>
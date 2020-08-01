<template>
    <div class="allcat">
        <div class="catContent setWidth">
            <div v-for="item,index in typeone" class="onecat" :key="index" @click="gothiscat(item,index)" :class="{cat:currcat==index}">{{item}}</div>
        </div>
    </div>
</template>
<script>
    import {mapState} from 'vuex';
    export default {
        name: "Allcat",
        data() {
            return {
                typeone: []
            }
        },
        created() {
            this.axios.get('/getTypeone').then((res) => {
                this.typeone = res.data;
            })
        },
        methods: {
            gothiscat(item,index){
                this.$router.push({
                    path:"/onecat",
                    query:{
                        cat:item
                    }
                })
                // 更改当前分类的索引
                this.$store.commit("setcatindex",index)
            }
        },
        computed: {
            ...mapState(["currcat"])
        },
    }
</script>
<style scoped>
    .allcat{
        margin: 20px 0;
    }
    .catContent {
        display: flex;
        justify-content: space-around;
    }
    .onecat{
        width: 100px;
        padding: 5px;
        height: 20px;
        line-height: 20px;
        text-align: center;
        cursor: pointer;
        border-radius: 30px;
        transition: 0.5s;
    }
    .onecat:hover{
        background-color: rgb(32, 85, 185);
        color: #fff;
    }
    .cat{
        background-color: rgb(32, 85, 185);
        color: #fff;
    }
</style>
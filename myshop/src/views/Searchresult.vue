<template>
    <div class="searchresult">
        <div class="searchContent setWidth">
            <product v-for="(item,index) in searchlist" :productdata="item" :key="index" v-show="ishave"></product>
            <div class="nopro" v-show="!ishave" style="width:100%;text-align: center;">没有搜索到您想要的商品</div>
        </div>
    </div>
</template>
<script>
    import Product from "../components/Product"
    export default {
        name: "Searchresult",
        data() {
            return {
                searchlist: [],
                ishave: true
            }
        },
        created() {
            this.$store.commit('setallloading', true)
            this.axios.get("/search?word=" + this.$route.params.word).then((res) => {
                if (res.data.length > 0) {
                    this.searchlist = res.data
                } else {
                    this.ishave = false
                }
                this.$store.commit('setallloading', false)
            })
        },
        components: {
            Product
        },
        mounted() {

        },
    }
</script>
<style scoped>
    .searchresult {
        margin-top: 50px;
    }

    .searchContent {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
</style>
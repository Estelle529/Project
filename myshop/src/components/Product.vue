<template>
    <div class="product">
        <router-link :to="'/detail/'+ productdata.Id">
            <img v-lazy="productdata.img_list_url" alt="">
            <p>{{productdata.title}}</p>
            <p class="price"><span>${{productdata.price}}</span><span v-html="productdata.mack"
                    style="margin-right: 20px;"></span>
            </p>
        </router-link>
    </div>
</template>
<script>
    export default {
        name: "Product",
        props: ["productdata"]
    }
</script>
<style scoped>
    .product {
        width: 220px;
        cursor: pointer;
        overflow: hidden;
    }

    .product img {
        width: 220px;
        height: 220px;
        transition: 0.5s;
    }

    .product:hover img {
        transform: scale(1.1);
    }

    p {
        width: 100%;
        text-align: left;
        font-weight: bolder;
    }

    .price {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    span>>>span {
        padding: 3px;
        border-radius: 2px;
    }
    a{
        text-decoration: none;
        color: #444;
    }
</style>
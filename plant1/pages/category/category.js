import { Category } from 'category-model.js';
var category = new Category(); //实例化 home 的推荐页面
Page({
    data: {
        transClassArr: ['tanslate0', 'tanslate1', 'tanslate2', 'tanslate3', 'tanslate4', 'tanslate5', 'tanslate6'],
        currentMenuIndex: 0,
        /*用来保存已经加载过的数据，避免频繁地向服务器发起请求
        字典，dictionary
        {
          index:value,
          index:value
        }*/
    },
    onLoad: function() {
        this._loadData();
    },

    /*加载所有数据*/
    _loadData: function(callback) {
        var that = this;
        category.getCategoryType((res) => {

            that.setData({
                categoryTypeArr: res.data,
                loadingHidden: true
            });

            that.getProductsByCategory(that.data.categoryTypeArr[0].id, (res) => {
                var dataObj = {
                    procucts: res.data.category_products,
                    topImgUrl: that.data.categoryTypeArr[0].img.url,
                    title: that.data.categoryTypeArr[0].name
                };
                this.setData({
                    categoryInfo0: dataObj
                })
                callback && callback();
            });
        });
    },

    /*切换分类*/
    changeCategory: function(event) {
        var index = category.getDataSet(event, 'index'),
            id = category.getDataSet(event, 'id') //获取data-set
        this.setData({
            currentMenuIndex: index
        });

        //如果数据是第一次请求 向服务器发送请求 并绑定数据，如果不是（系统中已经有数据），则不用请求服务器，直接加载数据
        if (!this.isloadedData(index)) {
            var that = this;
            category.getProductsByCategory(id, (res) => {
                that.setData(that.getDataObjForBind(index, res));
            });
        }
    },

    //判断当前分类下的商品数据是否已经被加载
    isloadedData: function(index) {
        if (this.data['categoryInfo' + index]) {
            return true;
        }
        return false;
    },

    getDataObjForBind: function(index, res) {
        var obj = {},
            arr = [0, 1, 2, 3, 4, 5, 6];
        for (var item in arr) {
            if (item == arr[index]) {
                obj['categoryInfo' + item] = {
                    procucts: res.data.category_products,
                    topImgUrl: this.data.categoryTypeArr[item].img.url,
                    title: this.data.categoryTypeArr[item].name
                };
                return obj;
            }
        }
    },

    getProductsByCategory: function(id, callback) {
        category.getProductsByCategory(id, (res) => {
            callback && callback(res);
        });
    },

    /*跳转到商品详情*/
    onProductsItemTap: function(event) {
        var id = category.getDataSet(event, 'id');
        wx.navigateTo({
            url: '../product/product?id=' + id
        })
    }
})
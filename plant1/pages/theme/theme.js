import { Theme } from 'theme-model.js';
var theme = new Theme(); //实例化  主题列表对象
Page({
    data: {},
    onReady: function() {

    },
    onLoad: function(option) {
        this.data.id = option.id;
        this._loadData();

    },

    /*加载所有数据*/
    _loadData: function(callback) {
        var that = this;
        /*获取单品列表信息*/
        theme.getProductorData(this.data.id, (res) => {
            var serverData = res.data.products;
            var productsArr = theme.getStarNewData(serverData);
            that.setData({
                themeInfo: res.data,
                productsArr: productsArr
            });
            wx.setNavigationBarTitle({
                title: res.data.name
            });
            callback && callback();
        });
    },

    /*跳转到商品详情*/
    onProductsItemTap: function(event) {
        var id = theme.getDataSet(event, 'id');
        wx.navigateTo({
            url: '../product/product?id=' + id
        })
    },

    /*下拉刷新页面*/
    onPullDownRefresh: function() {
        this._loadData(() => {
            wx.stopPullDownRefresh()
        });
    },

    //分享效果
    onShareAppMessage: function() {
        return {
            title: '零食商贩 Pretty Vendor',
            path: 'pages/theme/theme?id=' + this.data.id
        }
    },
    onShow: function() {

    }

})
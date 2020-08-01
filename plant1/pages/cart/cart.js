// pages/cart/cart.js
import { Cart } from "../cart/cart-model.js";
var cart = new Cart();
Page({

    /**
     * 页面的初始数据
     */
    data: {

    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(options) {

    },


    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function() {
        var cartData = cart.getCartDataFromLocal();
        var cal = this._calAmountSelected(cartData);
        this.setData({
            selectedCounts: cal.selectedCounts,
            cartData: cartData,
            selectedTypeCounts: cal.selectedTypeCounts,
            amount: cal.amount
        })
    },

    _calAmountSelected: function(cartData) {
        var len = cartData.length;
        var amount = 0;
        var selectedCounts = 0;
        var selectedTypeCounts = 0;
        let multiple = 0;
        for (let i = 0; i < len; i++) {
            if (cartData[i].isSelectStatus) {
                amount += cartData[i].price * cartData[i].counts;
                selectedCounts += cartData[i].counts;
                selectedTypeCounts++;
            }
        }
        return {
            amount: amount,
            selectedCounts: selectedCounts,
            selectedTypeCounts: selectedTypeCounts
        }
    },

    toggleSelect: function(event) {
        var index = cart.getDataSet(event, 'index');
        var status = cart.getDataSet(event, 'status');
        this.data.cartData[index].isSelectStatus = !status;
        this._resetCartData();
    },

    _resetCartData: function() {
        var newData = this._calAmountSelected(this.data.cartData);
        this.setData({
            selectedCounts: newData.selectedCounts,
            cartData: this.data.cartData,
            selectedTypeCounts: newData.selectedTypeCounts,
            amount: newData.amount
        })
    },

    toggleSelectAll: function(event) {
        var status = cart.getDataSet(event, 'status') == 'true';
        var data = this.data.cartData;
        for (var i = 0; i < data.length; i++) {
            data[i].isSelectStatus = !status;
        }
        this._resetCartData();
    },

    changeCounts: function(event) {
        var type = cart.getDataSet(event, 'type');
        var index = cart.getDataSet(event, 'index');
        var id = cart.getDataSet(event, 'id');
        var counts = 1;
        if (type == 'add') {
            cart.addCounts(id);
        } else {
            counts = -1;
            cart.cutCounts(id);
        }
        this.data.cartData[index].counts += counts;
        this._resetCartData();
    },

    delete: function(event) {
        var id = cart.getDataSet(event, 'id');
        var index = cart.getDataSet(event, 'index');
        this.data.cartData.splice(index, 1); //从缓存数据删除商品
        this._resetCartData();
        cart.delete(id);
    },

    submitOrder: function(event) {
        wx.navigateTo({
            url: '../order/order?amount=' + this.data.amount + '&from=cart'
        });
    },

    onProductsItemTap: function(event) {
        var id = cart.getDataSet(event, 'id');
        wx.navigateTo({
            url: '../product/product?id=' + id
        })
    },

    onHide: function() {
        cart.saveStorage(this.data.cartData);
    },

})
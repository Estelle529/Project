// pages/order/order.js
import { Order } from '../order/order-model.js';
import { Cart } from '../cart/cart-model.js';
import { Address } from '../../utils/address.js';
import { Integral } from '../../utils/integral.js'

var order = new Order();
var cart = new Cart();
var address = new Address();
var integral = new Integral();
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
        var productsArr;
        this.data.amount = options.amount;
        this.data.id = options.id;
        this.data.from = options.from;
        if (this.data.from == 'cart') {
            productsArr = cart.getCartDataFromLocal(true);
            this.setData({
                productsArr: productsArr,
                amount: options.amount,
                orderStatus: 0
            })
            address.getAddress((res) => {
                this._bindAddressInfo(res);
            })
        } else {
            var that = this;
            order.getOrderDetail(that.data.id, (res) => {
                //订单信息绑定到前台显示出来
                that.setData({
                    basicInfo: {
                        orderTime: res.data.create_time,
                        orderNo: res.data.order_no
                    },
                    orderStatus: res.data.status,
                    addressInfo: {
                        name: res.data.snap_address.name,
                        mobile: res.data.snap_address.mobile,
                        totalDetail: address.setAddressInfo(res.data.snap_address)
                    },
                    productsArr: res.data.snap_items,
                    amount: res.data.total_price
                })
            })
        }
    },
    //新增地址
    editAddress: function() {
        var that = this;
        wx.chooseAddress({
            success: function(res) {
                var addressInfo = {
                    name: res.userName,
                    mobile: res.telNumber,
                    totalDetail: address.setAddressInfo(res)
                }
                that._bindAddressInfo(addressInfo);

                //保存地址到服务器中
                address.submitAddress(res, (flag) => {
                    if (!flag) {
                        that.showTips('操作提示', '地址信息更新失败！')
                    }
                })
            }
        })
    },
    /*
     * 提示窗口
     * params:
     * title - {string}标题
     * content - {string}内容
     * flag - {bool}是否跳转到 "我的页面"
     */
    showTips: function(title, content, flag) {
        wx.showModal({
            title: title,
            content: content,
            showCancel: false,
            success: function(res) {
                if (flag) {
                    wx.switchTab({
                        url: '/pages/my/my'
                    });
                }
            }
        });
    },

    //绑定地址信息
    _bindAddressInfo: function(addressInfo) {
        this.setData({
            addressInfo: addressInfo
        })
    },

    pay: function() {
        if (!this.data.addressInfo) {
            this.showTips('下单提示', '请填写您的收货地址');
            return;
        }
        if (this.data.orderStatus == 0) {
            this._firstTimePay();
        } else {
            this.oneMoresTimePay();
        }
    },

    //第一次支付
    _firstTimePay: function() {
        //生成产生订单需要的数据
        var orderInfo = [],
            productInfo = this.data.productsArr,
            order = new Order();
        for (var i = 0; i < productInfo.length; i++) {
            orderInfo.push({
                product_id: productInfo[i].id,
                count: productInfo[i].counts
            });
        }
        var that = this;
        //生成订单
        order.doOrder(orderInfo, (res) => {
            //订单生成成功
            if (res.data.pass) {
                that.data.id = res.data.order_id;
                that.data.fromCartFlag = false;
                //删除购物车对应的商品
                that.deleteCartData(orderInfo);
                this.payProgress();
            } else {
                //订单生成失败
                wx.showModal({
                    title: '订单创建失败',
                    content: '您购买的商品库存不足，请返回购物车修改',
                    success(res) {
                        if (res.confirm) {
                            wx.navigateBack();
                        }
                    }
                })
            }
        })
    },
    oneMoresTimePay: function() {
        this.payProgress();
    },
    payProgress: function() {
        var that = this;
        //获取当前积分
        that.data.integral = wx.getStorageSync('integral');
        if (that.data.integral >= that.data.amount) {
            //用积分进行支付
            wx.showModal({
                title: '积分兑换',
                content: '您当前积分' + that.data.integral + '分，您确定花费' + that.data.amount +
                    '积分兑换这些植物？',
                success: function(res) {
                    //点击了确定
                    if (res.confirm) {
                        that.successPay(that.data.id);
                    } else if (res.cancel) {
                        that.failPay();
                    }
                }
            });
        } else {
            wx.showModal({
                title: '积分兑换',
                content: '您当前积分' + that.data.integral + '分，不能兑换价值' + that.data.amount + '商品',
                success: function(res) {
                    //点击了确定
                    if (res.confirm) {
                        that.failPay();
                    } else if (res.cancel) {
                        that.failPay();
                    }
                }
            });
        }
    },
    successPay: function(id) {
        //扣除积分，上传服务器以及更新缓存
        var currentIntegral = this.data.integral - this.data.amount
        integral.upDataSerAndSto(currentIntegral);
        wx.navigateTo({
                url: '../result/success'
            })
            //更新订单状态
        order.upDateStatus(id, 2);
    },
    failPay: function(id) {
        wx.navigateTo({
                url: '../result/fail'
            })
            //更新订单状态 因为数据库中生成的订单状态本来就是1，支付失败也是1，所以就不用更新了
            //order.upDateStatus(id, 1);
    },

    deleteCartData: function(orderInfo) {
        for (var i = 0; i < orderInfo.length; i++) {
            var ids = [];
            ids.push(orderInfo[i].product_id);
            cart.delete(ids);
        }
    },
    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function() {
        var that = this;
        if (that.data.id) {
            //根据这个ID查询订单
            order.getOrderDetail(that.data.id, (res) => {
                //订单信息绑定到前台显示出来
                that.setData({
                    basicInfo: {
                        orderTime: res.data.create_time,
                        orderNo: res.data.order_no
                    },
                    orderStatus: res.data.status,
                    addressInfo: {
                        name: res.data.snap_address.name,
                        mobile: res.data.snap_address.mobile,
                        totalDetail: address.setAddressInfo(res.data.snap_address)
                    },
                    productsArr: res.data.snap_items,
                    amount: res.data.total_price
                })
            })
        }
    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide: function() {

    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload: function() {

    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh: function() {

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function() {

    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage: function() {

    }
})
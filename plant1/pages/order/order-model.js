import { Base } from '../../utils/base.js'

class Order extends Base {

    constructor() {
        super();
        this._storageKeyName = 'newOrder';


    }

    /*生成订单*/
    doOrder(orderInfo, callback) {
        var that = this;
        var allParams = {
            url: 'order',
            type: 'post',
            data: { products: orderInfo },
            sCallBack: function(res) {
                callback && callback(res);
            },
            eCallBack: function() {

            }
        };
        this.request(allParams);
    }

    //更新订单状态
    upDateStatus(id, status) {
        var allParams = {
            url: 'order/update',
            type: 'post',
            data: {
                id: id,
                status: status
            },
            sCallBack: function(res) {
                // that.execSetStorageSync(true);
            },
            eCallBack: function() {

            }
        };
        this.request(allParams);
    }

    //查询订单详情
    getOrderDetail(id, callback) {
            var allParams = {
                url: 'order/' + id,
                type: 'get',
                sCallBack: function(res) {
                    // that.execSetStorageSync(true);
                    callback && callback(res);
                },
                eCallBack: function() {

                }
            };
            this.request(allParams);
        }
        //查询订单简略信息
    getBrieflyOrder(pageIndex, callback) {
            var allParams = {
                url: 'order/by_user/' + pageIndex,
                type: 'get',
                sCallBack: function(res) {
                    callback && callback(res);
                },
                eCallBack: function() {

                }
            };
            this.request(allParams);
        }
        /*本地缓存，保存/更新*/
        // execSetStorageSync(data) {
        //     wx.setStorageSync(this._storageKeyName, data);
        // }


}
export { Order };
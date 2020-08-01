import { Config } from '../utils/config.js';
class Base {
    constructor() {
        this.baseRequestUrl = Config.restUrl;
    }

    //http 请求类, 当noRefech为true时，不做未授权重试机制
    request(params, noRefetch) {
        var that = this,
            url = this.baseRequestUrl + params.url;
        if (!params.type) {
            params.type = 'get';
        }
        /*不需要再次组装地址*/
        if (params.setUpUrl == false) {
            url = params.url;
        }
        wx.request({
            url: url,
            data: params.data,
            method: params.type,
            header: {
                'content-type': 'application/json',
                'token': wx.getStorageSync('token')
            },
            success: function(res) {

                // 判断以2（2xx)开头的状态码为正确
                // 异常不要返回到回调中，就在request中处理，记录日志并showToast一个统一的错误即可
                var code = res.statusCode.toString();
                var startChar = code.charAt(0);
                if (startChar == '2') {
                    params.sCallBack && params.sCallBack(res);
                } else {
                    if (code == '401') {
                        if (!noRefetch) {
                            that._refetch(params);
                        }
                    }
                    that._processError(res);
                    params.eCallBack && params.eCallBack(res.data);
                }
            },
            fail: function(err) {
                //wx.hideNavigationBarLoading();
                that._processError(err);
                // params.eCallback && params.eCallback(err);
            }
        });
    }

    _processError(err) {
        console.log(err);
    }

    _refetch(param) {
        var token = new Token();
        token.getTokenFromServer((token) => {
            this.request(param, true);
        });
    }

    getDataSet(event, key) {
        return event.currentTarget.dataset[key];
    }

    getStarNewData(serverData) {
        var productsArr = [];
        for (var i in serverData) {

            // 取出植物的星星的第一个数
            var num = serverData[i].star.toString().substring(0, 1);

            //根据第一个数生成对应的数组
            var starArr = [];
            for (var j = 0; j < 5; j++) {
                if (j < num) {
                    starArr.push(1);
                } else {
                    starArr.push(0);
                }
            }

            //生成每个植物的信息
            var product = {
                id: serverData[i].id,
                main_img_url: serverData[i].main_img_url,
                name: serverData[i].name,
                starArr: starArr
            };

            // 生成植物信息数组
            productsArr.push(product);
        }
        return productsArr;
    }


}
export { Base };
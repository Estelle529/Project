import { Config } from "config.js";

class Integral {
    constructor() {
        this.integralUrl = Config.restUrl + 'integral';
    }

    /*获取用户积分*/
    getUserIntegral() {
        wx.request({
            url: this.integralUrl,
            method: 'get',
            header: {
                'content-type': 'application/json',
                'token': wx.getStorageSync('token')
            },
            success: function(res) {
                wx.setStorageSync('integral', res.data.user_integral);
            }
        })
    }

    /*设置用户积分*/
    setUserIntegral(integral) {
        wx.request({
            url: this.integralUrl,
            method: 'POST',
            data: {
                "integral": integral
            },
            header: {
                'content-type': 'application/json',
                'token': wx.getStorageSync('token')
            },
            success: function(res) {

            }
        })
    }

    /*更新缓存,更新服务器*/
    upDataSerAndSto(currentIntegral) {
        wx.setStorageSync('integral', currentIntegral);
        this.setUserIntegral(currentIntegral);
    }

}
export { Integral };
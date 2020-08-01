import { Base } from "../../utils/base.js"
class Home extends Base {
    constructor() {
        super();
    }

    /*首页轮播图 */
    getBannerData(id, callback) {
        var params = {
            url: 'banner/' + id,
            sCallBack: function(res) {
                callback && callback(res);
            }
        };
        this.request(params);
    }

    /*首页主题*/
    getThemeData(callback) {
        var params = {
            url: 'theme?ids=1,2,3',
            sCallBack: function(res) {
                callback && callback(res);
            }
        };
        this.request(params);
    }

    /*首页部分商品*/
    getProductorData(callback) {
        var params = {
            url: 'product/hot',
            sCallBack: function(res) {
                callback && callback(res);
            }
        };
        this.request(params);
    }

    /*首页部分植物文化*/
    getStoryData(callback) {
        var params = {
            url: 'story/recent',
            sCallBack: function(res) {
                callback && callback(res);
            }
        };
        this.request(params);
    }

    /*首页分页误区*/
    getPageMis(currentIndex, callback) {
        var params = {
            url: 'misundstand/' + currentIndex,
            sCallBack: function(res) {
                callback && callback(res);
            }
        };
        this.request(params);
    }
}
export { Home };
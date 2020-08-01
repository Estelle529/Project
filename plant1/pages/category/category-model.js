/**
 * Created by jimmy on 17/2/26.
 */
import { Base } from '../../utils/base.js';

class Category extends Base {
    constructor() {
        super();
    }

    /*获得所有分类*/
    getCategoryType(callback) {
            var params = {
                url: 'category/all',
                sCallBack: function(res) {
                    callback && callback(res);
                }
            };
            this.request(params);
        }
        /*获得某种分类的商品*/
    getProductsByCategory(id, callback) {
        var params = {
            url: 'category/' + id,
            sCallBack: function(res) {
                callback && callback(res);
            }
        };
        this.request(params);
    }
}

export { Category };
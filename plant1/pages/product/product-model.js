/**
 * Created by jimmy on 17/2/26.
 */

import { Base } from '../../utils/base.js';

class Product extends Base {
    constructor() {
        super();
    }
    getDetailInfo(id, callback) {
        var params = {
            url: 'product/' + id,
            sCallBack: function(res) {
                callback && callback(res);
            }
        };
        this.request(params);
    }
};

export { Product };
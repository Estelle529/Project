import { Base } from "../../utils/base.js";
class Like extends Base {
    constructor() {
        super();
    }
    getLikeData(ids, callback) {
        var params = {
            url: 'product/getLike?ids=' + ids,
            sCallBack: function(res) {
                callback && callback(res);
            }
        };
        this.request(params);
    }
}
export { Like };
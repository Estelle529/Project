import { Base } from '../../utils/base.js';

class Story extends Base {
    constructor() {
        super();
    }
    getDetailInfo(id, callback) {
        var params = {
            url: 'story/' + id,
            sCallBack: function(res) {
                callback && callback(res);
            }
        };
        this.request(params);
    }
};

export { Story };
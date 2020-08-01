import { Base } from '../../utils/base.js';

class Search extends Base {
    constructor() {
        super();
    }

    searchData(key, callback) {
        var params = {
            url: 'search?key=' + key,
            sCallBack: function(res) {
                callback && callback(res);
            }
        };
        this.request(params);
    }
}

export { Search };
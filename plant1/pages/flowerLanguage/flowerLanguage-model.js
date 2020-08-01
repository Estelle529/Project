import { Base } from '../../utils/base.js';

class Language extends Base {
    constructor() {
        super();
    }

    getLanguage(flower, callback) {
        var params = {
            url: 'language?flower=' + flower,
            sCallBack: function(res) {
                callback && callback(res);
            }
        };
        this.request(params);
    }
}

export { Language };
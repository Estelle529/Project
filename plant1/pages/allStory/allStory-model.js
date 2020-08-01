import { Base } from '../../utils/base.js';

class AllStory extends Base {
    constructor() {
        super();
    }
    getAllStory(callback) {
        var params = {
            url: 'story/all',
            sCallBack: function(res) {
                callback && callback(res);
            }
        };
        this.request(params);
    }
};

export { AllStory };
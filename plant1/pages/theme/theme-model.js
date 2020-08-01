/**
 * Created by jimmy on 17/2/26.
 */
import {Base} from '../../utils/base.js';

class Theme extends Base{
    constructor(){
        super();
    }

    /*商品*/
    getProductorData(id,callback){
        var params={
            url: 'theme/'+id,
            sCallBack:function(res){
                callback && callback(res);
            }
        };
        this.request(params);
    }
};

export {Theme};
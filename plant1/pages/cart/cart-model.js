import { Base } from "../../utils/base.js";
class Cart extends Base {
    constructor() {
        super();
        this._storageKeyName = 'cart';
    }

    // 加入到购物车
    // 如果之前没有这样的商品，则直接添加一条新的记录，数量为count
    // 如果有则直接将数量加上count
    // @parameter
    // item-{obj}商品对象
    // counts-{int}商品数目
    add(item, counts) {
        var cartData = this.getCartDataFromLocal();
        var isHasInfo = this._isHasThatOne(item.id, cartData);
        if (isHasInfo.index == -1) {
            item.counts = counts;
            item.isSelectStatus = true;
            cartData.push(item);
        } else {
            cartData[isHasInfo.index].counts += counts;
        }
        wx.setStorageSync(this._storageKeyName, cartData);
    }

    // 从缓存中读取购物车数据
    getCartDataFromLocal(flag) {
        var res = wx.getStorageSync(this._storageKeyName);
        if (!res) {
            res = [];
        }
        if (flag) {
            var newRes = [];
            for (let i = 0; i < res.length; i++) {
                if (res[i].isSelectStatus) {
                    newRes.push(res[i]);
                }
            }
            return newRes;
        }
        return res;
    }

    _isHasThatOne(id, arr) {
        var item;
        var result = { index: -1 };
        for (let i = 0; i < arr.length; i++) {
            item = arr[i];
            if (item.id == id) {
                result = {
                    index: i,
                    data: item
                };
                break
            }
        }
        return result;
    }


    /*
     *获得购物车商品总数目,包括分类和不分类
     * param:
     * flag - {bool} 是否区分选中和不选中
     * return
     * counts1 - {int} 不分类
     * counts2 -{int} 分类
     */
    getCartTotalCounts(flag) {
        var data = this.getCartDataFromLocal(),
            counts1 = 0,
            counts2 = 0;
        for (let i = 0; i < data.length; i++) {
            if (flag) {
                if (data[i].selectStatus) {
                    counts1 += data[i].counts;
                    counts2++;
                }
            } else {
                counts1 += data[i].counts;
                counts2++;
            }
        }
        return {
            counts1: counts1,
            counts2: counts2
        };
    };

    _changeCounts(id, counts) {
        var cartData = this.getCartDataFromLocal();
        var hasInfo = this._isHasThatOne(id, cartData);
        if (hasInfo.index != -1) {
            if (hasInfo.data.counts > 1) {
                cartData[hasInfo.index].counts += counts;
            }
        }
        wx.setStorageSync(this._storageKeyName, cartData);
    }

    addCounts(id) {
        this._changeCounts(id, 1);
    }

    cutCounts(id) {
        this._changeCounts(id, -1);
    }

    delete(ids) {
        if (!(ids instanceof Array)) {
            ids = [ids];
        }
        var cartData = this.getCartDataFromLocal();
        for (let i = 0; i < cartData.length; i++) {
            var hasInfo = this._isHasThatOne(ids[i], cartData);
            if (hasInfo.index != -1) {
                cartData.splice(hasInfo.index, 1)
            }
        }
        wx.setStorageSync(this._storageKeyName, cartData);
    }

    saveStorage(data) {
        wx.setStorageSync(this._storageKeyName, data);
    }
}
export { Cart };
// pages/discover/discover.js
import { Search } from '../discover/discover-model.js'
var search = new Search();
import { Like } from '../like/like-model.js'
var like = new Like();
Page({

    /**
     * 页面的初始数据
     */
    data: {
        isSearch: false,
        inputValue: '',
        loadingHidden: true,
        isHavaRes: true
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(options) {

    },
    //输入框聚焦
    focusTap: function() {
        this.setData({
            isSearch: true
        })
    },
    //输入框失去焦点
    getValue: function(event) {
        this.setData({
            inputValue: event.detail.value
        })
    },
    //点击叉叉取消
    cancelTap: function(event) {
        this.setData({
            inputValue: '',
            isSearch: false,
            plantsMes:'',
            searchCount: 0
        })
    },
    //点击搜索的时候
    searchTap: function() {
        var that = this;
        that.mainMethord(that.data.inputValue);
    },
    //点击热词进行搜索时
    hotSearch: function(event) {
        var key = search.getDataSet(event, 'text');
        this.setData({
            isSearch: true,
            inputValue: key
        })
        this.mainMethord(key);
    },
    //搜索的主要方法
    mainMethord: function(keyWord) {
        var that = this;
        search.searchData(keyWord, (res) => {
            //获取的服务器数据格式为{
            //res1:[];
            //res2:[];
            //res3:[];
            //res4:[];
            //res5:[];
            //}

            //这个方法是处理数据，最终得到植物的id数组
            var plantIds = that.processData(res.data);
            if (plantIds.length > 0) {
                var params = plantIds.join(',');
                //获取植物的信息
                that.getPlants(params);
                //是否有搜索结果
                that.setData({
                    isHavaRes: true,
                    searchCount: plantIds.length
                })
            } else {
                that.setData({
                    isHavaRes: false
                })
            }
        })
    },
    //根据已经获得的植物id，向服务器请求植物的数据
    getPlants: function(params) {
        var that = this;
        //因为获取收藏植物信息时，就是传入的几个植物的id,这个地方也是，所以直接拿来用
        like.getLikeData(params, (res) => {
            that.setData({
                plantsMes: res.data
            })
        });
    },

    //处理数据
    processData: function(data) {
        var arr1 = [],
            arr2 = [],
            arr3 = [],
            arr4 = [],
            arr5 = [];
        //获取五个数组
        var data1 = data.res1;
        var data2 = data.res2;
        var data3 = data.res3;
        var data4 = data.res4;
        var data5 = data.res5;
        //因为data1中id就是植物的id，所以获取id
        if (data1.length > 0) {
            arr1 = this.getIdArr(data1);
        }
        //因为data2，3，4中product_id是植物的id，所以获取product_id
        if (data2.length > 0) {
            arr2 = this.getProductIdArr(data2);
        }
        if (data3.length > 0) {
            arr3 = this.getProductIdArr(data3);
        }
        if (data4.length > 0) {
            arr4 = this.getProductIdArr(data4);
        }
        if (data5.length > 0) {
            arr5 = this.getProductIdArr(data5);
        }
        //将获取的五个包含植物id的数组拼接起来
        var ids = arr1.concat(arr2).concat(arr3).concat(arr4).concat(arr5);
        //拼接起来之后可能有重复值，所以去掉重复项
        var idsArr = [];
        //遍历老数组；
        ids.forEach(function(val) {
            //检测老数组中的元素，如果新数组中存在就不添加，不存在才添加;
            if (idsArr.indexOf(val) == -1) {
                //去新数组中查找元素索引值，如果为-1就是没有；
                idsArr.push(val);
            }
        });
        //返回植物的id数组
        return idsArr;
    },

    //通过product_id获取植物的id
    getProductIdArr: function(data) {
        var arr = [];
        data.forEach(element => {
            arr.push(element.product_id);
        });
        return arr;
    },
    //通过id获取植物的id
    getIdArr: function(data) {
        var arr = [];
        data.forEach(element => {
            arr.push(element.id);
        });
        return arr;
    },

    //跳转到植物详情页
    onProductTap: function(event) {
        var id = search.getDataSet(event, 'id');
        wx.navigateTo({
            url: '../product/product?id=' + id
        })
    },
    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady: function() {

    },
})
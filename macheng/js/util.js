document.write("<script language='javascript' src='./js/zepto.js'></script>");
const baseurl = 'http://macheng.yongmiaonet.com/';
const aftermethod = function (res, successcallback, toastcallback, failcallback) {
    if (res.code == 0) {
        successcallback(res);
    }
    if (res.code == 1) {
        toastcallback(res.msg);
    }
    if (res.code == 2) {
        failcallback();
    }
}
const format = function (shijianchuo) {
    var time = new Date(shijianchuo * 1000);
    var y = time.getFullYear();
    var m = time.getMonth() + 1;
    var d = time.getDate();
    var h = time.getHours();
    var mm = time.getMinutes();
    var s = time.getSeconds();
    return y + '年' + difften(m) + '月' + difften(d) + '日 ';
}

function difften(value) {
    return value >= 10 ? value : '0' + value;
}

//设置cookie
function setCookie(c_name, value, expiredays) {
    var exdate = new Date()
    exdate.setDate(exdate.getDate() + expiredays)
    document.cookie = c_name + "=" + escape(value) +
        ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString())
}

//取回cookie
function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=")
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1
            c_end = document.cookie.indexOf(";", c_start)
            if (c_end == -1) c_end = document.cookie.length
            return unescape(document.cookie.substring(c_start, c_end))
        }
    }
    return ""
}

//判断当前时间戳跟传进来的时间戳
function checktime(starttemp, endtemp) {
    var now = Date.parse(new Date());
    if (now > endtemp * 1000 || now < starttemp * 1000) {
        return false;
    } else {
        return true;
    }
}
(function() {
    if (typeof WeixinJSBridge == "object" && typeof WeixinJSBridge.invoke == "function") {
        handleFontSize();
    } else {
        if (document.addEventListener) {
            document.addEventListener("WeixinJSBridgeReady", handleFontSize, false);
        } else if (document.attachEvent) {
            //IE浏览器，非W3C规范
            document.attachEvent("onWeixinJSBridgeReady", handleFontSize);
        }
    }
    function handleFontSize() {
        // 设置网页字体为默认大小
        WeixinJSBridge.invoke('setFontSizeCallback', { 'fontSize' : 0 });
        // 重写设置网页字体大小的事件
        WeixinJSBridge.on('menu:setfont', function() {
            WeixinJSBridge.invoke('setFontSizeCallback', { 'fontSize' : 0 });
        });
    }
})()
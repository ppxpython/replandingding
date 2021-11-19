var app = getApp()
Page({
    data: {},
    onLoad() {
        dd.setNavigationBar({
            title: '首页',
            // backgroundColor: '#108ee9',
            success() {

            },
            fail() {

            },
        });
        dd.httpRequest({
            method: "GET", // 指定请求方式
            url: "https://oapi.dingtalk.com/gettoken?appkey=dingxnekgrt25iu957z2&appsecret=snE3ft62OFlJ1faouVfKrc9Q4wulv_s2c9tRu4_xzM9H1aZRZxek4MLAh8Hr8C2v" + app.globalData.access_token, // 指定请求虚拟接口地址
            header: {
                "Content-Type": "application/json;charset=utf-8"
            },
            dataType: 'json',


            success(res) {

                var res_data = res.data;
                if (res_data.errcode == 0) {
                    console.log("获取到token")
                    app.globalData.access_token = res.data.access_token
                    console.log(app.globalData.access_token)
                } else {
                    // 接口响应：失败非法请求
                }
            },
            fail(err) {
                // 网络或服务错误
                console.log(err)
            }
        });
    },
    pay() {
        dd.scan({
            type: 'qr',
            success: (res) => {
                dd.alert({ title: res.code });
            },
        });
    }
});
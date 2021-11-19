var app = getApp()
Page({
    data: {
        

    },
    onLoad() {
        dd.setNavigationBar({
            title: '预案管理',
        });
        dd.httpRequest({
            method: "GET", // 指定请求方式
            url: "https://oapi.dingtalk.com/gettoken?appkey=dingxnekgrt25iu957z2&appsecret=snE3ft62OFlJ1faouVfKrc9Q4wulv_s2c9tRu4_xzM9H1aZRZxek4MLAh8Hr8C2v" + app.globalData.access_token, // 指定请求虚拟接口地址
            header: {
                "Content-Type": "application/json;charset=utf-8"

                // "App-Token": "$2a$10$tHg4z756GePcQoCN9P8gF.ZOJ.xLhfEmXT3E3PlADibW84Dfh6tpi"   // 设置对应虚拟接口应用请求Token
            },
            dataType: 'json',


            success(res) {

                var res_data = res.data;

                // console.log(res_data) 
                // console.log(planid)
                if (res_data.errcode == 0) {
                    console.log("获取到token")
                    app.globalData.access_token = res.data.access_token


                    console.log(app.globalData.access_token)

                    //  temp_all_user_detail.push("1")

                    // 接口响应：正确成功请求，若有定义响应data数据，即为：res_data.data
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
});
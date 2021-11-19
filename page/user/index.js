// Page({
//   data: {},
//   onLoad() {},
// });
// pages/user/user.js
const app = getApp();


Page({
    data: {
        userid: "",
        name: "",
        avatar: "",
        mobile: "",
        user: {},



        currentState: 0
    },
    onLoad: function(options) {
        dd.setNavigationBar({
            title: '个人中心',

        });
        var that = this
        dd.getAuthCode({
            success: function(res) {
                console.log(res.authCode)
                app.apiPost("https://oapi.dingtalk.com/topapi/v2/user/getuserinfo?access_token=" + app.globalData.access_token, {
                    "code": res.authCode
                }, function(data) {
                    console.log(data.result)

                    app.apiPost("https://oapi.dingtalk.com/topapi/v2/user/get?access_token=" + app.globalData.access_token, {
                            "language": "zh_CN",
                            "userid": data.result.userid
                        }, function(data) {
                            console.log(data)
                            that.setData({
                                userid: data.result.userid,
                                name: data.result.name,
                                mobile: data.result.mobile,
                                avatar: data.result.avatar



                            })
                        })
                        // dd.setStorage({
                        //     key: 'user',
                        //     data: {
                        //         userId: data.result.userid,
                        //         name: data.result.name,
                        //     }
                        // });
                })


                /*{
                    authCode: 'hYLK98jkf0m' //string authCode
                }*/
            },
            fail: function(err) {}
        });

    },

    onShareAppMessage() {
        return {
            title: '数字化应急预案系统分享',
            desc: '观念与分享',
            path: "page/home/index"
        }
    },
    pay() {
        dd.scan({
            type: 'qr',
            success: (res) => {
                dd.alert({ title: res.code });
            },
        });
    }






})
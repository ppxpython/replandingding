let app = getApp();
//内网穿透工具介绍:
// http://10.160.152.115:8080/
// https://open-doc.dingtalk.com/microapp/debug/ucof2g
//替换成开发者后台设置的安全域名
let domain = "http://" + app.globalData.server_host + ":8080";
let url = domain + '/login';
Page({
    data: {
        corpId: 'ding09759551fd13594cf5bf40eda33b7ba',
        authCode: '',
        userId: '',
        userName: '',
        hideList: true,
    },
    loginSystem() {
        dd.showLoading();
        dd.getAuthCode({
            success: (res) => {
                this.setData({
                        authCode: res.authCode
                    })
                    //dd.alert({content: "step1"});
                dd.httpRequest({
                    url: url,
                    method: 'POST',
                    data: {
                        authCode: res.authCode
                    },
                    dataType: 'json',
                    success: (res) => {
                        // dd.alert({content: "step2"});
                        console.log('success----', res)
                        let userId = res.data.result.userId;
                        let userName = res.data.result.userName;
                        dd.setStorage({
                            key: 'currentCity',
                            data: {
                                userId: userId,
                                userName: userName,
                                authCode: res.authCode,
                            },
                            success: function() {
                                dd.alert({ content: '写入成功' });
                            }
                        });

                        this.setData({
                            userId: userId,
                            userName: userName,
                            hideList: false
                        })
                        dd.navigateTo({ url: '/page/home/index' })
                    },
                    fail: (res) => {
                        console.log("httpRequestFail---", res)
                        dd.alert({ content: JSON.stringify(res) });
                    },
                    complete: (res) => {
                        dd.hideLoading();
                    }
                });
            },
            fail: (err) => {
                // dd.alert({content: "step3"});
                dd.alert({
                    content: JSON.stringify(err)
                })
            }
        })

    },
    onLoad() {
        dd.setNavigationBar({
            title: '登陆',

        });

        let _this = this;

        this.setData({
            corpId: app.globalData.corpId
        })

        //dd.alert({content: "step1"});


    }
})
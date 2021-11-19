
//获取用户openid
module.exports.getOpenid = function getOpenid() {
    var app = getApp();
    //判断用户缓存数据
    // if (app.globalData.openid == null) {
    //     dd.login({
    //         success: function (res) {
    //             app.apiPost(app.apiList.getOpenid, {
    //                 code: res.code
    //             }, function (data) {
    //                 app.globalData.openid = data.openid;
    //                 dd.setStorageSync('openid', data.openid);
    //             });
    //         },
    //         fail: function (res) {
    //             console.log('微信登录请求失败')
    //         },
    //         // complete: function (res) {}
    //     })
    // }
}

//获取用户信息授权
module.exports.authorize = function authorize() {
  
    dd.authorize({
        scope: 'scope.userInfo',
        success() {
            console.log('authorize success(scope.userInfo)');
        },
        fail() {
            console.log('authorize fail(scope.userInfo)');
        }
    })
}

//判断用户是否已有简历
module.exports.isHaveResume = function isHaveResume(){
    var app = getApp();
    if (app.globalData.isHaveResume == null){
        app.apiPost(app.apiList.isHaveResume, {
            openid: app.globalData.openid
        }, function (data) {
            if (data.code == 1) {     
                var x,z,
                    work_history =[],
                    edu_history=[],
                    expected_pos=[];
                for (x in data.ret.work_history) {
                    work_history.push(JSON.parse(data.ret.work_history[x]));
                }
                
                for (z in data.ret.edu_history) {
                    edu_history.push(JSON.parse(data.ret.edu_history[z]));
                }
                data.ret.base_info = JSON.parse(data.ret.base_info);
                data.ret.expected_pos = JSON.parse(data.ret.expected_pos);

                data.ret.work_history = work_history;
                data.ret.edu_history = edu_history;
                
                app.globalData.isHaveResume = data.ret;

            } else if (data.code == 0) {   // 没有简历
                app.globalData.isHaveResume = null;
            } else {
                app.alert(data.alertMsg)
            }
        })
    }
    
}

//收集、判断系统信息
module.exports.checkSystemInfo = function checkSystemInfo() {
    // 已使用的API
    //------------------
    // dd.getStorageSync v0
    // dd.setStorageSync v0
    //------------------
    // dd.login v0
    // dd.request v0
    // dd.requestPayment v0
    //------------------
    // dd.showModal v0
    // dd.showLoading v1.1.0
    // dd.hideLoading v1.1.0
    //------------------
    // dd.navigateTo v0
    // dd.navigateBack v0
    // dd.reLaunch v1.1.0
    var app = getApp();
    var info = dd.getSystemInfoSync();
    console.log(info);
    //检查微信兼容API
    if (dd.showLoading && dd.hideLoading && dd.reLaunch) {
    } else {
        app.alert('当前微信版本过低，无法使用该功能，请升级到最新微信版本后重试。');
    }
    app.globalData.systemInfo = info;
}

//检查页面层级
module.exports.checkPage = function checkPage() {
    var e = getCurrentPages();
    var l = e.length;
    console.log('当前页面层级' + l);
    console.log(e);
}


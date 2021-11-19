var util = require('/util/util.js')
    //app.js
App({
    onLaunch: function(options) {
        var logs = dd.getStorageSync({ key: 'logs' }).data || []
        logs.unshift(Date.now())
        dd.setStorageSync({ key: 'logs', data: logs })

        console.log('小程序开始运行');
        this.init();
        console.log('App Launch', options);
        // console.log('getSystemInfoSync', dd.getSystemInfoSync());
        console.log('SDKVersion', dd.SDKVersion);
    },
    onShow: function() {
        console.log('在此小程序中');
    },
    onHide: function() {
        console.log('不在此小程序中');
    },
    onError: function(msg) {
        console.log('有错误:' + msg);
    },
    config: {
        //接口host
        host: 'https://oapi.dingtalk.com/topapi',
        //版本
        version: "0.5.0",
        //app名称
        channel: '应急预案系统'
    },
    init: function() {},
    globalData: {
        access_token: '', //token
     //全局
        flow_list: null,
        add_flow_dep_id_list: [], //预案流程页面
        plan_id: null, //  预案id
        flow_id: null, // 流程id
        dep_user: [], //全部人员
        systemInfo: null,
        flow_name: null,
        flow_content: null,
        dd_dep_id_str: null,
        server_host: "10.160.150.52",
        // server_host: "172.18.97.253",
        flow: null,
        user_name_list: [],
        //设备信息
        systemInfo: null,
        //微信用户唯一id
        //微信用户信息
        userInfo: null,
        //判断用户是否已有简历
        isHaveResume: null,
        //用于职位详情绑定数据
        positionDetail: null,
        //  用户登录状态
        token: false

    },
    apiGet: function(url, data, callback) {
        dd.httpRequest({
            url: url,
            data: data,
            method: 'GET',
            dataType: 'json',
            header: { "Content-Type": "application/json;charset=utf-8" },
            success(res) {
                callback(res.data)
            },
            fail(res) {
                console.log(url + '请求失败')
            },
            complete(res) {
                console.log(url + '请求完成')
                    // console.log(res);
            }
        })
    },
    apiPost: function(url, data, callback) {
        dd.httpRequest({
            url: url,
            data: data,
            method: 'POST',
            dataType: 'json',
            header: { "Content-Type": "application/json;charset=utf-8" },
            success: function(res) {
                callback(res.data)
            },
            fail: function(res) {
                console.log(url + '请求失败')
            },
            complete: function(res) {
                console.log(url + '请求完成')
                console.log(res);
            }
        })
    },

    apiDelete: function(url, data, callback) {
        dd.httpRequest({
            // url: this.config.host + url,
            url: url,
            data: data,
            method: 'DELETE',
            dataType: 'json',
            header: { "Content-Type": "application/json;charset=utf-8" },
            success: function(res) {
                callback(res.data)
            },
            fail: function(res) {
                console.log(url + '请求失败')
            },
            complete: function(res) {
                console.log(url + '请求完成')
                console.log(res);
            },
        })

    },

    loading: function() {
        dd.showLoading({
            title: '加载中...',
            mask: true
        });
    },
    hideloading: function() {
        dd.hideLoading();
    },
    util
})
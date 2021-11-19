//index.js
//获取应用实例
var app = getApp()
Page({
    data: {

        title: '',
        flow: {},
        interval: 5000,
        duration: 2000,
        flow_list: [],
        flowlist: [],
        flow_user: [],
        load: false,
        sty: 0,
        score: '#fff5df',
    },
    setLoad: function(e) {
        this.setData({
            load: !this.data.load
        })
    },
    onLoad(option) {
        dd.setNavigationBar({
            title: '启动预案',

        });
        dd.confirm({
            title: '启动确认',
            content: '启动预案',
            cancelColor: '#999',
            confirmText: '确认',
            confirmColor: '#4990E2',
            cancelText: '取消',
            success: function(res) {
                if (res.confirm) {
                    app.apiPost("http://" + app.globalData.server_host + ":1337/plan-events", {
                        "status": "1",
                        "plan": app.globalData.plan_id
                    }, function(data) {
                        console.log(data)
                        dd.setStorageSync({ key: "plan_event_id", data: data.id })

                    })
                    // app.apiPost("http://" + app.globalData.server_host + ":1337/plans/" + app.globalData.plan_id, {
                    //     "status": "1",
                    // }, function(data) {
                    //     console.log(data)
                    // })

                } else if (res.cancel) {
                    console.log('用户点击取消')
                    setTimeout(function() {
                        dd.navigateBack({
                            url: '../replanList/replanList'
                        })
                    }, 800);
                }
            }
        })
        
        var that = this
        var title = option.title
        that.setData({
            title: title,
            flow_list: JSON.parse(option.flow)
        })
        this.flow = JSON.parse(option.flow)
        app.globalData.flow = JSON.parse(option.flow)
        app.apiGet("http://" + app.globalData.server_host + ":1337/plans/" + app.globalData.plan_id, {},
            function(data) {
                console.log("显示")
                console.log(data.plan_deps)
                console.log(data)
                console.log(JSON.parse(option.flow))
            })

    },
    onReady() {
        var that = this
    },
    onShow() {
        // 页面显示
    },
    onHide() {
        // 页面隐藏
    },
    onUnload() {
        // 页面被关闭
    },
    onTitleClick() {
        // 标题被点击
    },
    onPullDownRefresh() {
        // 页面被下拉
    },
    onReachBottom() {
        // 页面被拉到底部
    },

    //事件处理函数
    bindViewTap(e) {
        dd.navigateTo({
            url: '../replan/replan?id=' + e.target.dataset.id
        })
    },
    sleep: function(d) {
        for (var t = Date.now(); Date.now() - t <= d;);
    },
    ding: function(str) {
        app.apiPost("https://oapi.dingtalk.com/topapi/user/listid?access_token=" + app.globalData.access_token, {
            "dept_id": str
        }, function(data) {
            console.log(data.result.userid_list)
            console.log("开始参数检查")
            console.log(app.globalData.flow_name)
            console.log(app.globalData.flow_content)
            dd.createDing({
                users: data.result.userid_list, //默认选中用户工号列表；类型: Array<String>
                corpId: "ding09759551fd13594cf5bf40eda33b7ba0", // 类型: String
                alertType: 2, // 钉发送方式 0:电话, 1:短信, 2：应用内；类型 Number
                alertDate: { "format": "yyyy-MM-dd HH:mm", "value": "2021-04-09 16:38" }, // 非必选，定时发送时间, 非定时DING不需要填写
                type: 1, // 附件类型 1：image, 2：link；类型: Number
                // 非必选
                // 附件信息
                attachment: {
                    images: ["https://www.baidu.com/img/bd_logo1.png?where=super"], // 图片附件, type=1时, 必选；类型: Array<String>
                    image: "https://www.baidu.com/img/bd_logo1.png?where=super", // 链接附件, type=2时, 必选；类型: String    
                    title: "这是一个测试", // 链接附件, type=2时, 必选；类型: String
                    url: "https://www.baidu.com/", // 链接附件, type=2时, 必选；类型 String
                    text: "测试发钉成功" // 链接附件, type=2时, 必选；类型: String
                },

                text: app.globalData.flow_content, // 正文
                bizType: 0, // 业务类型 0：通知DING；1：任务；2：会议；
                success: function(res) {
                    console.log("发送ding成功弄哈")
                },
                fail: function(err) {}
            })
        })

    },
    fasong: function(dd_str) {
        var that = this
        var str = app.globalData.dd_dep_id_str.split(',');
        console.log("这是分割后的")
        console.log(str)
        str.forEach(item => {
            console.log("这是每个dddepid的信息")
            console.log(item)
            that.ding(item)
        });
    },
    score: function(e) {
        //点击按钮，样式改变
        let that = this;
        that.setData({
            sty: 1,
            score: 'rgba(252,178,22, 0.3)'
        });
    },
    userListAction: function(e) {　　
        console.log(`点击了${e.target.dataset.index}`)
        this.setData({
            userCellId: e.target.dataset.index
        })

    }
})
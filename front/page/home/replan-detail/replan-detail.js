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
        load: false
    },

    setLoad: function(e) {
        this.setData({
            load: !this.data.load
        })
    },
    onLoad(option) {
        dd.setNavigationBar({
            title: '预案详情',

        });
        var that = this
        var title = option.title
            // console.log(option.title)
            //  console.log(JSON.parse(option.flow))
        that.setData({
            title: title,
            flow_list: JSON.parse(option.flow)
        })
        this.flow = JSON.parse(option.flow)
            // console.log(option.flow)

        JSON.parse(option.flow).forEach(element => {
            app.globalData.flow_id = element.id
            console.log("这是在循环里面")
            dd.httpRequest({

                url: 'http://' + app.globalData.server_host + ':1337/plan-flows/' + app.globalData.flow_id,
                method: "GET",
                headers: {
                    'Content-Type': 'application/json'
                },
                success(res) {
                    console.log(res.data.plan_flow_users)
                        // var flowlist = JSON.stringify(res.data)
                        // console.log(flowlist)
                    that.setData({
                        flow_user: res.data.plan_flow_users
                    })





                }
            })
        });










    },
    //事件处理函数
    bindViewTap(e) {
        dd.navigateTo({
            url: '../replan/replan?id=' + e.target.dataset.id
        })
    },


})

// Page({
//   data: {
//     title:"",
//     flow:{}
//   },
//   onLoad(option) {
//     var title=option.title
//     console.log(option.title)
//      console.log(JSON.parse(option.flow))
//       console.log(option.id)
//       this.setData({
//            title: title,    
//          })

//   },
// });
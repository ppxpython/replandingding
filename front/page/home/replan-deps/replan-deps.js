var app = getApp()
Page({
    data: {
        load: false
    },
    setLoad: function(e) {
        this.setData({
            load: !this.data.load
        })
    },

    onLoad(option) {
        var that = this
        var plan = JSON.parse(option.plan)
        var id = option.id
            // console.log(plan.plan_deps)
            // console.log(id)
            // var  list=[]
            // for (var i = 0; i < plan.plan_deps.length; i++) {
            //     console.log(plan.plan_deps[i].dep_name)
            //     console.log(plan.plan_deps[i].dd_sub_dep_id)
            //     app.apiPost("https://oapi.dingtalk.com/topapi/user/listsimple?access_token=" + app.globalData.access_token, {
            //         "cursor": 0,
            //         "contain_access_limit": false,
            //         "size": 10,
            //         "order_field": "modify_desc",
            //         "language": "zh_CN",
            //         "dept_id": plan.plan_deps[i].dd_sub_dep_id
            //     }, function(data) {
            //         console.log(data.result.list)
            //         list.push(JSON.stringify(data.result.list)  )
            //     })
            //     setTimeout(function(){  
            //       console.log(list)},2000)



        // }
        // console.log(JSON.stringify(list))
        that.setData({
            deps: plan.plan_deps,
            plan: plan
        })


    },
});
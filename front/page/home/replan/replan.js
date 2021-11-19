 var app = getApp()
 Page({
     data: {
         art: {},
         replanflaw: {},
         plan: {},
         summary: '',
         time: '',
         plan_event: {}



     },
     onReady() {
         // dd.setNavigationBarTitle({
         //   title: '详情页面'
         // })

     },

     onLoad(options) {
         dd.setNavigationBar({
             title: '预案',

         });
         app.globalData.plan_id = options.id
         app.globalData.user_name_list=[]
         var that = this
             // 获取一个预案基本信息
         dd.httpRequest({

             url: 'http://' + app.globalData.server_host + ':1337/plans/' + options.id,
             method: "GET",
             headers: {
                 'Content-Type': 'application/json'
             },
             success(res) {
                 console.log(res)
                 var flowlist = JSON.stringify(res.data.plan_flows)
                 var title = res.data.planName
                 var plan = JSON.stringify(res.data)
                 var summary = res.data.plan_summary
                 var plan_events=res.data.plan_events ;
                 plan_events.forEach(element => {
                   element.created_at= that.rTime(element.created_at)
                 });

                 var ztime = that.rTime(res.data.updated_at)

                 console.log(ztime)

                 that.setData({
                     plan: JSON.stringify(res.data),
                     art: res.data,
                     replanflaw: flowlist,
                     summary: res.data.plan_summary,
                     time: ztime,
                     plan_event:plan_events.reverse()
                    //  res.data.plan_events
                 })
             }
         })
     },
     rTime(date) {
         var json_date = new Date(date).toJSON();
         return new Date(+new Date(json_date) + 8 * 3600 * 1000).toISOString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '')
     },


     delect_replan() {
         var that = this;
         dd.confirm({
             title: '删除确认',
             content: '删除预案后不可撤回，确认删除？',
             cancelText: '取消',
             cancelColor: '#999',
             confirmText: '确认',
             confirmColor: '#4990E2',
             success: function(res) {
                 if (res.confirm) {
                     dd.httpRequest({
                         url: 'http://' + app.globalData.server_host + ':1337/plans/' + app.globalData.plan_id,
                         method: "DELETE",
                         headers: {
                             'Content-Type': 'application/json'
                         },
                         success(res) {
                             console.log("删除预案成功")
                         }
                     })


                     dd.showToast({
                             title: '删除成功',
                             icon: 'success',
                             duration: 500
                         })
                         //返回上一个页面
                     setTimeout(function() {
                         dd.navigateTo({
                             url: '../replanList/replanList'
                         })
                     }, 800);
                 } else if (res.cancel) {
                     console.log('用户点击取消')
                 }
             }
         })








     }


 })
 var app = getApp()
 Page({
     data: {
         load: false,
         flow: [],
         user_name_info: []
     },
     setLoad: function(e) {
         this.setData({
             load: !this.data.load
         })
     },
     onLoad(option) {
         var that = this
         var flow_id = option.id
         dd.setStorageSync({ key: "do_flow_id", data: option.id })
         console.log(flow_id)
         app.apiGet('http://' + app.globalData.server_host + ':1337/plan-flows/' + option.id, {}, function(data) {
             console.log(data.dd_dep_id_str)
             that.setData({
                 flow: data
             })
             app.globalData.flow_content = data.flow_content
             app.globalData.dd_dep_id_str = data.dd_dep_id_str
             var str = app.globalData.dd_dep_id_str.split(',');
             dd.setStorageSync({ key: "flow_userid_list", data: JSON.stringify(str) })
                 // console.log(str)
                 //  var user_name_info = new Array();
             var user_name_list = [];
             var namestr = ""
           
             for (let i = 0; i < str.length; i++) {
                 app.apiPost("https://oapi.dingtalk.com/topapi/v2/user/get?access_token=" + app.globalData.access_token, {
                     "language": "zh_CN",
                     "userid": str[i]
                 }, function(user_data) {
                     console.log(user_data.result.name)
                     app.globalData.user_name_list.push(user_data.result.name)
                         // user_name_info.push(data.result.name)     
                 })
                 //  user_name_info.push(user_data)
             }
             console.log(app.globalData.user_name_list)
             that.setData({
                 user_name_info: app.globalData.user_name_list
             })
         })

     },
     change: function() {
         var that = this
             // dd.ready(function() {
             // console.log(app.globalData.dep_user)
             // 选取所有人员名单
         app.apiPost("https://oapi.dingtalk.com/topapi/user/listsimple?access_token=" + app.globalData.access_token, {
                 "cursor": 0,
                 "contain_access_limit": false,
                 "size": 100,
                 "order_field": "modify_desc",
                 "language": "zh_CN",
                 "dept_id": "1"
             }, function(data) {
                 if (data.errcode == 0) {
                     console.log("预案列表显示成功")
                     console.log(data.result)
                     that.setData({
                             all_user_list: data.result.list
                         })
                         //  var testlist=JSON.stringify(res.data.result.list)
                         //  console.log(testlist)
                 }

             }

         )


     },
     onSubmit(e) {
         console.log('onSubmit', e);
         my.alert({
             content: `你选择的人员id有是 ${e.detail.value.libs.join(',')}`,

         });
         console.log("选的人员")
         console.log(e)
         dd.setStorageSync({
             key: 'put_dep_user_list',
             data: e.detail.value.libs
         });
     },

     onReset(e) {
         console.log('onReset', e);
     },
     onChange(e) {
         console.log(e);
     },
     call() {
         dd.createDing({
             users: JSON.parse(dd.getStorageSync({ key: "flow_userid_list", }).data), //默认选中用户工号列表；类型: Array<String>
             corpId: "ding09759551fd13594cf5bf40eda33b7ba0", // 类型: String
             alertType: 2, // 钉发送方式 0:电话, 1:短信, 2：应用内；类型 Number
             alertDate: { "format": "yyyy-MM-dd HH:mm", "value": "2021-04-09 16:38" }, // 非必选，定时发送时间, 非定时DING不需要填写
             type: 1, // 附件类型 1：image, 2：link；类型: Number
             // 非必选
             text: app.globalData.flow_content, // 正文
             bizType: 0, // 业务类型 0：通知DING；1：任务；2：会议；
             success: function(res) {
                 console.log("发送ding成功弄哈")
                 console.log(res)
                 app.apiPost("http://" + app.globalData.server_host + ":1337/flow-events", {
                     "status": "0",
                     "flow_content": res.text,
                     "plan_flow": dd.getStorageSync({ key: "do_flow_id" }).data,
                     "plan_event": dd.getStorageSync({ key: "plan_event_id" }).data
                 }, function(data) {
                     console.log(data)
                 })
             },
             fail: function(err) {

             }
         })
         dd.navigateBack({

         })


     }
 });
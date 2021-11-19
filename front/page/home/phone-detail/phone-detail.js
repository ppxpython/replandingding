 var app = getApp()
 Page({
     data: {
         user_detail: []
     },
     onLoad(options) {
         dd.setNavigationBar({
             title: '通讯录个人信息',

         });
         var that = this
          dd.setStorageSync({ key: "take_user_id", data:options.id })
             // 获取个人信息
         dd.httpRequest({
             method: "POST", // 指定请求方式
             url: "https://oapi.dingtalk.com/topapi/v2/user/get?access_token=" + app.globalData.access_token, // 指定请求虚拟接口地址
             header: {
                 "Content-Type": "application/json;charset=utf-8"

                 // "App-Token": "$2a$10$tHg4z756GePcQoCN9P8gF.ZOJ.xLhfEmXT3E3PlADibW84Dfh6tpi"   // 设置对应虚拟接口应用请求Token
             },
             dataType: 'json',

             data: {
                 "language": "zh_CN",
                 "userid": options.id
             },
             success(res) {

                 var res_data = res.data;

                 // console.log(res_data) 
                 // console.log(planid)
                 if (res_data.errcode == 0) {
                     console.log("显示一下个人信息")
                     console.log(res.data.result)

                     that.setData({
                         user_detail: res.data.result
                     })
                     var testlist = JSON.stringify(res.data.result)
                     console.log(testlist)

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
     //聊天
     take:function(){
       dd.openChatByUserId({
    userId: dd.getStorageSync({ key:"take_user_id"}).data, // 用户的userid
    success: res => {
      console.log(res)

    },
    fail: err =>{
        dd.alert({
            content:JSON.stringify(err)
        })
    }
})
     },
     //打电话
     call:function(){
       var list=[]
       list.push(dd.getStorageSync({ key:"take_user_id"}).data)
       console.log(list)
       dd.callUsers({
    users:  list, //用户列表，工号
    success:function(res){   
    },
    fail:function(err){
    }
})
     }
 });
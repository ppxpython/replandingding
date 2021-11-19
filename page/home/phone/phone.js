var app = getApp();

Page({
    data: {
        list: [],
        userIds: '',
        all_user_detail: [],
        user_detail: {}
    },
    onLoad() {
        dd.setNavigationBar({
            title: '通讯录',

        });
        var that = this
            //       //测试一下修改
            //   dd.httpRequest({
            //       method: "POST",    // 指定请求方式
            //       url: "https://oapi.dingtalk.com/topapi/v2/user/update?access_token="+app.globalData.access_token,  // 指定请求虚拟接口地址
            //       header: {
            //           "Content-Type": "application/json;charset=utf-8"

        //           // "App-Token": "$2a$10$tHg4z756GePcQoCN9P8gF.ZOJ.xLhfEmXT3E3PlADibW84Dfh6tpi"   // 设置对应虚拟接口应用请求Token
        //       },
        //   dataType: 'json',

        //        data: {   
        //  "userid":"manager1637",
        //  "dept_id_list":[476954085,
        //             1,
        //             476991116,
        //             476965115]

        // },
        //       success(res) {
        //         var res_data = res.data;

        //             console.log(res_data) 
        //     // console.log(planid)
        //           if(res_data.errcode == 0){
        //            console.log("这是修改个人信息的成功提示")
        //              console.log(res_data)

        //               // 接口响应：正确成功请求，若有定义响应data数据，即为：res_data.data
        //           }else{
        //               // 接口响应：失败非法请求
        //           }
        //       },
        //       fail(err){
        //           // 网络或服务错误
        //           console.log(err)
        //       }
        //   });




        // 选取所有人员名单
        dd.httpRequest({
            method: "GET", // 指定请求方式
            url: "https://oapi.dingtalk.com/topapi/user/listsimple?access_token=" + app.globalData.access_token, // 指定请求虚拟接口地址
            header: {
                "Content-Type": "application/json;charset=utf-8"

                // "App-Token": "$2a$10$tHg4z756GePcQoCN9P8gF.ZOJ.xLhfEmXT3E3PlADibW84Dfh6tpi"   // 设置对应虚拟接口应用请求Token
            },
            data: {
                "cursor": 0,
                "contain_access_limit": false,
                "size": 10,
                "order_field": "modify_desc",
                "language": "zh_CN",
                "dept_id": "1"
            },
            dataType: 'json',

            success(res) {
                var res_data = res.data;

                console.log(res_data)
                    // console.log(planid)
                if (res_data.errcode == 0) {
                    console.log("chengg")
                    console.log(res_data.result)
                    that.setData({

                            list: res.data.result.list
                        })
                        //  var testlist=JSON.stringify(res.data.result.list)
                        //  console.log(testlist)
                    var temp_all_user_detail = new Array;
                    res.data.result.list.forEach(item => {
                        console.log("这是在循环中" + item.userid)
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
                                "userid": item.userid
                            },
                            success(res) {
                                var res_data = res.data;

                                // console.log(res_data) 
                                // console.log(planid)
                                if (res_data.errcode == 0) {
                                    console.log("显示一下个人信息")
                                    console.log(res.data.result)
                                    app.globalData.dep_user.push(JSON.stringify(res.data.result))

                                    //        that.setData({

                                    //    user_detail:  res.data.result
                                    //  })

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

                    });

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


        console.log(app.globalData.dep_user)


    }

    //     zhang(){
    //           dd.choosePhonebook({
    //   multiple: Boolean, //是否多选： true多选 false单选； 默认true
    //   maxUsers: Number, //人数限制，当multiple为true才生效，可选范围1-1500
    //   limitTips:"xxx", //超过人数限制的提示语可以用这个字段自定义
    //   title : "选择钉钉联系人", // 如果你需要修改选人页面的title，可以在这里赋值
    //   success:function(res){
    //     //onSuccess将在选人结束，点击确定按钮的时候被回调
    //     console.log(res)
    //     /* res结构
    //     [{
    //       "name": "张三", //姓名
    //       "mobile": "110", //用户手机号
    //       "avatar": 'RSDFS', //用户头像id
    //      },
    //      ...
    //     ]
    //     */      
    //   },
    //   fail:function(err){
    //   } 
    // })

    // }

})










// Page({
//   data: {},
//   onLoad() {

//     
//   },
//  });
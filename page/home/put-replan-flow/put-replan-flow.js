var app=getApp()
Page({
  data: {
    flow_content:'',
    flow_name:''
  },
  onLoad(option) {
    var that=this
    var id=option.id
    dd.setStorageSync({ key: "put_flow_id", data:option.id })
    app.apiGet("http://"+app.globalData.server_host+":1337/plan-flows/"+option.id,{}
    ,function(data){
      console.log(data)
      that.setData({
        flow_content:data.flow_content,
        flow_name:data.flow_name

      })
    
    })
  },
  //修改数据库预案流程
  submitSchoolTap:function(){
    console.log(dd.getStorageSync({key: "put_flow_content"}).data)
 console.log(dd.getStorageSync({key: "put_flow_name"}).data)
 app.apiPost("http://localhost:1337/plan-flows/"+dd.getStorageSync({key: "put_flow_id"}).data,
 {
   flow_name:dd.getStorageSync({key: "put_flow_name"}).data,
   flow_content:dd.getStorageSync({key: "put_flow_content"}).data

 },function(data){
   console.log(data)
 }
 )
  dd.reLaunch({
                     url: '/page/home/replan/replan?id='+app.globalData.plan_id,
                                })

 
  },
//删除流程
removeSchoolTap:function(){
   var that = this;
        dd.confirm({
            title: '删除确认',
            content: '删除后不可撤回，确认删除？',
            cancelText: '取消',
            cancelColor: '#999',
            confirmText: '确认',
            confirmColor: '#4990E2',
            success: function(res) {
                if (res.confirm) {
                    app.apiDelete("http://localhost:1337/plan-flows/"+dd.getStorageSync({key: "put_flow_id"}).data,
  {},function(data){
    console.log(data)
  })
                    dd.showToast({
                            title: '删除成功',
                            icon: 'success',
                            duration: 500
                        })
                        //返回上一个页面
                    setTimeout(function() {
                        dd.reLaunch({
                     url: '/page/home/replan/replan?id='+app.globalData.plan_id,
                                })
                    }, 800);
                } else if (res.cancel) {
                    console.log('用户点击取消')
                }
            }
        })
   

},

   //流程内容
    flowTapTap: function(e) {
        var eValueLen = e.detail.value.length,
            eValue = e.detail.value;

        this.setData({
                flow_contentLen: eValueLen,
                flow_content: eValue
            })
            //将这条数据存放到缓存中
        dd.setStorageSync({ key: "put_flow_content", data: e.detail.value })
    },
    //流程名称
    // flow_nameTap: function(e){
    //   this.setData({
    //     flow_name: e.detail.value
    //   })
    // },
    // 流程名称聚焦
    schoolfocus: function() {
        this.setData({
            school: ""
        });
    },

    // 流程名称失焦
    schoolblur: function(e) {
        this.setData({
            school: "输入流程名称",
            flow_name: e.detail.value
        });
        dd.setStorageSync({
            key: 'put_flow_name',
            data: e.detail.value
        })


    },
    //专业名称
    // flow_contentTap: function(e){
    //   this.setData({
    //     flow_content: e.detail.value
    //   })
    // },
    // 流程内容（信息发送模板）聚焦
    majorfocus: function() {
        this.setData({
            major: ""
        });
    },
    // 工作内容矢焦
    majorblur: function(e) {
        var eValueLen = e.detail.value.length,
            eValue = e.detail.value;

        this.setData({
                flow_contentLen: eValueLen,
                flow_content: eValue
            })
            //将这条数据存放到缓存中
        dd.setStorageSync({ key: "put_flow_content", data: e.detail.value })
    },


});

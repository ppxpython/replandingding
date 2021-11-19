var app=getApp()
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
      var that=this
        var id = option.id
        console.log(id)
        app.apiPost("https://oapi.dingtalk.com/topapi/user/listsimple?access_token=" + app.globalData.access_token, {
            "cursor": 0,
            "contain_access_limit": false,
            "size": 10,
            "order_field": "modify_desc",
            "language": "zh_CN",
            "dept_id": option.id
        }, function(data) {
          // if(data.errcode=0){
              console.log(data)
            console.log(data.result.list)
              that.setData({
            userlist:data.result.list,
            
        })


          // }
         

        })




    }




});
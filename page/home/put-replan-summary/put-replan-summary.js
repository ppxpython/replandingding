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
        var plan_summary = option.plan_summary
        var id = option.id
        console.log(plan_summary)
        that.setData({
          plan_summary:option.plan_summary
        })
        
        },
         plan_summaryTap: function(e) {
        var eValueLen = e.detail.value.length,
            eValue = e.detail.value;

        this.setData({
                plan_summaryLen: eValueLen,
                plan_summary: eValue
            })
            //将这条数据存放到缓存中
        dd.setStorageSync({
            key: 'plan_summary',
            data: e.detail.value

        });
        // app.globalData.add_plan_summary = eValue
    },
    // 工作内容聚焦
    plan_summaryfocus: function() {
        this.setData({
            plan_summary: this.data.plan_summary
        })
    },
    // 工作内容矢焦
    plan_summaryblur: function() {
        this.setData({
            plan_summary: "这里是预案描述"
        })
    },
    change:function(){
       console.log(dd.getStorageSync({key:"plan_summary"}).data)
       app.apiPost("http://"+app.globalData.server_host+":1337/plans/"+app.globalData.plan_id,
       {
    "plan_summary":  dd.getStorageSync({key:"plan_summary"}).data  
},function(data){
  console.log(data)
  
})
 dd.reLaunch({
                                    url: '/page/home/replan/replan?id='+app.globalData.plan_id,
                                })
 

    }
         
       


  
});
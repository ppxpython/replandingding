 var app = getApp();
 Page({
     /**
      * 页面的初始数据
      */
     data: {
         resumeWorkList: null,
         isHaveResume: true,
         planid: null
     },

     /**
      * 生命周期函数--监听页面加载
      */
     onLoad: function(options) {
         dd.setNavigationBar({
             title: '预案组织',

         });
         console.log(options);
         if (options.type == 0) {
             this.setData({
                 isHaveResume: false
             })
         }
         if (app.globalData.isHaveResume !== null) {
             console.log("有数据")
             console.log(app.globalData.dept_list)
             this.setData({
                 resumeWorkList: app.globalData.dept_list
                     // resumeWorkList: app.globalData.isHaveResume.work_history,

             })
         }


     },


     //编辑单个工作经历
     editWorkListTap: function(event) {
         //添加和修改是同一个方法，所以判断eduId是否值，有值是修改，没值是添加
         //workid为创建钉钉子部门时的id
         var workid = event.currentTarget.dataset.workid;

         if (workid === undefined) {
             console.log(workid + "添加预案");
             dd.navigateTo({
                 url: '/page/item/edit-add-replan-organization-detail/edit-add-replan-organization-detail',
             })
         } else {
             console.log(workid + "修改预案");
             dd.navigateTo({
                 url: '/page/item/edit-add-replan-organization-detail/edit-add-replan-organization-detail?workid=' + workid
             })
         }

     },
     //下一步
     subNext: function(event) {
         // console.log(app.globalData.isHaveResume);
         // console.log(app.globalData.isHaveResume.work_history)
         if (app.globalData.dept_list != "undefined") {
             if (app.globalData.dept_list instanceof Array) {
                 if (app.globalData.dept_list.length != 0) {
                     dd.navigateTo({
                         url: '/page/item/edi-add-replan-flow/edi-add-replan-flow?type=0',
                     })
                 } else {
                     dd.alert({
                         title: "生态圈提示您",
                         content: "请填写预案信息"
                     });
                 }
             } else {
                 dd.alert({
                     title: "生态圈提示您",
                     content: "请填写预案信息"
                 });
             }

         }
     },
     //上一步
     subPre: function() {
         dd.navigateBack({

         })
     }

 })
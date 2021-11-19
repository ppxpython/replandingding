// pages/edit-resume-edu/edit-resume-edu.js
var app = getApp();
Page({

    data: {
        isHaveResume: true,
        resumeEduList: null,

    },
    onLoad: function(options) {
        dd.setNavigationBar({
            title: '预案流程',

        });
        if (options.type == 0) {
            console.log("为空")
            this.setData({
                isHaveResume: false
            })
        }
        // else if (app.globalData.isHaveResume !== null) 
        else {
            console.log("有数据")
            console.log(app.globalData.flow_list)
            this.setData({

                resumeEduList: app.globalData.flow_list,

            })
        }


    },

    //编辑单个教育经历
    editEduListTap: function(event) {
        //添加和修改是同一个方法，所以判断eduId是否值，有值是修改，没值是添加
        var eduid = event.currentTarget.dataset.eduid;
        if (eduid === undefined) {
            dd.navigateTo({
                url: '/page/item/edi-add-replan-flow-detail/edi-add-replan-flow-detail'
            })
        } else {
            dd.navigateTo({
                url: '/page/item/edi-add-replan-flow-detail/edi-add-replan-flow-detail?eduid=' + eduid
            })
        }

    },
    //完成
    subOver: function() {
        if (app.globalData.flow_list != "undefined") {
            if (app.globalData.flow_list instanceof Array) {
                if (app.globalData.flow_list.length != 0) {
                    dd.confirm({
                        title: '预案创建成功',
                        content: '已成功创建预案',
                        cancelText: '再改改',
                        cancelColor: '#999',
                        confirmText: '去首页',
                        confirmColor: '#4990E2',
                        success: function(res) {
                            if (res.confirm) {

                                dd.reLaunch({
                                    url: '/page/home/index',
                                })

                            } else if (res.cancel) {
                                console.log('用户点击取消')
                            }
                        }
                    })

                } else {
                    dd.alert({
                        title: "生态圈提示您",
                        content: "请填写流程信息"
                    });
                }
            } else {
                dd.alert({
                    title: "生态圈提示您",
                    content: "请填写流程信息"
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
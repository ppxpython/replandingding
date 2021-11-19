// pages/edit-resume-base/edit-resume-base.js
var app = getApp();
Page({
    /**
     * 页面的初始数据
     */
    data: {
        planName: '', //预案姓名
        planid: '',
        plan_summary: '',
        user: "请输入预案名称", // 姓名placeholder
    },
    /*
     生命周期函数--监听页面加载
     */
    onLoad: function(options) {
        dd.setNavigationBar({
            title: '添加预案名称',

        });
        //检查页面层级
        app.util.checkPage(); // undefinde app没写方法   
    },
    // 姓名获取焦点
    namefocus: function(e) {
        this.setData({
            user: ""
        })
    },
    //姓名失去焦点
    blurfocus: function(e) {
        this.setData({
                user: "输入预案名称",
                planName: e.detail.value
            })
            //将这条数据存放到缓存中
        dd.setStorageSync({
            key: 'add_plan_name',
            data: e.detail.value,
        });
        // app.globalData.add_plan_name = e.detail.value
    },
    //工作内容
    plan_summaryTap: function(e) {
        var eValueLen = e.detail.value.length,
            eValue = e.detail.value;

        this.setData({
                plan_summaryLen: eValueLen,
                plan_summary: eValue
            })
            //将这条数据存放到缓存中
        dd.setStorageSync({
            key: 'add_plan_summary',
            data: e.detail.value

        });
        // app.globalData.add_plan_summary = eValue
    },
    // 工作内容聚焦
    plan_summaryfocus: function() {
        this.setData({
            plan_summary: ""
        })
    },
    // 工作内容矢焦
    plan_summaryblur: function() {
        this.setData({
            plan_summary: "这里是预案描述"
        })
    },
    // 上传文件
    uploud: function() {
//       dd.uploadFile({
//   url: 'http://'+app.globalData.server_host+'/:1377',
//   fileType: 'image',
//   fileName: 'file',
//   filePath: '...',
//   success: (res) => {
//     dd.alert({
//       content: '上传成功'
//     });
//   },
// });

        dd.uploadAttachmentToDingTalk({
            image: { multiple: true, compress: false, max: 9, spaceId: "4636363405" },
            space: { spaceId: "4636363405", isCopy: 1, max: 9 },
            file: { spaceId: "4636363405", max: 1 },
            types: ["photo", "camera", "file", "space"], //PC端仅支持["photo","file","space"]
            success: (res) => {
                console.log(res)


            },
            fail: (err) => {
                dd.alert({
                    content: JSON.stringify(err)
                })
            }
        })

    },
        backIndex:function(){
       dd.reLaunch({
                 url: '/page/home/index',
                                })

    },
 

    //保存
    submitResumeBaseTap: function() {
        this.setResumeBaseInfoFun();
        if ((this.data.planName == "" || this.data.plan_summary == "")) {
            dd.alert({
                title: '生态圈提示您',
                content: '填写完所有信息',
            });

        } else if (this.data.planName || this.data.plan_summary) {

            dd.showToast({
                title: '保存成功！',
                icon: 'success',
                duration: 500
            })
            this.setResumeBaseInfoFun();
            //更新上一级页面
            var pages = getCurrentPages();
            var curPage = pages[pages.length - 2];
            curPage.setData({
                resumeBaseInfo: this.data

            });
            //返回上一个页面
            setTimeout(function() {
                dd.navigateBack({})
            }, 800);
        }
    },
    //预案基本信息
    setResumeBaseInfoFun: function() {
        if (this.data.planName == '' || this.data.planName == undefined) {
            app.alert('预案名称不能为空！')
            return false;
        }
        // console.log(app.globalData.userInfo.avatarUrl);
        let content = {
            planName: this.data.planName,
            plan_summary: this.data.plan_summary
        };
        console.log("这是缓存中的数据")
            // console.log(dd.getStorageSyncSync({
            //         key: 'add_plan_name',
            //     }).data)
            //创建预案相关的预案父部门
        app.apiPost("https://oapi.dingtalk.com/topapi/v2/department/create?access_token=" + app.globalData.access_token, {
            "name": dd.getStorageSync({
                key: 'add_plan_name',
            }).data,
            "parent_id": 478631737,
            "create_dept_group": true
        }, function(data) {
            console.log(data);
            console.log("方法调用成功")
            if (data.errcode == 0) {
                console.log("成功创建预案父部门")
                    //将这条数据存放到缓存中
                dd.setStorageSync({
                    key: 'add_DD_plan_id',
                    data: data.result.dept_id,
                });
                // app.globalData.add_plan_dd_dep_id = data.result.dept_id
                // console.log(app.globalData.add_plan_dd_dep_id)
                app.apiPost("http://"+app.globalData.server_host+":1337/plans", {
                    "planName": dd.getStorageSync({ key: 'add_plan_name' }).data,
                    "dd_plan_dep_id": dd.getStorageSync({ key: 'add_DD_plan_id' }).data,
                    "plan_summary": dd.getStorageSync({ key: 'add_plan_summary' }).data
                }, function(data) {
                    console.log("成功存入数据库预案父部门")
                    dd.setStorageSync({
                        key: 'add_plan_id',
                        data: data.id,
                    });
                    // app.globalData.add_plan_id = data.id
                })
            } else {
                dd.alert(data.alertMsg);
            }
        })
    },
    onShow: function() {},
    //返回首页
    // backIndewx: function() {
    //     dd.switchTab({ // 跳转到**页面并且关闭其他页面
    //     })
    // },
    //下一步
    subNext: function(e) {
        //TODO:判断返回的状态
        if ((this.data.planName == "")) {
            dd.alert({
                title: '生态圈提示您',
                content: '请输入预案名称',
            });
        }
        if ((this.data.plan_summary == "")) {
            dd.alert({
                title: '生态圈提示您',
                content: '请输入预案描述',
            });
        } else if (this.data.planName) {

            var s = this.setResumeBaseInfoFun();
            dd.navigateTo({
                url: '/page/item/edit-add-replan-organization/edit-add-replan-organization?type=0',
            })

        }
    }
})
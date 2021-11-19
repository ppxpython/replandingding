// pages/edit-resume-edu-detail/edit-resume-edu-detail.js
var app = getApp();
Page({
    /**
     * 页面的初始数据
     */
    data: {
        content_id: '',
        isadd: false,
        school: "输入流程名称",
        major: "输入流程内容",
        dd_dep_id_list: [],
        load: false,
        flow_content: '',
        flow_contentLen: '',
          all_user_list: []
    },
    /**
     * 生命周期函数--监听页面加载
     */
    setLoad: function(e) {
        this.setData({
            load: !this.data.load
        })
    },
    //输入预案流程名，预案信息(短信内容)，人员
    onLoad: function(option) {
        var that = this
            //获取参数，如果没有就是添加
        var eduId = option.eduid;
        dd.setStorageSync({
            key: 'add_flow_id',
            data: option.eduid,
        });

        if (eduId != undefined) {

            dd.setNavigationBar({
                title: '添加预案流程',

            });
            var resumeEduList = app.globalData.flow_list;
            for (var i = 0; i < resumeEduList.length; i++) {
                if (eduId == resumeEduList[i].id) {
                    this.setData({
                        content_id: resumeEduList[i].id,
                        flow_name: resumeEduList[i].flow_name,
                        flow_content: resumeEduList[i].flow_content,
                    });
                }
            }
        } else {
            dd.setNavigationBar({
                title: '修改预案流程',

            });
            this.setData({
                isadd: true,
            })
        }


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
            content: `你选择的人员id有是 ${e.detail.value.libs.join(', ')}`,

        });
        console.log("选的人员")
        console.log(e.detail.value.libs)
        dd.setStorageSync({
            key: 'dep_user_list',
            data: e.detail.value.libs
        });
    },

    onReset(e) {
        console.log('onReset', e);
    },
    onChange(e) {
        console.log(e);
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
        dd.setStorageSync({ key: "add_flow_content", data: e.detail.value })
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
            key: 'add_flow_name',
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
        dd.setStorageSync({ key: "add_flow_content", data: e.detail.value })
    },



    // 流程内容名称失焦
    // majorblur: function(e) {
    //     this.setData({
    //         major: "输入流程内容",
    //         flow_content: e.detail.value
    //     });
    //     dd.setStorageSync({ key: "add_flow_content", data: e.detail.value })
    // },



    //保存详情
    setResumeEduDetailFun: function() {
        var that = this;

        if (this.data.flow_name == '' || this.data.flow_name == undefined) {
            dd.alert('请填写预案流程名称');
            return false;
        }

        if (this.data.flow_content == '' || this.data.flow_content == undefined) {
            dd.alert('请填写预案流程');
            return false;
        }

        let content = {
            flow_name: this.data.flow_name,
            flow_content: this.data.flow_content,



        }
        if (this.data.isadd) {
            //思路：获取到人员列表id，通过钉钉选人员，写入数据库flow——user中，
            //跳出循环，通过userid定义一个flow-userid列表方便之后和流程表建立连接
            //思路：先添加流程然后存储流程id
            //2将流程id加入dep部门中关联起来
            var list = dd.getStorageSync({ key: "dep_user_list" }).data
            var mystr = ""
            var list = list.map(String)

            for (var i = 0; i < list.length; i++) {
                if (i == 0) {
                    mystr = list[i]
                } else {
                    mystr = mystr + "," + list[i]
                }
            }
            console.log(mystr)
            app.apiPost("http://" + app.globalData.server_host + ":1337/plan-flows", {
                "flow_name": dd.getStorageSync({ key: "add_flow_name" }).data,
                "plan": dd.getStorageSync({ key: "add_plan_id" }).data,
                "flow_content": dd.getStorageSync({ key: "add_flow_content" }).data,
                "dd_dep_id_str": mystr
            }, function(data) {
                console.log("添加流程到数据库成功")
                console.log(data)
                dd.setStorageSync({ key: "add_flow_id", data: data.id })

            })
            console.log("检查一下参数")
                //显示
            app.apiGet("http://" + app.globalData.server_host + ":1337/plans/" + dd.getStorageSync({ key: "add_plan_id" }).data, {},
                function(data) {
                    console.log(data.plan_flows)
                    console.log("显示预案流程列表")
                    app.globalData.flow_list = data.plan_flows
                    console.log(app.globalData.flow_list)
                    var pages = getCurrentPages();
                    var curPage = pages[pages.length - 1];
                    var curPagePre = pages[pages.length - 2];
                    curPage.setData({
                        resumeEduList: app.globalData.flow_list
                    });
                    //更新上上一级页面
                    curPagePre.setData({
                        resumeEduList: app.globalData.flow_list
                    });







                })


        } else {
            //修改

            console.log("检查一下参数")
            console.log(this.data.flow_content)
            console.log(this.data.flow_name)
            app.apiPost("http://" + app.globalData.server_host + ":1337/plan-flows/" + dd.getStorageSync({ key: "add_flow_id" }).data, {
                    "flow_content": this.data.flow_content,
                    "flow_name":this.data.flow_name,
                    "dd_dep_id_str": mystr
                }, function(data) {
                    console.log("显示数据库修改成功")
                    console.log(data)

                }),

                //显示
                app.apiGet("http://" + app.globalData.server_host + ":1337/plans/" + dd.getStorageSync({ key: "add_plan_id" }).data, {},
                    function(data) {
                        console.log(data.plan_flows)
                        console.log("显示预案流程列表")
                        app.globalData.flow_list = data.plan_flows
                        console.log(app.globalData.flow_list)
                        var pages = getCurrentPages();
                        var curPage = pages[pages.length - 1];
                        var curPagePre = pages[pages.length - 2];
                        curPage.setData({
                            resumeEduList: app.globalData.flow_list
                        });
                        //更新上上一级页面
                        curPagePre.setData({
                            resumeEduList: app.globalData.flow_list
                        });
                    })
        }

    },
    // change: function() {
    //     //获取到预案的钉钉部门
    //     var that = this
    //     app.apiPost("https://oapi.dingtalk.com/topapi/v2/department/listsub?access_token=" + app.globalData.access_token, {
    //         "dept_id": dd.getStorageSync({ key: "add_DD_plan_id" }).data
    //     }, function(data) {
    //         console.log("显示出来的部门列表哟")
    //         console.log(data.result)
    //         var dep = JSON.stringify(data.result)
    //         that.setData({
    //             dd_dep_id_list: data.result,
    //         })

    //     })


    // },
    // onSubmit(e) {
    //     console.log('onSubmit', e);
    //     my.alert({
    //         content: `你选择的预案部门有是 ${e.detail.value.libs.join(', ')}`,

    //     });
    //     console.log("选的预案部门")
    //     dd.setStorageSync({
    //         key: 'add_dd_dep_id_list',
    //         data: e.detail.value.libs
    //     });

    // },

    // onReset(e) {
    //     console.log('onReset', e);
    // },
    // onChange(e) {
    //     console.log(e);
    // },
    //更新数据
    updataEduDataFun: function(data) {
        var x, edu_history = [];
        for (x in data.ret.edu_history) {
            edu_history.push(JSON.parse(data.ret.edu_history[x]));
        }
        app.globalData.isHaveResume.edu_history = edu_history;
        //更新上一级页面
        var pages = getCurrentPages();
        var curPage = pages[pages.length - 1];
        var curPagePre = pages[pages.length - 2];

        curPage.setData({
            resumeEduList: edu_history
        });
        //更新上上一级页面
        curPagePre.setData({
            resumeEduList: edu_history
        });
    },

    //提交教育信息
    submitSchoolTap: function(e) {
        if (this.data.flow_name == '' || this.data.flow_name == undefined || this.data.flow_content == '' || this.data.flow_content == undefined) {
            dd.alert({
                title: "生态圈提示您",
                content: "请填写完整信息"
            });
        } else {
            this.setResumeEduDetailFun();

            dd.showToast({
                title: '保存成功！',
                icon: 'success',
                duration: 500
            })

            //返回上一个页面
            setTimeout(function() {
                dd.navigateBack({

                })
            }, 800);
        }
    },

    //删除流程详情
    deleteEduDetailFun() {
        var that = this;
        app.apiDelete("http://" + app.globalData.server_host + ":1337/plan-flows/" + dd.getStorageSync({ key: "add_flow_id" }).data, {

        }, function(data) {
            console.log("显示数据库删除成功")
            console.log(data)
                //显示
            app.apiGet("http://" + app.globalData.server_host + ":1337/plans/" + dd.getStorageSync({ key: "add_plan_id" }).data, {},
                function(data) {
                    console.log(data.plan_flows)
                    console.log("显示预案流程列表")
                    app.globalData.flow_list = data.plan_flows
                    console.log(app.globalData.flow_list)
                    var pages = getCurrentPages();
                    var curPage = pages[pages.length - 1];
                    var curPagePre = pages[pages.length - 2];
                    curPage.setData({
                        resumeEduList: app.globalData.flow_list
                    });
                    //更新上上一级页面
                    curPagePre.setData({
                        resumeEduList: app.globalData.flow_list
                    });
                })

        })

    },



    //删除
    removeSchoolTap: function() {
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
                    that.deleteEduDetailFun();
                    dd.showToast({
                            title: '删除成功',
                            icon: 'success',
                            duration: 500
                        })
                        //返回上一个页面
                    setTimeout(function() {
                        dd.navigateBack({

                        })
                    }, 800);
                } else if (res.cancel) {
                    console.log('用户点击取消')
                }
            }
        })
    }

})
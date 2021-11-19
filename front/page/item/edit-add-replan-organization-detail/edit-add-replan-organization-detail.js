// import * as dd from '../../../../../../USER/node_modules/dingtalk-jsapi'// 此方式为整体加载，也可按需进行加载
var app = getApp();
Page({

    data: {
        content_id: '',
        isadd: false, // 删除工作经历
        plan_dep_name: "", // 预案机构名称
        load: false,
        orporatename: "输入预案机构名称",
        position: "如：市场专员",
        all_user_list: []


    },
    setLoad: function(e) {
        this.setData({
            load: !this.data.load
        })
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(option) {
        var that = this
            ///////////////////
        var workId = option.workid;
        dd.setStorageSync({
            key: 'add_DD_dep_id',
            data: option.workid,
        });

        // app.globalData.add_dep_dd_id = option.workid
        if (workId != undefined) {
            dd.setNavigationBar({
                title: '添加预案组织',

            });
            /////////////////
            var workId = option.workid;

            if (workId != undefined) {

                var resumeWorkList = app.globalData.dept_list;
                console.log("这是要在页面显示的列表")
                console.log(resumeWorkList)
                for (var i = 0; i < app.globalData.dept_list.length; i++) {
                    if (workId == resumeWorkList[i].dept_id) {
                        console.log(resumeWorkList[i].name)
                        this.setData({
                            content_id: resumeWorkList[i].dept_id,
                            plan_dep_name: resumeWorkList[i].name,
                        });
                    }

                }
            }
        } else {

            dd.setNavigationBar({
                title: '修改预案组织',

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
    //保存详情
    setResumeWorkDetailFun: function() {
        var that = this;
        if (this.data.plan_dep_name == '' || this.data.plan_dep_name == undefined) {
            dd.alert('请填写预案机构名称');
            return false;
        }
        let content = {
            plan_dep_name: this.data.plan_dep_name,
        }
        if (this.data.isadd) {
            // 添加预案组织数据


            app.apiPost("https://oapi.dingtalk.com/topapi/v2/department/create?access_token=" + app.globalData.access_token, {
                "name": dd.getStorageSync({ key: "add_dep_name" }).data,
                "parent_id": dd.getStorageSync({ key: 'add_DD_plan_id' }).data,
                "create_dept_group": true
            }, function(data) {
                if (data.errcode == 0) {
                    dd.setStorageSync({
                            key: "add_DD_dep_id",
                            data: data.result.dept_id
                        })
                        // app.globalData.add_dep_id = data.result.dept_id
                    console.log("添加预案组织机构成功")
                    console.log(data.result.dept_id)
                        // console.log(app.globalData.add_dep_name)
                        // console.log(app.globalData.add_plan_id)
                        //  var temp_plan_id = parseInt(app.globalData.add_plan_id);
                        //添加预案组织到数据库中
                    app.apiPost("http://" + app.globalData.server_host + ":1337/plan-deps", {
                        "dep_name": dd.getStorageSync({ key: "add_dep_name" }).data,
                        "dd_sub_dep_id": data.result.dept_id,
                        "plan": dd.getStorageSync({ key: "add_plan_id" }).data
                    }, function(data) {
                        console.log("成功存入数据库预案部门")
                        console.log(data)
                        dd.setStorageSync({
                                key: "add_dep_id",
                                data: data.id
                            })
                            //钉钉显示个人信息
                        var list = dd.getStorageSync({ key: 'add_dep_user_list' })
                            // console.log(list.data)
                            // console.log(JSON.stringify)
                        if (list.data != null || list.data != []) {
                            list.data.forEach(element => {
                                console.log("这是钉钉有关人员的额")
                                    // console.log(element)
                                app.apiPost("https://oapi.dingtalk.com/topapi/v2/user/get?access_token=" + app.globalData.access_token, {
                                    "language": "zh_CN",
                                    "userid": element
                                }, function(data) {
                                    console.log("这是其中一个人的信息")
                                    console.log(data.result)
                                    var user_id = data.result.userid
                                    var user_dep_list = data.result.dept_id_list
                                    user_dep_list.push(dd.getStorageSync({ key: "add_DD_plan_id" }).data)
                                    user_dep_list.push(dd.getStorageSync({ key: "add_DD_dep_id" }).data)
                                        // console.log("添加啊后的信息")
                                    var mystr = ""
                                    var list = user_dep_list.map(String)
                                    console.log(list)
                                    for (var i = 0; i < list.length; i++) {
                                        if (i == 0) {
                                            mystr = list[i]
                                        } else {
                                            mystr = mystr + "," + list[i]
                                        }
                                    }
                                    console.log("这是修改之后的字符串")
                                    console.log(mystr)
                                        //添加到钉钉中成功
                                        // console.log(user_dep_list)
                                    app.apiPost("https://oapi.dingtalk.com/topapi/v2/user/update?access_token=" + app.globalData.access_token, {
                                            "userid": user_id,
                                            "dept_id_list": mystr
                                        }, function(data) {
                                            console.log("添加人员部门成功")
                                            console.log(data)
                                        })
                                        // dd.setStorageSync({ key: "add_dep_user_dep_list", data: data.result.dept_id_list })
                                        //添加到数据库中个人信息：名称，电话，userid
                                        // console.log("检查一下参数")
                                        //     //
                                        // var name = data.result.name
                                        // var userid = data.result.userid
                                        // var mobile = data.result.mobile
                                        // dd.setStorageSync({ key: "user_name", data: data.result.name })
                                        // dd.setStorageSync({ key: "dd_user_id", data: data.result.userid })
                                        // dd.setStorageSync({ key: "mobile", data: data.result.mobile })
                                        // app.apiPost("http://"+ app.globalData.server_host + ":1337/plan-dep-users?dd_user_id=" + data.result.userid, {}, function(data) {
                                        //         if (data == null || data == "") {
                                        //             console.log("将个人信息写入数据库中")
                                        //             console.log(dd.getStorageSync({ key: "add_plan_id" }).data)
                                        //             console.log(dd.getStorageSync({ key: "add_dep_id" }).data)
                                        //             app.apiPost("http://"+ app.globalData.server_host + ":1337/plan-dep-users", {
                                        //                 "dep_user_name": dd.getStorageSync({ key: "user_name" }).data,
                                        //                 "dd_user_id": dd.getStorageSync({ key: "dd_user_id" }).data,
                                        //                 "phone": dd.getStorageSync({ key: "mobile" }).data,
                                        //                 "plan_deps": [
                                        //                     dd.getStorageSync({ key: "add_plan_id" }).data,
                                        //                     dd.getStorageSync({ key: "add_dep_id" }).data

                                    //                 ]
                                    //             }, function(data) {
                                    //               console.log("这是在添加时的data")
                                    //                 console.log(data)
                                    //             })

                                    //         } else {
                                    //             console.log("已经存入数据库中只需要修改预案组织即可")

                                    //             console.log(data)
                                    //         }
                                    //         //   app.apiPut("http://"+ app.globalData.server_host + ":1337/plan-dep-users/"+data.id,{})
                                    //         // }


                                    // })
                                    //数据库
                                    // console.log(data.result.name)
                                    // console.log(data.result.userid)
                                    // console.log(data.result.mobile)
                                    // console.log(dd.getStorageSync({ key: "add_plan_id" }).data)
                                    // console.log(dd.getStorageSync({ key: "add_dep_id" }).data)
                                    // app.apiPost("http://"+ app.globalData.server_host + ":1337/plan-dep-users", {
                                    //     "dep_user_name": data.result.name,
                                    //     "dd_user_id": data.result.userid,
                                    //     "phone": data.result.mobile,
                                    //     "plan_deps": [
                                    //         dd.getStorageSync({ key: "add_plan_id" }).data,
                                    //         dd.getStorageSync({ key: "add_dep_id" }).data

                                    //     ]
                                    // }, function(data) {
                                    //     console.log(data)
                                    // })

                                })





                            });
                        }


                      

                        //显示
                        app.apiPost("https://oapi.dingtalk.com/topapi/v2/department/listsub?access_token=" + app.globalData.access_token, {
                            "dept_id": dd.getStorageSync({ key: "add_DD_plan_id" }).data,
                        }, function(data) {
                            if (data.errcode == 0) {
                                console.log("添加时显示组织机构成功")
                                console.log(data)
                                    //  that.updataWorkDataFun(deplists.result);
                                app.globalData.dept_list = data.result
                                    // setStorageSync({
                                    //   key:dep_
                                    // })
                                    // that.updataWorkDataFun(res.data.result);
                                console.log(app.globalData.dept_list)
                                var pages = getCurrentPages();
                                var curPage = pages[pages.length - 1];
                                var curPagePre = pages[pages.length - 2];
                                curPage.setData({
                                    resumeWorkList: app.globalData.dept_list
                                });
                                //更新上上一级页面
                                curPagePre.setData({
                                    resumeWorkList: app.globalData.dept_list
                                });
                            }
                        })
                        dd.setStorageSync({ key: 'add_dep_user_list' }).data = []
                    })

                }
            })


        } else {
            console.log("我要執行修改語句")
            console.log("我要執行修改語句")
                // app.globalData.add_dep_name=this.data.plan_dep_name
                // 修改预案组织数据
            app.apiPost("https://oapi.dingtalk.com/topapi/v2/department/update?access_token=" + app.globalData.access_token, {
                "dept_id": dd.getStorageSync({ key: "add_DD_dep_id" }).data,
                "name": this.data.plan_dep_name,
                "create_dept_group": true
            }, function(data) {
                if (data.errcode == 0) {
                    console.log("修改预案机构成功")
                    console.log(data)
                        //显示
                    app.apiPost("https://oapi.dingtalk.com/topapi/v2/department/listsub?access_token=" + app.globalData.access_token, {
                        "dept_id": dd.getStorageSync({ key: "add_DD_plan_id" }).data,
                    }, function(data) {
                        if (data.errcode == 0) {
                            console.log("显示修改组织机构成功")
                            console.log(data)
                                //  that.updataWorkDataFun(deplists.result);
                            app.globalData.dept_list = data.result
                            console.log(app.globalData.dept_list)
                            var pages = getCurrentPages();
                            var curPage = pages[pages.length - 1];
                            var curPagePre = pages[pages.length - 2];
                            curPage.setData({
                                resumeWorkList: app.globalData.dept_list
                            });
                            //更新上上一级页面
                            curPagePre.setData({
                                resumeWorkList: app.globalData.dept_list
                            });
                        } else {
                            dd.alert(data.alertMsg)
                        }
                    })
                } else {
                    dd.alert(dd.alertMsg)
                }
            })
            app.apiGet("http://" + app.globalData.server_host + ":1337/plan-deps?dd_sub_dep_id=" + dd.getStorageSync({ key: "add_DD_dep_id" }).data, {}, function(data) {
                console.log("这个是数据中查看到部门id以便于修改")
                console.log(data[0].id)
                    // console.log(dd.getStorageSync({ key: "add_dep_name" }).data)
                dd.httpRequest({
                    url: "http://" + app.globalData.server_host + ":1337/plan-deps/" + data[0].id,
                    data: {
                        "dep_name": dd.getStorageSync({ key: "add_dep_name" }).data
                    },
                    method: "POST",
                    header: {
                        "Content-Type": "application/json;charset=utf-8"
                    },
                    dataType: 'json',
                    success(res) {
                        console.log("部门数据库修改成功")
                        console.log(res.data)

                    }



                })

                // app.apiPut("http://"+ app.globalData.server_host + ":1337/plan-deps/" + data[0].id, {
                //     "dep_name": dd.getStorageSync({ key: "add_dep_name" }).data
                // }, function(data) {
                //     console.log("修改蔡成功")
                //     console.log(data)

                // })


            })

        }

    },
    //更新数据
    // updataWorkDataFun: function(data){
    //     var x,work_history =[];
    //     for (x in data.ret.work_history) {
    //         work_history.push(JSON.parse(data.ret.work_history[x]));
    //     }
    //     console.log("这是存放的数据")
    //    console.log(app.globalData.dept_list)
    //     app.globalData.dept_list = work_history;

    //     //更新上一级页面
    //     var pages = getCurrentPages();
    //     var curPage = pages[pages.length - 1];
    //     var curPagePre = pages[pages.length - 2];

    //     curPage.setData({
    //         resumeWorkList: work_history
    //     });
    //     //更新上上一级页面
    //     curPagePre.setData({
    //         resumeWorkList: work_history
    //     });
    // },

    //提交工作信息(保存)
    submitCompanyTap: function(e) {
        if (this.data.plan_dep_name == '') {
            dd.alert({
                title: "生态圈提示您",
                content: "请填写完整信息"
            });
        } else {
            this.setResumeWorkDetailFun();
            dd.showToast({
                title: '保存成功！',
                icon: 'success',
                duration: 500
            });
            // //返回上一个页面
            setTimeout(function() {
                dd.navigateBack({}) // 返回上一页
            }, 800);
        }
    },
    //删除钉钉部门
    deleteWorkDetailFun() {
        var that = this;
        app.apiPost("https://oapi.dingtalk.com/topapi/v2/department/delete?access_token=" + app.globalData.access_token, {
            "dept_id": dd.getStorageSync({ key: "add_DD_dep_id" }).data,
        }, function(data) {
            if (data.errcode == 0) {
                console.log("删除预案机构成功")
                console.log(data)
                app.apiPost("https://oapi.dingtalk.com/topapi/v2/department/listsub?access_token=" + app.globalData.access_token, { "dept_id": dd.getStorageSync({ key: "add_DD_plan_id" }).data, },
                    function(data) {
                        if (data.errcode == 0) {
                            console.log("显示删除 组织机构成功")
                                //  that.updataWorkDataFun(deplists.result);
                            app.globalData.dept_list = data.result
                            console.log(app.globalData.dept_list)
                            var pages = getCurrentPages();
                            var curPage = pages[pages.length - 1];
                            var curPagePre = pages[pages.length - 2];
                            curPage.setData({
                                resumeWorkList: app.globalData.dept_list
                            });
                            //更新上上一级页面
                            curPagePre.setData({
                                resumeWorkList: app.globalData.dept_list
                            });
                        }

                    })
            } else {
                console.log("删除失败")
            }


        })
        app.apiGet("http://" + app.globalData.server_host + ":1337/plan-deps?dd_sub_dep_id=" + dd.getStorageSync({ key: "add_DD_dep_id" }).data, {}, function(data) {
            console.log("这个是数据中查看到部门id以便于删除")
            console.log(data[0].id)
                // console.log(dd.getStorageSync({ key: "add_dep_name" }).data)
            dd.httpRequest({
                url: "http://" + app.globalData.server_host + ":1337/plan-deps/" + data[0].id,
                data: {},
                method: "DELETE",
                header: {
                    "Content-Type": "application/json;charset=utf-8"
                },
                dataType: 'json',
                success(res) {
                    console.log("删除数据库成功")
                    console.log(res.data)
                }
            })

      


        })
        console.log("开始删除")

    },

    //删除
    removeCompanyTap: function() {
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
                    that.deleteWorkDetailFun();
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
    },
    //预案机构名称聚焦
    orporatenamefocus: function(e) {
        this.setData({
            orporatename: ""
        });
    },
    //预案机构名称失焦
    orporatenameblur: function(e) {
        this.setData({
            orporatename: "输入预案机构名称",
            plan_dep_name: e.detail.value
        });
        dd.setStorageSync({
            key: 'add_dep_name',
            data: e.detail.value,
        });
        // app.globalData.add_dep_name = e.detail.value
    },
    //部门/职位
    // departmentTap: function(e){
    //   this.setData({
    //     department: e.detail.value
    //   })
    // },

    onSubmit(e) {
        console.log('onSubmit', e);
        my.alert({
            content: `你选择的人员id有是 ${e.detail.value.libs.join(', ')}`,

        });
        console.log("选的人员")
        console.log(e.detail.value.libs)
        dd.setStorageSync({
            key: 'add_dep_user_list',
            data: e.detail.value.libs
        });

    //     dd.setStorageSync({
    //         key: "add_dep_user_list",
    //         value: e.detail.value.libs
    //     })
    //     let res = dd.getStorageSync({ key: 'add_dep_user_list' });

    //     console.log(JSON.stringify(dd.getStorageSync({ key: 'add_dep_user_list' }).data))
    },

    onReset(e) {
        console.log('onReset', e);
    },
    onChange(e) {
        console.log(e);
    },


})
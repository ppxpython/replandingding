var app = getApp()
var utils = require('/util/common.js')
    // pages/new.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        newsMsg: [],
        list: [],
        duration: 2000,
        indicatorDots: true,
        autoplay: true,
        interval: 3000,
        loading: false,
        plain: false,
        focus: false,
        inputValue: '',


 

    },
     
    getNextDate() {
        const now = new Date()
        now.setDate(now.getDate() - this.index++)
        return now
    },
    onLoad() {
        dd.setNavigationBar({
            title: '预案列表',

        });
        let that = this
        dd.httpRequest({
            url: 'http://' + app.globalData.server_host + ':1337/plans',
            headers: {
                'Content-Type': 'application/json',

            },
            success(res) {
                 console.log(res.data)

                that.setData({
                    list: res.data
                })
            }

        })
        this.index = 1
 

    },
  
    bindButtonTap() {
        // blur 事件和这个冲突
        setTimeout(() => {
            this.onFocus();
        }, 100);
    },
    onFocus() {
        this.setData({
            focus: true,
        });
    },
    onBlur() {
        this.setData({
            focus: false,
        });
    },

    bindKeyInput(e) {
        this.setData({
            inputValue: e.detail.value,
        });
    },

    bindHideKeyboard(e) {
        if (e.detail.value === '123') {
            // 收起键盘
            dd.hideKeyboard();
        }
    },

    handleSearch(e) {
        console.log('search', e.detail.value);
        this.setData({
            search: e.detail.value,
        });
    },
    doneSearch() {
        console.log('doneSearch', this.data.search);
        dd.hideKeyboard();

    },
    clearSearch() {
      var that=this
        console.log('clear search', this.data.search);
        this.setData({
            search: '',
        });
         dd.httpRequest({
            url: 'http://' + app.globalData.server_host + ':1337/plans',
            headers: {
                'Content-Type': 'application/json',

            },
            success(res) {
                // console.log(res.data)

                that.setData({
                    list: res.data
                })
            }

        })
    },
    //点击搜索按钮
    //尚未完善
    okSearch() {
      var that=this
        console.log(typeof(this.data.search));
        var key = this.data.search
        key = encodeURI(key);  
        console.log("开始搜索")
        app.apiGet("http://"+app.globalData.server_host+":1337/plans?planName_contains="+key,
        {},function(data){
          console.log(data)
           that.setData({
                    list: data
                })
        })
      


    },




})
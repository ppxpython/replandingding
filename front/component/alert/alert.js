Component({
  mixins: [],
  data: {
    icon: "/asset/reset_vichle.png",
    txt: ["1.旧设备插在车上,保持供电",
      "2.卡针插入旧设备孔内,长按5秒,红灯快闪松开",
      "3.拔下旧设备,等待3分钟",
      "4.插上新设备", "5.重新拍照上传"],
    isShow: false,
 
  },
  props: {},
  didMount() {},
  didUpdate() {},
  didUnmount() {},
  methods: {},
  toastShow: function (str, icon) {
    var _this = this;
    _this.setData({
      isShow: true,
      txt: str,
      iconClass: icon
    });
    // setTimeout(function () {    //toast消失
    //   _this.setData({
    //     isShow: false
    //   });
    // }, 3000);
  },
  toastHidden: function () {
    this.setData({
      isShow: false
    });
  }
 
});

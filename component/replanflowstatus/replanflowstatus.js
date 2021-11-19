Component({
  mixins: [],
  
  props: {
     status: { // 状态：1->主态,2->客态
      type: Number,
      value: 1
    },
    userType: { // 用户类型：0->未授权,1->已授权,2->已实名认证
      type: String,
      value: '0'
    },
    attentionStatus: { // 关注人状态：0->未关注,1->已关注,2->互相关注;0->未邀请,1->已邀请
      // type: Number,
      value: 0
    },
    folProbCount: { // 关注的问题数
      // type: Number,
      value: 0
    },
    folPersonCount: { // 关注的人数
      // type: Number,
      value: 0
    },
    folSelfCount: { // 关注我的人数
      // type: Number,
      value: 0
    }
  },
  didMount() {},
  didUpdate() {},
  didUnmount() {},
  
  

  /**
   * 组件的初始数据
   */
  data: { 
  },
  /**
   * 组件的方法列表
   */
  methods: {
    /* 关注用户 */
    _attentionUser() {
      let { userId, attentionStatus } = this.data
      if (attentionStatus == 0) {
        attentionStatus = 1
      } else {
        attentionStatus = 0
      }
      app.userModel.attentionUser(userId, attentionStatus).then(res => {
        this.setData({
          attentionStatus: res.data.status
        })
      })
    },
     onLoad() {},

    /* 跳转至用户关注问题列表 */
    _jumptoFollowProblem() {
      let { userId, nickName } = this.data
      if (!userId) return
      app.qx.navigateTo({
        url: `${app.page.person_folproblem}?uid=${userId}&nickname=${nickName}`
      })
    },

    /* 跳转至我关注的人 */
    _jumptoAttentionUser() {
      let { userId, nickName } = this.data
      if (!userId) return
      app.qx.navigateTo({
        url: `${app.page.person_follow}?uid=${userId}&nickname=${nickName}`
      })
    },

    /* 跳转至关注我的人 */
    _jumptoFollowMeUser() {
      let { userId, nickName } = this.data
      if (!userId) return
      app.qx.navigateTo({
        url: `${app.page.follow_me}?uid=${userId}&nickname=${nickName}`
      })
    },

    /* 跳转至用户信息编辑页 */
    _jumptoUserEdit() {
      app.qx.navigateTo({ url: app.page.person_edit })
    }
  }
 
});

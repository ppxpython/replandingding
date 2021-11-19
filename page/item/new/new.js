//logs.js
var util = require('../../../util/common.js')
Page({
  data: {
    logs: []
  },
  onLoad: function () {
    console.log(dd.getStorageSync({key :'logs'}))
    var logsdata=dd.getStorageSync({key :'logs'})
     

    this.setData({
      // logs: (dd.getStorageSync({key :'logs'}) ).map(function (log) {

             logs: (dd.getStorageSync({key :'logs'}).data||[]).map(function (log) {
        return util.formatTime(new Date(log))
      })
    })
  }
})

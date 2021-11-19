Component({
  
 /**
 * 组件的属性列表
 */
 props: {
 // modal的默认高度
 height: '60%',
  
 //是否显示modal
 show: false,
  
 // submit()
 onSubmit:(data) => console.log(data),
  
 // onCancel()
 onCancel:(data) => console.log(data),
 },
  
 /**
 * 组件的初始数据
 */
 data: {
  
 },
  
 /**
 * 组件的方法列表
 */
 methods: {
 clickMask() {
 // this.setData({show: false})
 },
  
 cancel(e) {
 // this.setData({ show: false });
 this.props.onCancel(e);
 },
  
 submit(e) {
 // this.setData({ show: false });
 this.props.onSubmit(e);
 }
 }
 })
// Component({
//   mixins: [],
//   data: {},
//   props: {},
//   didMount() {},
//   didUpdate() {},
//   didUnmount() {},
//   methods: {},
// });

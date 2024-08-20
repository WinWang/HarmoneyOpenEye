@CustomDialog
export struct MyDialog{

  //自定义加载的内容
  @BuilderParam contentBuilder: () => void
  //弹窗控制器
  controller: CustomDialogController


  build() {
    Column() {
      Text('弹窗的标题').fontSize(20).margin(20)
      Text('弹窗的内容弹窗的内容弹窗的内容弹窗的内容弹窗的内容弹窗的内容弹窗的内容弹窗的内容弹窗的内容')
      this.contentBuilder()
    }
  }
}
@CustomDialog
export  struct CustomDialogExample  {

  @Link textValue: string
  controller?: CustomDialogController
  cancel?: ()  => void = () => {
  }
  confirm?: () => void = () => {
  }


  build() {
    Column(){
      Text('弹窗的标题').fontSize(20).margin(20)
      Text('弹窗的内容弹窗的内容弹窗的内容弹窗的内容弹窗的内容弹窗的内容弹窗的内容弹窗的内容弹窗的内容')
      Flex({justifyContent:FlexAlign.SpaceBetween}){
        Button('cancel').onClick(()=>{
          if (this.cancel) {
            this.cancel()
            this.controller?.close()
          }
        }).backgroundColor(Color.Transparent).fontColor(Color.Black)
        Button('confirm').onClick(()=>{
          if (this.confirm) {
            this.confirm()
            this.controller?.close()
          }
        })
      }.width('60%')
    }.padding(10).border({ radius: $r('app.float.size_6') }).borderRadius(5)
  }
}
/**
 *通用Dialog弹窗组件
 */
@CustomDialog
export struct CommonDialog {
  //自定义加载的内容
  @BuilderParam contentBuilder?: () => void
  //标题
  @Link title: Resource
  //描述
  @Link description: Resource
  //确认按钮文案
  private positiveText = "确认"
  //取消按钮文案
  private negativeText = "取消"
  //确认按钮回调
  private positiveCallback: () => void
  //取消按钮回调
  private negativeCallback: () => void
  //展示确认按钮
  private showPositive = true
  //展示取消按钮
  private showNegative = true
  //弹窗控制器
  controller: CustomDialogController

  aboutToAppear() {

  }

  build() {
    Stack() {
      Column() {
        Text(this.title)
          .fontSize($r('app.float.size_text_16'))
          .fontColor($r('app.color.color_red'))
          .fontWeight(FontWeight.Bold)
          .maxLines(1)
          .height($r('app.float.size_text_50'))
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        Divider().color($r('app.color.color_f5f5f5'))

        Text(this.description)
          .fontSize($r('app.float.size_text_15'))
          .fontColor($r('app.color.color_555'))
          .textAlign(TextAlign.Center)
          .padding($r('app.float.size_text_20'))


        Divider().color($r('app.color.color_f5f5f5')).padding(0)

        Row() {
          Text(this.negativeText)
            .flexShrink(1)
            .textAlign(TextAlign.Center)
            .layoutWeight(1)
            .visibility(this.showNegative ? Visibility.Visible : Visibility.None)
            .onClick(() => {
              this.negativeCallback?.()
              this.controller.close()
            })
          Divider()
            .color($r('app.color.color_f5f5f5'))
            .vertical(true)
            .visibility((this.showPositive && this.showNegative) ? Visibility.Visible : Visibility.None)
          Text(this.positiveText)
            .textAlign(TextAlign.Center)
            .layoutWeight(1)
            .fontColor($r('app.color.color_red'))
            .visibility(this.showPositive ? Visibility.Visible : Visibility.None)
            .onClick(() => {
              this.positiveCallback?.()
              this.controller.close()
            })
        }
        .height($r('app.float.size_50'))
        .width("100%")
      }
      .backgroundColor($r('app.color.color_white'))
      .border({ radius: $r('app.float.size_6') })
      .alignItems(HorizontalAlign.Center)
    }
    .width("100%")
  }
}
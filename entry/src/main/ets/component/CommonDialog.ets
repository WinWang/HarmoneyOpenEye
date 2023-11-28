/**
 *通用Dialog弹窗组件
 */
@CustomDialog
export struct CommonDialog {
  //自定义加载的内容
  @BuilderParam contentBuilder?: () => void
  //标题
  private title: string = ""
  //描述
  private description: string = ""
  //确认按钮文案
  private positiveText = "确认"
  //取消按钮文案
  private negativeText = "取消"
  //确认按钮回调
  private positiveCallback: () => void
  //取消按钮回调
  private negativeCallback: () => void
  controller: CustomDialogController

  aboutToAppear() {

  }

  build() {
    Stack() {
      Column() {
        Text(this.title)
          .fontSize($r('app.float.size_text_16'))
          .fontColor($r('app.color.color_333'))
          .maxLines(1)
          .height($r('app.float.size_text_50'))
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        Divider().color($r('app.color.color_f5f5f5'))

        Text(this.description)
          .fontSize($r('app.float.size_text_15'))
          .fontColor($r('app.color.color_555'))

        Divider().color($r('app.color.color_f5f5f5'))

        Row() {
          Text(this.negativeText)
            .flexShrink(1)
            .textAlign(TextAlign.Center)
            .layoutWeight(1)
            .onClick(() => {
              this.negativeCallback?.()
            })
          Divider().color($r('app.color.color_f5f5f5')).vertical(true)
          Text(this.positiveText)
            .textAlign(TextAlign.Center)
            .layoutWeight(1)
            .onClick(() => {
              this.positiveCallback?.()
            })
        }
        .height($r('app.float.size_50'))
        .width("100%")
      }
      .width("80%")
      .backgroundColor($r('app.color.color_white'))
      .border({ radius: $r('app.float.size_6') })
      .alignItems(HorizontalAlign.Center)
    }
    .width("100%")
  }
}
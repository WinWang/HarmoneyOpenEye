/**
 * 自定义App顶部Topbar
 */
import router from '@ohos.router'

@Component
export struct CommonTopBar {
  @Prop title: string
  private backButton: boolean = true
  private onBackClick?: () => void

  build() {
    Stack({ alignContent: Alignment.Start }) {
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Text(this.title)
          .flexGrow(1)
          .textAlign(TextAlign.Center)
          .fontColor($r('app.color.color_fff'))
          .fontSize($r('app.float.size_text_16'))
          .align(Alignment.Center)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .height($r('app.float.size_50'))
      .margin({ left: $r('app.float.size_50'), right: $r('app.float.size_50') })
      .alignSelf(ItemAlign.Center)

      if (this.backButton) {
        Stack() {
          Image($r('app.media.ic_action_back'))
            .height($r('app.float.size_16'))
            .width($r('app.float.size_16'))
            .align(Alignment.Center)
            .onClick(() => {
              this.onBackClick?.()
              router.back();
            })
        }
        .height($r('app.float.size_50'))
        .width($r('app.float.size_50'))
      }
    }
    .backgroundColor($r("app.color.color_red"))
    .height($r('app.float.size_50'))
    .width("100%")
  }
}
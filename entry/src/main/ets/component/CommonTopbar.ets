/**
 * 自定义App顶部Topbar
 */
import router from '@ohos.router'

@Component
export struct CommonTopbar {
  private backButton: boolean = true
  private onBackClick?: () => void
  private title: string = ""

  build() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
      if (this.backButton) {
        Image($r('app.media.ic_action_back'))
          .height($r('app.float.size_20'))
          .width($r('app.float.size_20'))
          .align(Alignment.Center)
          .onClick(() => {
            this.onBackClick?.()
            router.back();
          })
      }
      Text(this.title)
        .flexGrow(1)
        .textAlign(TextAlign.Center)
        .fontColor($r('app.color.color_fff'))
        .fontSize($r('app.float.size_text_16'))
        .align(Alignment.Center)
    }
    .height($r('app.float.size_50'))
    .width("100%")
    .backgroundColor($r("app.color.color_red"))
    .alignSelf(ItemAlign.Center)
  }
}
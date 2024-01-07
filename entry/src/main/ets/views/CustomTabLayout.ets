import { LogUtils } from '../utils/LogUtils'

/**
 * 纯自定义TabLayout，非官方Tabs自定义，需要自己监听回调选中同步状态
 */
@Component
export struct CustomTabLayout {
  // 标题列表，由父组件初始化
  @Link tabTitle: string[]
  // tab标签选中position
  @Link currentIndex: number
  //Tab对齐方式
  private flexAlign?: FlexAlign = FlexAlign.Center;
  // tab标签选中监听
  private tabSelectCallback: (position: number, title: string) => void = (position: number, title: string) => {
    LogUtils.debug('tabSelected position = ' + position + ', title = ' + title)
  }

  aboutToAppear() {

  }

  aboutToDisappear() {

  }

  build() {
    Flex({ direction: FlexDirection.Row, justifyContent: this.flexAlign }) {
      ForEach(this.tabTitle, (item: string, index: number) => {
        this.TabBuilder(index, item)
      }, item => item.index)
    }
    .backgroundColor($r("app.color.color_red"))
  }

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? $r("app.color.color_white") : $r("app.color.color_f5f5f5"))
        .fontSize($r('app.float.size_text_15'))
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .textAlign(TextAlign.Center)
        .height($r("app.float.size_40"))
      Divider()
        .strokeWidth(5)
        .color($r("app.color.color_white"))
        .opacity(this.currentIndex === index ? 1 : 0)
        .width($r("app.float.size_80"))
        .lineCap(LineCapStyle.Round)
    }
    .width('101%') //解决Tab连接处白色线条间隙
    .height($r("app.float.size_50"))
    .backgroundColor($r("app.color.color_red"))
    .justifyContent(FlexAlign.End)
    .onClick(() => {
      this.tabSelectCallback(index, name)
      LogUtils.debug(`${this.currentIndex}`)
      LogUtils.debug(`${index}`)
      LogUtils.debug(`${name}`)
    })
  }
}
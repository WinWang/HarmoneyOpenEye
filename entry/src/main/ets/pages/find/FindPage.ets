import { CommonTopbar } from '../../component/CommonTopbar'
import FindViewModel from '../../viewmodel/FindViewModel'
import { CategoryPage } from './category/CategoryPage'
import { FocusPage } from './focus/FocusPage'
import { TopicPage } from './topic/TopicPage'

/**
 * 发现页面
 */
@Component
export struct FindPage {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  aboutToAppear() {
    this.loadNet()
  }

  async loadNet() {

  }

  build() {
    Column() {
      CommonTopbar({ title: "发现", backButton: false })
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          FocusPage()
        }.tabBar(this.TabBuilder(0, FindViewModel.tabTitle[0].title))

        TabContent() {
          CategoryPage()
        }.tabBar(this.TabBuilder(1, FindViewModel.tabTitle[1].title))

        TabContent() {
          TopicPage()
        }.tabBar(this.TabBuilder(2, FindViewModel.tabTitle[2].title))
      }.onChange((index) => {
        this.currentIndex = index
      }).barHeight($r("app.float.size_50"))
    }
  }

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? $r("app.color.color_white") : $r("app.color.color_f5f5f5"))
        .fontSize($r('app.float.size_text_16'))
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight($r("app.float.size_40"))
        .flexGrow(1)
        .textAlign(TextAlign.Center)
      Divider()
        .strokeWidth(2)
        .color($r("app.color.color_white"))
        .opacity(this.currentIndex === index ? 1 : 0)
        .width($r("app.float.size_80"))
    }
    .width('100%')
    .height($r("app.float.size_50"))
    .backgroundColor($r("app.color.color_red"))
    .justifyContent(FlexAlign.Center)
  }
}

/**
 * 热门页面
 */
import { CommonTopBar } from '../../views/CommonTopBar'
import { LogUtils } from '../../utils/LogUtils'
import HotViewModel from '../../viewmodel/HotViewModel'
import { RankPage } from './rank/RankPage'

@Component
export struct HotPage {
  @Provide hotCurrentIndex: number = 0
  private controller: TabsController = new TabsController()

  build() {
    Stack() {
      Column() {
        CommonTopBar({ title: "热门", backButton: false, alpha: 1 })
        Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
          ForEach(HotViewModel.hotTabTitle, (tabItem, index) => {
            TabContent() {
              RankPage({ rankType: tabItem.rankType, positionIndex: index })
            }.tabBar(this.TabBuilder(index, tabItem.title)).padding({ top: 0, bottom: 0 }).width("100%")
          })
        }
        .barHeight($r("app.float.size_50"))
        .barWidth("100%")
        .barMode(BarMode.Fixed)
        .onChange((index) => {
          this.hotCurrentIndex = index
        })
      }
    }
  }

  onPageShow() {
    LogUtils.error("页面可见>>Hot")
  }

  onPageHide() {
    LogUtils.error("页面不可见>>Hot")
  }

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.hotCurrentIndex === index ? $r("app.color.color_white") : $r("app.color.color_f5f5f5"))
        .fontSize($r('app.float.size_text_15'))
        .fontWeight(this.hotCurrentIndex === index ? 500 : 400)
        .textAlign(TextAlign.Center)
        .height($r("app.float.size_40"))
      Divider()
        .strokeWidth(5)
        .color($r("app.color.color_white"))
        .opacity(this.hotCurrentIndex === index ? 1 : 0)
        .width($r("app.float.size_80"))
        .lineCap(LineCapStyle.Round)
    }
    .width('101%') //解决Tab连接处白色线条间隙
    .height($r("app.float.size_50"))
    .backgroundColor($r("app.color.color_red"))
    .justifyContent(FlexAlign.End)
  }
}
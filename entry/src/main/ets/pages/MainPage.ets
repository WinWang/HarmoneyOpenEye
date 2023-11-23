import { TabItem } from '../model/TabItem'
import { CommonConstants } from '../constants/CommonConstants'
import { LogUtils } from '../utils/LogUtils'
import MainViewModel from '../viewmodel/MainViewModel'
import { FindPage } from './find/FindPage'
import { HomePage } from './home/HomePage'
import { HotPage } from './hot/HotPage'
import { MinePage } from './mine/MinePage'

@Entry
@Component
struct MainPage {
  @State selectedIndex: number = 0

  aboutToAppear() {

  }

  build() {
    Column() {
      Tabs({
        index: this.selectedIndex,
        barPosition: BarPosition.End,
      }) {
        TabContent() {
          HomePage()
        }
        .tabBar(this.TabBottom(MainViewModel.tabTitle[0], 0))

        TabContent() {
          FindPage()
        }
        .tabBar(this.TabBottom(MainViewModel.tabTitle[1], 1))

        TabContent() {
          HotPage()
        }
        .tabBar(this.TabBottom(MainViewModel.tabTitle[3], 3))

        TabContent() {
          MinePage()
        }
        .tabBar(this.TabBottom(MainViewModel.tabTitle[3], 3))
      }
      .barMode(BarMode.Fixed)
      .barWidth('100%')
      .scrollable(false)
      .barHeight($r('app.float.tab_bar_height'))
      .onChange((index: number) => {
        this.selectedIndex = index;
        console.log("index>>>" + this.selectedIndex)
      })
    }
  }

  onPageShow() {
    LogUtils.error("页面可见>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  }

  onPageHide() {
    LogUtils.error("页面不可见>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  }

  @Builder TabBottom(item: TabItem, index: number) {
    Column() {
      Image(this.selectedIndex == index ? item.imageActivated : item.imageOriginal)
        .height($r('app.float.tab_image_size'))
        .width($r('app.float.tab_image_size'))
        .margin({
          top: $r('app.float.tab_margin_top'),
          bottom: $r('app.float.tab_margin_bottom')
        })
      Text(item.title)
        .width(CommonConstants.FULL_WIDTH_PERCENT)
        .height($r('app.float.tab_text_height'))
        .fontSize($r('app.float.tab_text_font_size'))
        .fontWeight(CommonConstants.TAB_ITEM_FONT_WEIGHT)
        .fontColor(this.selectedIndex === index ? Color.Red : Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({
          bottom: $r('app.float.tab_text_margin_bottom')
        })
    }
    .justifyContent(FlexAlign.Center)
    .height(CommonConstants.FULL_HEIGHT_PERCENT)
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .backgroundColor($r("app.color.color_f5f5f5"))
  }
}

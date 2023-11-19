import hilog from '@ohos.hilog'
import { TabItem } from '../common/bean/TabItem'
import { CommonConstants } from '../common/constants/CommonConstants'
import MainViewModel from '../viewmodel/MainViewModel'
import { FindPage } from './find/FindPage'
import { HomePage } from './home/HomePage'
import { HotPage } from './hot/HotPage'
import { MinePage } from './mine/MinePage'

@Entry
@Component
struct MainPage {
  @State selectedIndex: number = 0

  build() {
    Column() {
      Tabs({
        index: this.selectedIndex,
        barPosition: BarPosition.End
      }) {
        ForEach(MainViewModel.getTabItems(), (item: TabItem, index: number) => {
          TabContent() {
            if (this.selectedIndex == 0) {
              HomePage()
            } else if (this.selectedIndex == 1) {
              FindPage()
            } else if (this.selectedIndex == 2) {
              HotPage()
            } else if (this.selectedIndex == 3) {
              MinePage()
            }
          }.tabBar(this.TabBottom(item, index))
        })
      }.barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.selectedIndex = index;
      })
    }
  }

  onPageShow() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'onPageShow');
  }

  onPageHide() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'onPageHide');
  }

  @Builder TabBottom(item: TabItem, index: number) {
    Column() {
      Image(this.selectedIndex === index ? item.imageActivated : item.imageOriginal)
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
        .fontColor(this.selectedIndex === index ?
        $r('app.color.tab_text_activated') : $r('app.color.tab_text_normal'))
        .textAlign(TextAlign.Center)
        .margin({
          bottom: $r('app.float.tab_text_margin_bottom')
        })
    }
    .justifyContent(FlexAlign.Center)
    .height(CommonConstants.FULL_HEIGHT_PERCENT)
    .width(CommonConstants.FULL_WIDTH_PERCENT)
  }
}

import { CommonTopBar } from '../../views/CommonTopBar'
import { LogUtils } from '../../utils/LogUtils'
import HotViewModel from '../../viewmodel/HotViewModel'
import { RankPage } from './rank/RankPage'
import { CustomTabLayout } from '../../views/CustomTabLayout'

@Entry
@Component
struct CoordinatePage {
  @Provide homeTabSelected: number = 2
  @Provide hotCurrentIndex: number = 0
  private scroller: Scroller = new Scroller()
  private swiperController: SwiperController = new SwiperController()
  @State offsetY: number = 0
  @State tabList: string[] = []
  @State tabPosY: number = 300
  @State topBarAlpha: number = 0
  private topBarHeight: number = 90
  private topHeaderHeight: number = 300

  aboutToAppear() {
    HotViewModel.hotTabTitle.forEach((item) => {
      this.tabList.push(item.title)
    })
    this.hotCurrentIndex = 0
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      CommonTopBar({ title: "热门", backButton: true, alpha: this.topBarAlpha })
        .zIndex(10)
      CustomTabLayout(
        { currentIndex: $hotCurrentIndex,
          tabTitle: $tabList,
          tabSelectCallback: (position, item) => {
            this.hotCurrentIndex = position
          }
        })
        .width("100%")
        .position({ y: this.tabPosY, x: 0 })
        .zIndex(10)
      Scroll(this.scroller) {
        Column() {
          Image($r("app.media.back_mine"))
            .height($r("app.float.size_300"))
            .width("100%")
          Swiper(this.swiperController) {
            ForEach(HotViewModel.hotTabTitle, (tabItem, index) => {
              Stack({ alignContent: Alignment.Top }) {
                RankPage({ rankType: tabItem.rankType, positionIndex: index, hasInit: index == 0 ? true : false })
              }
            }, item => item)
          }
          .autoPlay(false)
          .indicator(false) // 默认开启指示点
          .loop(false) // 默认开启循环播放
          .vertical(false) // 默认横向切换
          .itemSpace(0)
          .index(this.hotCurrentIndex)
          .margin({ top: 50 })
          .flexGrow(1)
          .width('100%')
          .onChange((index: number) => {
            LogUtils.debug(index.toString())
            this.hotCurrentIndex = index
          })
        }
      }
      .onScroll((xOffset, yOffset) => {
        this.offsetY = this.scroller.currentOffset().yOffset;
        LogUtils.debug(`滚动1Y>>${this.offsetY}`)
        this.topBarAlpha = this.offsetY > this.topHeaderHeight ? 1 : this.offsetY / this.topHeaderHeight
        this.tabPosY = (this.topHeaderHeight - this.topBarHeight - this.offsetY <= 0)
          ? this.topBarHeight : this.topHeaderHeight - this.offsetY
        LogUtils.debug(`滚动2Y>>${this.tabPosY}`)
      })
    }
  }
}
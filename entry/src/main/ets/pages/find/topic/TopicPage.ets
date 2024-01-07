import { RefreshFooter } from '../../../views/RefreshFooter'
import { StateComponent } from '../../../views/StateComponent'
import { ViewStateConstant } from '../../../constants/ViewStateConstant'
import { TopicModelItemList } from '../../../model/TopicModel'
import { RoutePath } from '../../../route/RoutePath'
import { Router } from '../../../route/Router'
import ImageRegexUtils from '../../../utils/ImageRegexUtils'
import { LogUtils } from '../../../utils/LogUtils'
import TopicViewModel from '../../../viewmodel/TopicViewModel'

@Component
export struct TopicPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State showLoading: boolean = false
  @State isRefreshing: boolean = false
  @State topicList: TopicModelItemList[] = []
  @Consume @Watch("onHomeTabSelected") homeTabSelected: number
  @Consume @Watch("onFindTabSelectedIndex") findCurrentIndex: number
  private hasInit = false

  aboutToAppear() {
    TopicViewModel.observeState((state) => {
      //不要在该回调里面修改isRefreshing状态，因为该回调会多次执行，导致Refresh状态修改线程阻塞
      this.viewState = state
    })
    if (this.hasInit) {
      this.loadNet()
    }
  }

  /**
   * 懒加载处理逻辑
   */
  onHomeTabSelected() {
    LogUtils.debug("Topic-homeTabSelectedIndex>>>", `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  /**
   * 懒加载处理逻辑
   */
  onFindTabSelectedIndex() {
    LogUtils.debug("Topic-onFindTabSelectedIndex>>>", `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  initData() {
    if (!this.hasInit && this.homeTabSelected == 1 && this.findCurrentIndex == 2) {
      this.loadNet()
      this.hasInit = true
    }
  }

  loadNet() {
    TopicViewModel.getTopicData((result) => {
      this.isRefreshing = false
      this.showLoading = false
      if (TopicViewModel.pageIndex == 0) {
        this.topicList = result
      } else {
        this.topicList = [...this.topicList, ...result]
      }
    })
  }

  build() {
    Stack() {
      StateComponent({ viewState: this.viewState, retryCallback: () => {
        this.loadNet()
      } }) {
        Refresh({ refreshing: $$this.isRefreshing }) {
          List({ space: 10, initialIndex: 0 }) {
            ForEach(this.topicList, (item: TopicModelItemList, index: number) => {
              ListItem() {
                Image(ImageRegexUtils(item.data.image))
                  .alt($r('app.media.back_placeholder'))
                  .width("100%")
                  .height($r('app.float.size_200'))
                  .border({ radius: $r('app.float.size_5') })
              }.onClick(() => {
                Router.push(RoutePath.TopicDetailPage, { "id": item.data.id })
              })
            })
            ListItem() {
              RefreshFooter({ showFooter: this.showLoading })
            }
          }
          .listDirection(Axis.Vertical)
          .onReachEnd(() => {
            this.showLoading = true
            this.loadNet()
          }).padding({ left: $r('app.float.size_10'), right: $r('app.float.size_10'), top: $r('app.float.size_10') })
        }.onRefreshing(() => {
          TopicViewModel.pageIndex = 0
          this.loadNet()
        })
      }
    }
  }
}
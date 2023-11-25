import { RefreshFooter } from '../../../component/RefreshFooter'
import { StateComponent } from '../../../component/StateComponent'
import { ViewStateConstant } from '../../../constants/ViewStateConstant'
import { TopicModelItemList } from '../../../model/TopicModel'
import { RoutePath } from '../../../route/RoutePath'
import { Router } from '../../../route/Router'
import ImageRegexUtils from '../../../utils/ImageRegexUtils'
import TopicViewModel from '../../../viewmodel/TopicViewModel'

@Component
export struct TopicPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State showLoading: boolean = false
  @State isRefreshing: boolean = false
  @State topicList: TopicModelItemList[] = []

  aboutToAppear() {
    TopicViewModel.observeState((state) => {
      //不要在该回调里面修改isRefreshing状态，因为该回调会多次执行，导致Refresh状态修改线程阻塞
      this.viewState = state
    })
    this.loadNet()
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
                Router.push(RoutePath.TopicDetailPage)
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
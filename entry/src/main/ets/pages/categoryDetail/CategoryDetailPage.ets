import router from '@ohos.router'
import { CommonTopBar } from '../../views/CommonTopBar'
import { RefreshFooter } from '../../views/RefreshFooter'
import { StateComponent } from '../../views/StateComponent'
import { ViewStateConstant } from '../../constants/ViewStateConstant'
import { HomeModelIssueListItemList } from '../../model/HomeModel'
import { RoutePath } from '../../route/RoutePath'
import { Router } from '../../route/Router'
import ImageRegexUtils from '../../utils/ImageRegexUtils'
import { LogUtils } from '../../utils/LogUtils'
import categoryDetailViewModel from '../../viewmodel/CategoryDetialViewModel'
import { HomeListItemComponent } from '../home/component/HomeListItemComponent'

@Entry
@Component
struct CategoryDetailPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State isRefreshing: boolean = false
  @State alpha: number = 0
  @State dataList: HomeModelIssueListItemList[] = []
  @State headerImage: string = ""
  @State showLoading: boolean = false
  @State title: string = ""
  private scrollOffset: number = 0

  aboutToAppear() {
    categoryDetailViewModel.observeState((state) => this.viewState = state)
    categoryDetailViewModel.id = router.getParams()["id"]
    this.headerImage = router.getParams()["headerImage"]
    this.title = router.getParams()["title"]
    this.loadNet()
  }

  loadNet() {
    categoryDetailViewModel.getCategoryDetailList((result) => {
      this.isRefreshing = false
      this.showLoading = false
      if (categoryDetailViewModel.pageIndex == 0) {
        this.dataList = result
      } else {
        this.dataList = [...this.dataList, ...result]
      }
    })
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Stack() {
        StateComponent({ viewState: this.viewState, retryCallback: () => {
          this.loadNet()
        } }) {
          Refresh({ refreshing: $$this.isRefreshing }) {
            List({ space: 10 }) {
              ListItem() {
                this.listHeader()
              }

              ForEach(this.dataList, (item: HomeModelIssueListItemList) => {
                ListItem() {
                  HomeListItemComponent({ item: item })
                }
                .padding({ left: $r('app.float.size_10'), right: $r('app.float.size_10') })
                .onClick(() => {
                  Router.push(RoutePath.DetailPage, { "id": item.data.id, playUrl: item.data.playUrl })
                })

              })
              ListItem() {
                RefreshFooter({ showFooter: this.showLoading })
              }
            }
            .height("100%")
            .width("100%")
            .edgeEffect(EdgeEffect.None)
            .onReachEnd(() => {
              this.showLoading = true
              this.loadNet()
            })
            .onScroll((scrollOffset: number, scrollState: ScrollState) => {
              this.scrollOffset += scrollOffset
              LogUtils.debug("Scroll滚动距离", `${scrollState}  >>  ${scrollOffset}`)
              this.dispatchScrollOffset()
            })
            .onScrollStop(() => {
              LogUtils.debug("Scroll滚动距离", "scrollStateStop")
              this.dispatchScrollOffset()
            })
          }.onRefreshing(() => {
            categoryDetailViewModel.pageIndex = 0
            this.scrollOffset = 0
            this.loadNet()
          })
        }
      }.width("100%").height("100%")

      CommonTopBar({ title: this.title, alpha: this.alpha, titleAlignment: TextAlign.Start })
    }
    .width("100%")
    .height("100%")
  }

  @Builder
  listHeader() {
    Image(ImageRegexUtils(this.headerImage))
      .width("100%")
      .height($r('app.float.size_300'))
      .alt($r('app.media.back_placeholder'))
  }

  /**
   * 处理滚动事件
   */
  private dispatchScrollOffset() {
    let alpha = this.scrollOffset / 300
    this.alpha = alpha > 1 ? 1 : alpha < 0 ? 0 : alpha
    LogUtils.info("scroll", `${this.scrollOffset}`)
  }
}
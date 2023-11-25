import { CommonTopBar } from '../../component/CommonTopbar'
import { RefreshFooter } from '../../component/RefreshFooter'
import { StateComponent } from '../../component/StateComponent'
import { ViewStateConstant } from '../../constants/ViewStateConstant'
import { HomeModelIssueListItemList } from '../../model/HomeModel'
import HomeViewModel from '../../viewmodel/HomeViewModel'
import { HomeListItemComponent } from './component/HomeListItemComponent'

/**
 * 首页
 */
@Component
export struct HomePage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State isRefreshing: boolean = false
  @State dataList: HomeModelIssueListItemList[] = []
  @State showLoading: boolean = false

  aboutToAppear() {
    HomeViewModel.observeState(state => {
      this.viewState = state
    })
    this.loadNet()
  }

  loadNet() {
    HomeViewModel.getHomeList(
      (result) => {
        this.isRefreshing = false
        this.showLoading = false
        if (HomeViewModel.getDate() == "") {
          this.dataList = result
        } else {
          this.dataList = [...this.dataList, ...result]
        }
      })
  }

  build() {
    Column() {
      CommonTopBar({ title: "首页", backButton: false }).align(Alignment.TopStart)
      Stack() {
        StateComponent({
          viewState: this.viewState,
          retryCallback: () => {
            this.loadNet()
          } }) {
          Refresh({ refreshing: $$this.isRefreshing, offset: 100, friction: 100 }) {
            List({ space: 10, initialIndex: 0 }) {
              ForEach(this.dataList, (item: HomeModelIssueListItemList, index: number) => {
                ListItem() {
                  HomeListItemComponent({ item: item })
                }
              })
              ListItem() {
                RefreshFooter({ showFooter: this.showLoading })
              }
            }
            .listDirection(Axis.Vertical) // 排列方向
            .divider({
              strokeWidth: 1,
              color: $r('app.color.color_f5f5f5'),
              startMargin: 10,
              endMargin: 10
            }) // 每行之间的分界线
            .onScrollIndex((firstIndex: number, lastIndex: number) => {

            })
            .onReachEnd(() => {
              this.showLoading = true
              this.loadNet()
            })
          }
          .onRefreshing(() => {
            HomeViewModel.revertDate()
            this.loadNet()
          }).padding({ left: 10, right: 10 })
        }
      }.layoutWeight(1)
    }
  }
}
import { StateComponent } from '../../component/StateComponent'
import { ViewStateConstant } from '../../constants/ViewStateConstant'
import { HomeModelIssueListItemList } from '../../model/homeModel'
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

  aboutToAppear() {
    this.loadNet()
  }

  loadNet() {
    HomeViewModel.getHomeList(
      (state) => {
        this.viewState = state
      },
      (result) => {
        this.dataList = result
      })
  }

  build() {
    Column() {
      StateComponent({
        viewState: this.viewState,
        retryCallback: () => {
          this.loadNet()
        } }) {
        Refresh({ refreshing: $$this.isRefreshing }) {
          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.dataList, (item: HomeModelIssueListItemList, index: number) => {
              ListItem() {
                HomeListItemComponent({ item: item })
              }
            })
          }
          .listDirection(Axis.Vertical) // 排列方向
          .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // 每行之间的分界线
          .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
          .onScrollIndex((firstIndex: number, lastIndex: number) => {
            console.info('first' + firstIndex)
            console.info('last' + lastIndex)
          })
          .width('100%')
          .height("100%")
        }

      }
    }
  }
}
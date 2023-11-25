import { RefreshFooter } from '../../../component/RefreshFooter'
import { StateComponent } from '../../../component/StateComponent'
import { ViewStateConstant } from '../../../constants/ViewStateConstant'
import { FocusModelItemList } from '../../../model/FocusModel'
import FocusViewModel from '../../../viewmodel/FocusViewModel'
import { FocusItemComponent } from './component/FocusItemComponent'

@Component
export struct FocusPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State isRefreshing: boolean = false
  @State dataList: FocusModelItemList[] = []
  @State showLoading: boolean = false

  aboutToAppear() {
    FocusViewModel.observeState((state) => this.viewState = state)
    this.loadNet()
  }

  loadNet() {
    FocusViewModel.getFocusData((result) => {
      this.isRefreshing = false
      this.showLoading = false
      if (FocusViewModel.pageIndex == 0) {
        this.dataList = result
      } else {
        this.dataList = [...this.dataList, ...result]
      }
    })
  }

  build() {
    StateComponent({
      viewState: this.viewState,
      retryCallback: () => {
        this.loadNet()
      } }) {
      Refresh({ refreshing: $$this.isRefreshing, offset: 100, friction: 100 }) {
        List({ space: 10, initialIndex: 0 }) {
          ForEach(this.dataList, (item: FocusModelItemList, index: number) => {
            ListItem() {
              FocusItemComponent({ item: item })
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
        .onReachEnd(() => {
          this.showLoading = true
          this.loadNet()
        })
      }
      .onRefreshing(() => {
        FocusViewModel.pageIndex = 0
        this.loadNet()
      }).padding({ left: 10, right: 10 })
    }
  }
}
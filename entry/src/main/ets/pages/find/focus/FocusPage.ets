import { RefreshFooter } from '../../../views/RefreshFooter'
import { StateComponent } from '../../../views/StateComponent'
import { ViewStateConstant } from '../../../constants/ViewStateConstant'
import { FocusModelItemList } from '../../../model/FocusModel'
import { LogUtils } from '../../../utils/LogUtils'
import FocusViewModel from '../../../viewmodel/FocusViewModel'
import { FocusItemComponent } from './component/FocusItemComponent'

@Component
export struct FocusPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State isRefreshing: boolean = false
  @State dataList: FocusModelItemList[] = []
  @State showLoading: boolean = false
  @Consume @Watch("onHomeTabSelected") homeTabSelected: number
  @Consume @Watch("onFindTabSelectedIndex") findCurrentIndex: number
  private hasInit = false

  aboutToAppear() {
    FocusViewModel.observeState((state) => this.viewState = state)
    if (this.hasInit) {
      this.loadNet()
    }
  }

  /**
   * 懒加载处理逻辑
   */
  onHomeTabSelected() {
    LogUtils.debug("Focus-homeTabSelectedIndex>>>", `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  /**
   * 懒加载处理逻辑
   */
  onFindTabSelectedIndex() {
    LogUtils.debug("Focus-onFindTabSelectedIndex>>>", `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  initData() {
    if (!this.hasInit && this.homeTabSelected == 1 && this.findCurrentIndex == 0) {
      this.loadNet()
      this.hasInit = true
    }
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
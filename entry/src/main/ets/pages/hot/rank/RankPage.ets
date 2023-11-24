import { StateComponent } from '../../../component/StateComponent'
import { ViewStateConstant } from '../../../constants/ViewStateConstant'
import { HomeModelIssueListItemList } from '../../../model/HomeModel'
import { RankViewModel } from '../../../viewmodel/RankViewModel'
import { HomeListItemComponent } from '../../home/component/HomeListItemComponent'

@Component
export struct RankPage {
  private rankType: string = "weekly"
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State rankList: HomeModelIssueListItemList[] = []
  private viewModel = new RankViewModel()

  aboutToAppear() {
    this.viewModel.observeState((state) => {
      this.viewState = state
    })
    this.loadNet()
  }

  loadNet() {
    this.viewModel.getRankList(this.rankType, (result) => {
      this.rankList = result
    })
  }

  build() {
    Stack() {
      StateComponent({ viewState: this.viewState, retryCallback: () => {
        this.loadNet()
      } }) {
        List({ space: 10, initialIndex: 0 }) {
          ForEach(this.rankList, (item: HomeModelIssueListItemList, index: number) => {
            ListItem() {
              HomeListItemComponent({ item: item, showFooter: index == this.rankList.length - 1 })
            }
          })
        }
        .listDirection(Axis.Vertical) // 排列方向
        .margin({ left: 10, top: 10, right: 10, bottom: 50 })
        .divider({
          strokeWidth: 1,
          color: $r('app.color.color_f5f5f5'),
          startMargin: 10,
          endMargin: 10
        })
      }
    }
  }
}
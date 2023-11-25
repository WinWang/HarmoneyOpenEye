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
              HomeListItemComponent({ item: item })
            }
          })
          ListItem() {
            this.itemFooter()
          }
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

  @Builder
  itemFooter() {
    Row() {
      Divider().strokeWidth(2).color($r('app.color.color_999')).width($r('app.float.size_50'))
      Text("我是有底线的")
        .margin({ left: 15, right: 15 })
        .fontColor($r('app.color.color_999'))
        .fontSize($r('app.float.size_text_15'))
      Divider().strokeWidth(2).color($r('app.color.color_999')).width($r('app.float.size_50'))
    }
    .height($r('app.float.size_50'))
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width("100%")
  }
}
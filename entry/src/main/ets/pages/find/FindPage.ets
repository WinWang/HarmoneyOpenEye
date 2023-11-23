import { StateComponent } from '../../component/StateComponent'
import { ViewStateConstant } from '../../constants/ViewStateConstant'
import FindViewModel from '../../viewmodel/FindViewModel'

/**
 * 发现页面
 */
@Component
export struct FindPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING

  aboutToAppear() {
    this.loadNet()
  }

  async loadNet() {
    FindViewModel.getDataList((state) => {
      this.viewState = state
    })
  }

  build() {
    Column() {
      StateComponent({ viewState: this.viewState, retryCallback: () => {
        this.loadNet()
      } }) {
        Column() {
          Text("主题内容")
        }
      }
    }
  }
}

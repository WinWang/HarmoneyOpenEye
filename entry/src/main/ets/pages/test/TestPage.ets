import { CommonTopBar } from '../../component/CommonTopBar'
import { StateComponent } from '../../component/StateComponent'
import { ViewStateConstant } from '../../constants/ViewStateConstant'
import TestViewModel from '../../viewmodel/TestViewModel'

@Entry
@Component
struct TestPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State message: string = 'Hello World'

  aboutToAppear() {
    TestViewModel.observeState(state => {
      this.viewState = state
    })
    this.loadNet()
  }

  loadNet() {
    TestViewModel.getHomeBanner((result) => {
      this.message = JSON.stringify(result, null, 2)
    })
  }

  build() {
    Column() {
      CommonTopBar({ title: '测试页面', alpha: 1 })
      StateComponent({
        viewState: this.viewState,
        retryCallback: () => {
          this.loadNet()
        } }) {
        Scroll() {
          Text(this.message).fontSize($r('app.float.size_text_20'))
        }
      }

    }
    .height('100%')
    .width('100%')
  }
}
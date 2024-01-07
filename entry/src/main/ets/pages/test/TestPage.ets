import { CommonTopBar } from '../../views/CommonTopBar'
import { StateComponent } from '../../views/StateComponent'
import { StorageKeys } from '../../constants/StorageKeys'
import { ViewStateConstant } from '../../constants/ViewStateConstant'
import {StorageUtils } from '../../utils/StorageUtils'
import showToast from '../../utils/ToastUtils'
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
      Button("测试Storage模拟登陆").onClick(() => {
        StorageUtils.put(StorageKeys.USER_LOGIN, true)
        StorageUtils.put(StorageKeys.USER_INFO_KEY, "allen")
        setTimeout(() => {
          StorageUtils.get(StorageKeys.USER_LOGIN).then((result) => {
            showToast(result.toString())
          })
        }, 3000)
      })
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
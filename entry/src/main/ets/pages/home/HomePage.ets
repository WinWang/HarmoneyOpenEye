/**
 * 首页
 */
import router from '@ohos.router'
import { getHomeList } from '../../http/apiService'
import { LogUtils } from '../../utils/LogUtils'
import { ToastUtils } from '../../utils/ToastUtils'


@Component
export struct HomePage {
  @State count: number = 0

  aboutToAppear() {
    let homeData = getHomeList("").then((res) => {
      LogUtils.logDebug(">>>>>>" + res)
      ToastUtils.showToast(res.toString())
    }).catch((err) => {
      ToastUtils.showToast("错误的信息" + err.toString())
    })
  }

  build() {
    Column() {
      Text(this.count.toString())
      Button("跳转到下个页面").fontSize($r("app.float.tab_text_font_size")).onClick(() => {
        router.pushUrl({ url: "pages/CategoryPage" })
      })
      Button("Toast").fontSize($r("app.float.tab_text_font_size")).onClick(() => {
        ToastUtils.showToast("哈哈哈哈")
        this.aboutToAppear()
      })
      Button("Toast").fontSize($r("app.float.tab_text_font_size")).onClick(() => {
        this.count++
      })
    }
  }
}
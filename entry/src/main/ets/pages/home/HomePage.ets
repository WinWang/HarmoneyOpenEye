/**
 * 首页
 */
import router from '@ohos.router'
import ToastUtils from '../../utils/ToastUtils'

@Component
export struct HomePage {
  @State count: number = 0

  constructor() {
    super()

  }

  build() {
    Column() {
      Text(this.count.toString())
      Button("跳转到下个页面").fontSize($r("app.float.tab_text_font_size")).onClick(() => {
        router.pushUrl({ url: "pages/CategoryPage" })
      })
      Button("Toast").fontSize($r("app.float.tab_text_font_size")).onClick(() => {
        ToastUtils.showToast("哈哈哈哈")
      })
      Button("Toast").fontSize($r("app.float.tab_text_font_size")).onClick(() => {
        this.count++
      })


    }

  }
}
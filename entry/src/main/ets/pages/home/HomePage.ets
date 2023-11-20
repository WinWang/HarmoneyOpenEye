/**
 * 首页
 */
import router from '@ohos.router'
@Component
export struct HomePage {
  build() {
    Button("跳转到下个页面").fontSize($r("app.float.tab_text_font_size")).onClick(() => {
      router.pushUrl({url:"pages/CategoryPage"})
    })
  }
}
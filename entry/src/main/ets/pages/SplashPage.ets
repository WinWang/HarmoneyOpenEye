import router from '@ohos.router'
import { RoutePath } from '../route/RoutePath'

@Entry
@Component
export struct SplagePage {
  aboutToAppear() {
    setTimeout(() => {
      router.replaceUrl({ url: RoutePath.MainPage })
    }, 3000)
  }

  build() {
    Stack() {
      Image($r('app.media.landing_image'))
    }.width("100%").height("100%").backgroundColor($r("app.color.color_white")).alignContent(Alignment.Center)
  }
}
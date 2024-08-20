import router from '@ohos.router'
import { RoutePath } from '../route/RoutePath'


/**
 * 页面生命周期，即被@Entry装饰的组件生命周期，提供以下生命周期接口：
 onPageShow：页面每次显示时触发。
 onPageHide：页面每次隐藏时触发一次。
 onBackPress：当用户点击返回按钮时触发。
 组件生命周期，即一般用@Component装饰的自定义组件的生命周期，提供以下生命周期接口：
 aboutToAppear：组件即将出现时回调该接口，具体时机为在创建自定义组件的新实例后，在执行其build()函数之前执行。
 aboutToDisappear：在自定义组件即将析构销毁时执行。
 */
@Entry
@Component
struct SplashPage {

  aboutToAppear() {
    setTimeout(() => {
      router.replaceUrl({ url: 'pages/MainPage'})
    }, 2000)
  }

  build() {
    Stack() {
      Text(this.calcTextValue())
      Image($r('app.media.landing_image')).objectFit(ImageFit.ScaleDown)
    }.width("100%").height("100%").backgroundColor($r("app.color.color_white")).alignContent(Alignment.Center)
  }


  doSomeCalculations() {
  }

  calcTextValue(): string {
    return 'Hello World';
  }

  @Builder doSomeRender() {
    Text(`Hello World`)
  }


}
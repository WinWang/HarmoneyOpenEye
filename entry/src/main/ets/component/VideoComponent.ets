/**
 * 视频播放组件
 */
import { LogUtils } from '../utils/LogUtils'

@Component
export struct VideoComponent {
  //播放链接
  @Link playUrl: string
  //是否展示控制器
  @Link showControls: boolean
  //页面loading是否可见控制
  @State showLoading: boolean = true
  //控制器
  private controller: VideoController
  //是否自动播放
  private isAutoPlay: boolean = false

  build() {
    Stack() {
      Video({
        src: this.playUrl,
        controller: this.controller,
      })
        .width('100%')
        .height('100%')
        .autoPlay(this.isAutoPlay)
        .controls(this.showControls)
        .onStart(() => {
          LogUtils.info('onStart')
          this.showLoading = false
        })
        .onPause(() => {
          LogUtils.info('onPause')
        })
        .onFinish(() => {
          LogUtils.info('onFinish')
        })
        .onError(() => {
          LogUtils.info('onError')
          this.showLoading = false
        })
        .onPrepared((e) => {
          LogUtils.info('onPrepared is ' + e.duration)
        })
        .onSeeking((e) => {
          LogUtils.info('onSeeking is ' + e.time)
          this.showLoading = true
        })
        .onSeeked((e) => {
          LogUtils.info('onSeeked is ' + e.time)
          this.showLoading = false
        })
        .onUpdate((e) => {
          LogUtils.info('onUpdate is ' + e.time)
        })
      Image($r('app.media.loading'))
        .width($r("app.float.size_50"))
        .height($r("app.float.size_50"))
        .visibility(this.showLoading ? Visibility.Visible : Visibility.None)
    }
    .width('100%')
    .height('100%')
  }
}
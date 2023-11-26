import router from '@ohos.router'
import { CommonTopBar } from '../../component/CommonTopbar'
import { LogUtils } from '../../utils/LogUtils'
import { VideoBottomComponent } from './component/VideoBottomComponent'

@Entry
@Component
struct DetailPage {
  @State isAutoPlay: boolean = true
  @State showControls: boolean = true
  @State playUrl: string = ""
  @State relationId: number = -1
  private controller: VideoController = new VideoController()

  aboutToAppear() {
    this.relationId = router.getParams()['id']
    this.playUrl = router.getParams()['playUrl']
  }

  build() {
    Column() {
      CommonTopBar({ title: '视频详情' })
      this.headerPlayer()
      VideoBottomComponent({
        relationId: this.relationId,
        onItemClick: (playUrl) => {
          this.playUrl = playUrl
        } }
      ).layoutWeight(1)
    }
    .width("100%")
    .height("100%")

  }

  @Builder
  headerPlayer() {
    Video({
      src: this.playUrl,
      controller: this.controller,
    })
      .width('100%')
      .height($r('app.float.size_250'))
      .autoPlay(this.isAutoPlay)
      .controls(this.showControls)
      .onStart(() => {
        LogUtils.info('onStart')
      })
      .onPause(() => {
        LogUtils.info('onPause')
      })
      .onFinish(() => {
        LogUtils.info('onFinish')
      })
      .onError(() => {
        LogUtils.info('onError')
      })
      .onPrepared((e) => {
        LogUtils.info('onPrepared is ' + e.duration)
      })
      .onSeeking((e) => {
        LogUtils.info('onSeeking is ' + e.time)
      })
      .onSeeked((e) => {
        LogUtils.info('onSeeked is ' + e.time)
      })
      .onUpdate((e) => {
        LogUtils.info('onUpdate is ' + e.time)
      })
  }
}
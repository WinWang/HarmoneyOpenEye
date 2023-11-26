import router from '@ohos.router'
import { CommonTopBar } from '../../component/CommonTopbar'
import { StateComponent } from '../../component/StateComponent'
import { ViewStateConstant } from '../../constants/ViewStateConstant'
import { TopicDetailModel, TopicDetailModelItemList } from '../../model/TopicDetailModel'
import { LogUtils } from '../../utils/LogUtils'
import TopicDetailViewModel from '../../viewmodel/TopicDetailViewModel'


@Entry
@Component
struct TopicDetailPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State title: string = ""
  @State detailData: TopicDetailModel = {}
  @State playIndex: number = -1
  @State isAutoPlay: boolean = true
  @State showControls: boolean = true
  private controller: VideoController = new VideoController()

  aboutToAppear() {
    TopicDetailViewModel.topicId = router.getParams()["id"]
    TopicDetailViewModel.observeState((state) => this.viewState = state)
    this.loadNet()
  }

  loadNet() {
    TopicDetailViewModel.getTopicDetailList((result) => {
      this.detailData = result
      this.title = this.detailData.brief
    })
  }

  build() {
    Column() {
      CommonTopBar({ title: this.title })
      Stack() {
        StateComponent({ viewState: this.viewState, retryCallback: () => {
          this.loadNet()
        } }) {
          List() {
            ListItem() {
              this.topicHeader()
            }

            ForEach(this.detailData.itemList, (item: TopicDetailModelItemList, index: number) => {
              ListItem() {
                this.itemContent(item, index)
              }
            })
          }
          .width("100%")
          .height("100%")
          .onScrollIndex((firstIndex: number, lastIndex: number) => {
            if (this.playIndex > lastIndex || this.playIndex < firstIndex) {
              this.playIndex = -1
            }
          })
        }
      }.layoutWeight(1)
    }
    .height("100%")
  }

  /**
   * 顶部头布局
   */
  @Builder
  topicHeader() {
    Column() {
      Image(this.detailData.headerImage)
        .width("100%")
        .height($r('app.float.size_280'))
        .alt($r('app.media.back_placeholder'))

      Text(this.detailData.brief)
        .width("80%")
        .height($r('app.float.size_46'))
        .border({ radius: $r('app.float.size_5'), width: $r('app.float.size_1'), color: $r('app.color.color_333') })
        .fontColor($r('app.color.color_333'))
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .fontSize($r('app.float.size_text_14'))
        .maxLines(1)
        .margin({ top: $r('app.float.size_minus_23') })
        .backgroundColor($r('app.color.color_white'))

      Text(this.detailData.text)
        .fontColor($r('app.color.color_555'))
        .fontSize($r('app.float.size_text_13'))
        .margin($r('app.float.size_10'))

    }
  }

  /**
   * item的布局
   */
  @Builder
  itemContent(item: TopicDetailModelItemList, index: number) {
    Column() {
      if (this.playIndex == index) {
        Video({
          src: item.data.content.data.playUrl,
          controller: this.controller,
          previewUri: item.data.content.data.cover.feed
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
      } else {
        Stack() {
          Image(item.data.content.data.cover.feed)
            .width("100%")
            .height($r('app.float.size_250'))
            .alt($r('app.media.back_placeholder'))

          Image($r('app.media.icon_play'))
            .width($r('app.float.size_45'))
            .height($r('app.float.size_45'))
            .alt($r('app.media.back_placeholder'))
            .onClick(() => {
              this.playIndex = index
            })
        }
      }

      Text(this.detailData.brief)
        .width("80%")
        .fontColor($r('app.color.color_333'))
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .fontSize($r('app.float.size_text_14'))
        .maxLines(1)
        .backgroundColor($r('app.color.color_white'))
        .margin({ top: $r('app.float.size_10') })

      Text(this.detailData.text)
        .fontColor($r('app.color.color_555'))
        .fontSize($r('app.float.size_text_13'))
        .margin($r('app.float.size_10'))

    }
  }
}
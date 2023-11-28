import { HomeModelIssueListItemList } from '../../../model/HomeModel'
import ImageRegexUtils from '../../../utils/ImageRegexUtils'

@Component
export struct HomeListItemComponent {
  private item: HomeModelIssueListItemList
  private swiperController: SwiperController = new SwiperController()

  build() {
    if (this.item.type == "banner") {
      this.bannerComponent()
    } else {
      this.itemComponent()
    }
  }

  @Builder
  bannerComponent() {
    Swiper() {
      Swiper(this.swiperController) {
        ForEach(this.item.bannerList, (item: HomeModelIssueListItemList) => {
          Image(ImageRegexUtils(item.data?.image))
            .alt($r('app.media.back_placeholder'))
            .width('100%')
            .height($r('app.float.size_200'))
            .border({ radius: $r('app.float.size_5') })
        }, item => item)
      }
      .cachedCount(3)
      .index(0)
      .autoPlay(true)
      .interval(4000)
      .indicator(true)
      .loop(false)
      .duration(2000)
      .itemSpace(0)
      .curve(Curve.Linear)
      .indicatorStyle({ color: $r('app.color.color_red'), selectedColor: $r('app.color.color_red') })
      .onChange((index: number) => {

      })
    }
  }

  @Builder
  itemComponent() {
    Column() {
      Stack() {
        Image(this.item?.data?.cover?.feed)
          .width("100%")
          .height("100%")
          .border({ radius: $r('app.float.size_10') })
          .alt($r('app.media.back_placeholder'))
        Text(this.item.data?.category)
          .width($r('app.float.size_45'))
          .height($r('app.float.size_20'))
          .fontColor($r('app.color.color_fff'))
          .fontSize($r('app.float.size_text_12'))
          .backgroundColor($r('app.color.color_red'))
          .border({ radius: { topLeft: $r('app.float.size_10'), bottomRight: $r('app.float.size_10') } })
          .textAlign(TextAlign.Center)
          .position({ x: 0, y: 0 })
      }
      .width("100%")
      .height($r('app.float.size_210'))
      .border({ radius: $r('app.float.size_5') })

      Row() {
        Image(this.item?.data?.author?.icon)
          .width($r('app.float.size_50'))
          .height($r('app.float.size_50'))
          .border({ radius: $r('app.float.size_25') })
        Column() {
          Text(this.item.data?.author?.name)
            .fontSize($r('app.float.size_text_15'))
            .fontColor($r('app.color.color_333'))
          Text(this.item.data?.author?.name)
            .fontSize($r('app.float.size_text_13'))
            .fontColor($r('app.color.color_999'))
            .margin({ top: $r('app.float.size_5') })
        }
        .alignItems(HorizontalAlign.Start)
        .flexGrow(1)
        .margin({ left: $r('app.float.size_5') })
        .justifyContent(FlexAlign.Center)
      }
      .width("100%")
      .height($r('app.float.size_60'))
      .alignItems(VerticalAlign.Center)
      .padding({ left: $r('app.float.size_5'), right: $r('app.float.size_5') })

    }
  }
}
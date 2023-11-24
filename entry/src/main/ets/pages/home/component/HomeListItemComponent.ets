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
      .indicatorStyle({ color: $r('app.color.color_red') })
      .onChange((index: number) => {

      })
    }
  }

  @Builder
  itemComponent() {
    Column() {
      Stack() {
        Image(this.item.data?.cover.feed).width("100%").height("100%")
        Text(this.item.data?.category)
          .width($r('app.float.size_45'))
          .height($r('app.float.size_20'))
          .fontColor($r('app.color.color_fff'))
          .fontSize($r('app.float.size_text_12'))
          .backgroundColor($r('app.color.color_red'))
          .border({ radius: { bottomRight: $r('app.float.size_10') } })
          .textAlign(TextAlign.Center)
          .position({ x: 0, y: 0 })
      }
      .width("100%")
      .height($r('app.float.size_210'))
      .border({ radius: $r('app.float.size_5') })

      Flex({ direction: FlexDirection.Row }) {
        Image(this.item.data.author.icon)
          .width($r('app.float.size_50'))
          .height($r('app.float.size_50'))
          .border({ radius: $r('app.float.size_25') })
        Column() {
          Text(this.item.data?.author.name)
            .fontSize($r('app.float.size_text_15'))
            .fontColor($r('app.color.color_333'))
          Text(this.item.data?.author.name)
            .fontSize($r('app.float.size_text_13'))
            .fontColor($r('app.color.color_999'))
            .margin({ top: $r('app.float.size_10') })
        }.alignSelf(ItemAlign.Start).flexShrink(1).margin({ left: $r('app.float.size_5') })
      }
      .width("100%")
      .height($r('app.float.size_60'))
      .alignSelf(ItemAlign.Center)
      .padding({ left: $r('app.float.size_5'), right: $r('app.float.size_5') })

    }
  }
}
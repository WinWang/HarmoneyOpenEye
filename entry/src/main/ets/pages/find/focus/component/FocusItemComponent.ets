import { FocusModelItemList, FocusModelItemListDataItemList } from '../../../../model/FocusModel'
import { RoutePath } from '../../../../route/RoutePath'
import { Router } from '../../../../route/Router'

@Component
export struct FocusItemComponent {
  private item: FocusModelItemList

  build() {
    Column() {
      Row() {
        Image(this.item.data.header.icon)
          .width($r('app.float.size_50'))
          .height($r('app.float.size_50'))
          .border({ radius: $r('app.float.size_25') })
        Column() {
          Text(this.item.data?.header.title)
            .fontSize($r('app.float.size_text_15'))
            .fontColor($r('app.color.color_333'))
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text(this.item.data?.header.description)
            .fontSize($r('app.float.size_text_13'))
            .fontColor($r('app.color.color_999'))
            .margin({ top: $r('app.float.size_5') })
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
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

      List({ space: 10 }) {
        ForEach(this.item.data.itemList, (innerItem: FocusModelItemListDataItemList, index: number) => {
          ListItem() {
            Stack() {
              Stack() {
                Image(innerItem.data?.cover.feed)
                  .width("100%")
                  .height("100%")
                  .border({ radius: $r('app.float.size_10') })
                  .alt($r('app.media.back_placeholder'))
                Text(innerItem.data?.category)
                  .width($r('app.float.size_45'))
                  .height($r('app.float.size_20'))
                  .fontColor($r('app.color.color_fff'))
                  .fontSize($r('app.float.size_text_12'))
                  .backgroundColor($r('app.color.color_red'))
                  .border({ radius: { topLeft: $r('app.float.size_10'), bottomRight: $r('app.float.size_10') } })
                  .textAlign(TextAlign.Center)
                  .position({ x: 0, y: 0 })
              }
            }
            .height($r('app.float.size_130'))
            .width($r('app.float.size_220'))
          }.onClick(() => {
            Router.push(RoutePath.DetailPage, { "id": innerItem.data.id, playUrl: innerItem.data.playUrl })
          })
        })
      }
      .listDirection(Axis.Horizontal)
      .height($r('app.float.size_130'))
      .width("100%")
    }
  }
}
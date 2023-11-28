/**
 * //TODO-通用骨架屏---BuilderParams只能支持一个参数，多个参数不支持闭包的写法，这个很纠结。。。。目前只能简单的内置骨架屏了
 */
@Component
export struct CommonSkeleton {
  @State dataList: Array<string> = new Array(5)

  aboutToAppear() {
    for (let index = 0; index < 3; index++) {
      this.dataList.push("")
    }
  }

  build() {
    List({ space: 10 }) {
      ForEach(this.dataList, (item, index) => {
        ListItem() {
          this.itemBuild()
        }
      })
    }.height("100%")
    .width("100%")
  }

  @Builder
  itemBuild() {
    Column() {
      Image($r('app.media.back_placeholder'))
        .width("100%")
        .height($r('app.float.size_200'))
        .border({ radius: $r('app.float.size_5') })

      Stack().width("90%")
        .height($r('app.float.size_25'))
        .backgroundColor($r('app.color.color_f5f5f5'))
        .margin({ top: $r('app.float.size_10') })
      Stack().width("70%")
        .height($r('app.float.size_25'))
        .backgroundColor($r('app.color.color_f5f5f5'))
        .margin({ top: $r('app.float.size_5') })
    }.alignItems(HorizontalAlign.Start)
  }
}
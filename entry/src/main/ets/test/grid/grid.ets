@Entry
@Component
struct OfficeService {
  @State services: Array<string> = ['会议', '投票', '签到', '打印','会议', '投票', '签到', '打印','会议', '投票', '签到', '打印','会议', '投票', '签到', '打印']

  build() {
    Column() {
      Grid() {
        ForEach(this.services, (service:string) => {
          GridItem() {

            Column() {
              Image($r('app.media.icon_sel_hot'))
                .border({ radius: $r('app.float.size_5')})
                .alt($r("app.media.back_placeholder"))


              Text(service)
                .fontColor(Color.White)
                .fontSize($r('app.float.size_text_20'))
                .fontWeight(FontWeight.Bold)
            }.border({ radius: $r('app.float.size_5') }).backgroundColor(Color.Blue).padding(10)

          }
        })
      }
      .columnsTemplate('1fr 1fr')
      .rowsGap(10)
      .columnsGap(10)
      .height("100%")
      .padding({ left: 10, right: 10, top: 10, bottom: 50 })
    }
  }
}
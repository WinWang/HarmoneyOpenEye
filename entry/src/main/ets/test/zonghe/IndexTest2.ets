@Entry
@Component
export struct MyChild {
  //圆形图片
  build() {
    Column() {
      Column() {

        Stack({ alignContent: Alignment.Bottom }) {
          Image($r('app.media.default_avatar')).borderRadius({topLeft:10,topRight:10})
          Row() {
            Image($r('app.media.icon_play')).width(20).margin({left:5})
            Text('288万').fontColor(Color.White).margin({ left: 5 }).fontSize(15)
            Image($r('app.media.icon_play')).width(20).margin({left:10})
            Text('8859').fontColor(Color.White).margin({ left: 5 }).fontSize(15)
            Blank()
            Text('4:33').fontColor(Color.White).margin({ left: 10 })
          }.width('100%').padding(5)

        }.height(300)

        Text('【凤凰传奇新歌】欢迎来到国风唢呐区：唢呐一响神曲《天青色等烟雨而我在等你》')
          .fontColor(Color.Black)
          .margin(10)
          .fontSize(20)
          .fontWeight(20)
          .textOverflow({overflow:TextOverflow.Ellipsis}).maxLines(2)

        Row(){
          Text('19万点赞').fontColor(Color.Red).margin({ left: 10 }).backgroundColor(Color.Gray).padding(5)

          Image($r('app.media.icon_sel_mine')).width(20)
        }.width('100%').padding(10).justifyContent(FlexAlign.SpaceBetween)

      }.borderRadius(10).backgroundColor(Color.White).margin(15)


    }.width('100%').height('100%').backgroundColor('#ccc')

  }
}
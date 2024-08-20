

@Entry
@Component
export struct MyChild{

  //圆形图片
  build() {
    Column(){
      Column(){
        Text('VIP用户').fontColor(Color.Black).zIndex(666).backgroundColor(Color.Yellow).position({x:0,y:0})
          .borderRadius({topLeft:10,bottomRight:10}).border({width:2,color:Color.White}).fontStyle(FontStyle.Italic)

        Image($r('app.media.default_avatar')).height(210).width('100%').borderRadius(10)
        Row(){
          Image($r('app.media.icon_unsel_hot')).width('100%').width(20).backgroundColor(Color.Blue)
          Text('我是酷狗音乐').fontWeight(10).fontColor(Color.Black).fontSize(20).margin({left:7})
        }.width('100%').margin({top:10}).backgroundColor(Color.Yellow).padding(10)
      }.backgroundColor(Color.White).width('70%').padding(10)

    }.backgroundColor(Color.Brown).height('100%').width('100%').padding({top:20})

  }
}
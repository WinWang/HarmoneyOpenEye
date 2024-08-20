

@Entry
@Component
export struct MyChild{

  //圆形图片
  build() {
    Column(){
      //圆形图片
      Image($r('app.media.default_avatar'))
        .height(300).width(300).borderRadius(150)
      //左右圆角按钮
      Text('今天还没打卡哟！！').height(50).width(200).backgroundColor(Color.Yellow).borderRadius(25)
      //上下圆角按钮
      Text('今天还没打卡哟！！').height(200).width(50).backgroundColor(Color.Blue).borderRadius(100)


      Column(){}.backgroundColor(Color.Pink).backgroundImage($r('app.media.icon_about')).width(300).height(200)
      .backgroundImagePosition(Alignment.Center)

    }

  }
}
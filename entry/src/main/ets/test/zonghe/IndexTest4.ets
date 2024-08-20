import curves from '@ohos.curves';


@Entry
@Component
struct MyChild {

  @State maskOpacity:number = 0
  @State maskIndex:number = -1


  //aspectRatio 设置宽高比

  //圆形图片
  build() {
    //在外层设置宽高
    Swiper(){
      Image($r('app.media.default_avatar'))
      Image($r('app.media.icon_type'))
      Image($r('app.media.icon_loading'))
      Image($r('app.media.icon_sel_home'))
    }.width('100%').aspectRatio(1)
    .loop(true)
    .autoPlay(true)
    .interval(1000)
    .indicator(false)//设置没有小圆点
    .indicator(
      Indicator
        .dot()
        .itemWidth(20)
        .itemHeight(10)
        .selectedItemWidth(20)
        .selectedItemHeight(10)
        .color(Color.Black)
        .selectedColor(Color.Yellow))

  }




  @Builder itemContent(){
    Column() {
      Badge({
        count:1,
        position:BadgePosition.RightTop,style:{badgeSize:20,fontSize:10,badgeColor:Color.Blue}
      }){
        Image($r('app.media.default_avatar')).width(100)
      }.height(100)
    }.width('100%').backgroundColor(Color.Red)
  }
}

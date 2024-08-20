import curves from '@ohos.curves';


@Entry
@Component
struct MyChild {

  @State maskOpacity:number = 0
  @State maskIndex:number = -1

  @State isPresent: boolean = false;
  // 第一步，创建TransitionEffect
  private effect: TransitionEffect =
    // 创建默认透明度转场效果,并指定了springMotion(0.6, 0.8)曲线
    TransitionEffect.OPACITY.animation({ curve: curves.springMotion(0.6, 0.8) })
      // 通过combine方法,这里的动画参数会跟随上面的TransitionEffect，也就是springMotion(0.6, 0.8)
      .combine(TransitionEffect.scale({ x: 0, y: 0 }))
        // 添加旋转转场效果，这里的动画参数会跟随上面带animation的TransitionEffect，也就是springMotion(0.6, 0.8)
      .combine(TransitionEffect.rotate({ angle: 90 }))
        // 添加平移转场效果，这里的动画参数使用指定的springMotion()
      .combine(TransitionEffect.translate({ y: 150 }).animation({ curve: curves.springMotion() }))
        // 添加move转场效果，这里的动画参数会跟随上面的TransitionEffect，也就是springMotion()
      .combine(TransitionEffect.move(TransitionEdge.END))


  @State animate: boolean = false;
  // 第一步: 声明相关状态变量
  @State rotateValue: number = 0; // 组件旋转角度
  @State opacityValue: number = 1; // 组件透明度
  @State scaleValue: number = 1; // 组件透明度


  //圆形图片
  build() {
    Stack({alignContent:Alignment.Center}){

      Column(){
        Grid(){
          ForEach([1,2,3,4,5,6,7,8,9,10,11,12],()=>{
            GridItem(){
              this.itemContent()
            }
          })
        }.width('100%').columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr').rowsGap(30)
        .columnsGap(20).backgroundColor(Color.Yellow).height(234).padding(2)

        Button('立即抽奖').width(200).backgroundColor(Color.Red).margin({top:40})
          .onClick(()=>{
            // this.maskOpacity = 1
            // this.maskIndex = 99
            // console.log('123','----立即抽奖-------------')
            // this.isPresent = true
            animateTo({curve: curves.springMotion(),delay:100 },()=>{
              this.maskOpacity = 1;
              this.rotateValue = 90;
              this.maskIndex = 99
              this.scaleValue = 1
            })

          })
      }

        Column(){
          Text('获得生肖卡').fontColor(Color.White)
          Image($r('app.media.default_avatar')).width(150).margin({top:20}).scale({x:this.scaleValue,y:this.scaleValue})
          Button('开心收下').backgroundColor(Color.Transparent).margin({top:40}).borderWidth(1)
            .borderColor(Color.White).width(150).onClick(()=>{
            // console.log('123','------borderColor--开心收下---------')
            // this.maskOpacity = 0
            // this.maskIndex = -1
            // this.isPresent = false
            animateTo({curve: curves.springMotion() },()=>{
              this.rotateValue = 0;
              this.maskOpacity = 0;
              this.maskIndex = -1
              this.scaleValue = 0
            })

          })
        }.backgroundColor('#cc000000').width('100%').height('100%')
        .justifyContent(FlexAlign.Center)
        .opacity(this.maskOpacity)
        .zIndex(this.maskIndex)

        //动画animation，当我们元素有状态的改变，可以添加animation做动画
        // 第二步：将转场效果通过transition接口设置到组件
        // .transition(this.effect)

    }.height('100%')

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

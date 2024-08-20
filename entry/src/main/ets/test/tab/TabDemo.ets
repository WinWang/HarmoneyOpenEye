import { CustomDialogExample } from '../dialog/CustomDialogExample'

@Entry
@Component
struct TabDemo {
  @State currentIndex: number = 0
  @State textValue: string = ''
  private controller: TabsController = new TabsController()
  @State handlePopup: boolean = false

  private dialogController?:CustomDialogController | null = new CustomDialogController({
    builder:CustomDialogExample({
      cancel:()=>{
        this.onCancel()
      },confirm:()=>{
        this.onConfirm()
      },textValue: this.textValue
    }),alignment:DialogAlignment.Bottom,openAnimation:{
      duration:300,curve:Curve.Linear,delay:100,playMode:PlayMode.Normal,onFinish:()=>{
        console.log('play end');
      },
    },autoCancel:true,offset:{dx:0,dy:-100},gridCount:200,customStyle:false,backgroundColor:Color.Red,cornerRadius:30
  })


  onCancel(){
    console.log('onCancel------------')
  }

  onConfirm(){
    console.log('onConfirm-----------------')
  }

  aboutToAppear(): void {

  }

  aboutToDisappear(): void {
    this.dialogController = null
  }


  build() {

    Column(){

      Button('动态修改index').onClick(event =>{
        this.currentIndex = 3
        this.controller.changeIndex(3)
        this.handlePopup = !this.handlePopup
      }).bindPopup(this.handlePopup,{
        message:'我是popwindow提示',onStateChange:(e)=>{
          if (!e.isVisible) {
            this.handlePopup = false
          }
        }
      })

      Tabs({barPosition:BarPosition.Start,index:this.currentIndex,controller:this.controller}) {
        TabContent() {
          Text('首页的内容').fontSize(30).onClick(()=>{
            this.dialogController?.open()
          })
        }.backgroundColor(Color.Gray)
        .tabBar(this.tabBuilder('首页',0,$r('app.media.icon_sel_home'),$r('app.media.icon_unsel_home')))

        TabContent() {
          Text('推荐的内容').fontSize(30)
        }
        .tabBar(this.tabBuilder('推荐',1,$r('app.media.icon_sel_home'),$r('app.media.icon_unsel_home')))

        TabContent() {
          Text('发现的内容').fontSize(30)
        }
        .tabBar(this.tabBuilder('发现',2,$r('app.media.icon_sel_find'),$r('app.media.icon_unsel_find')))

        TabContent() {
          Text('我的内容').fontSize(30)
        }
        .tabBar(this.tabBuilder('我的',3,$r('app.media.icon_sel_home'),$r('app.media.icon_unsel_home')))
      }.scrollable(false).onChange((index:number)=>{
        this.currentIndex = index
      }).height('100%')



    }.height('100%')
  }


  @Builder tabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }


  @Builder tabContent(){
    Scroll(){
      Column(){

      }

    }

  }
}


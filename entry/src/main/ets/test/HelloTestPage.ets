import { display } from '@kit.ArkUI';

let MTop: Record<string, number> = { 'top': 50 }

let mSize = 10;

@Entry
@Component
struct StackExample {
  private searchArr: Array<string> = ['1', '2', '1', '2', '1', '2', '1', '2', '1', '2', '1', '2', '1', '2', '1', '2'];
  private screenWidth = px2vp(display.getDefaultDisplaySync().width);
  private gap = (this.screenWidth - this.screenWidth * 0.9) / 3

  build() {

    Scroll() {
      Column() {
        Stack({}) {
          Column().width('90%').height('100%').backgroundColor('#ff58b87c')
          Text('text').width('60%').height('50%').backgroundColor('#ffc3f6aa')
          Button('button').width('30%').height('30%').backgroundColor('#ff8ff3eb').fontColor('#000')
        }.width('100%').height(150).margin(MTop)

        Stack({ alignContent: Alignment.TopStart }) {
          Text('Stack').width('90%').height('100%').backgroundColor("#ff08dbdb").textAlign(TextAlign.Center)
          Text('Item1').width('60%').height('50%').backgroundColor("#ffc1521f")
          Text('Item2').width('40%').height('20%').backgroundColor("#ffcc2187")
        }.height(200).margin({ top: 50 })

        Flex({ wrap: FlexWrap.NoWrap, justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
          Text('1').backgroundColor("#ff08dbdb")
            .flexBasis('auto') //不设置宽高，就自适应宽高
          Text('2').width('20%').height(40).backgroundColor("#ffc1521f").flexBasis('auto')
          Text('3').width('20%').height(50).backgroundColor("#ffcc2187")
        }.margin({ top: 50 }).backgroundColor('#fffffff').padding({ left: 10, right: 10 })

        Flex() {
          Text('flexGrow(2)')
            .flexGrow(2)
            .width(50)
            .height(100)
            .backgroundColor(0xF5DEB3)
          Text('flexGrow(3)')
            .flexGrow(1)
            .width(50)
            .height(100)
            .backgroundColor(0xD2B48C)

          Text('no flexGrow')
            .width(50)
            .height(100)
            .backgroundColor(0xF5DEB3)
        }
        .width('100%')
        .height(120)
        .padding(10)
        .backgroundColor(0xAFEEEE)
        .margin({ top: 50 })

        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          ForEach(this.searchArr, (item: string) => {
            Text(item).width('30%').height(40).backgroundColor("#ff08dbdb").margin({ top: this.getGap() })
          })
        }.margin({ top: 50, bottom: 50 }).backgroundColor(Color.Red).padding(this.getGap() )


        // Flex布局， wrap设置成FlexWrap.Wrap时为弹性布局
        Flex({ justifyContent: FlexAlign.Start, wrap: FlexWrap.Wrap }) {
          if (this.searchArr.length > 0) {
            // 循环渲染
            ForEach(this.searchArr, (item: string) => {
              Text(`${item}`).width('30%').height(40).backgroundColor("#ff08dbdb").margin('10%')
            }, (item: string) => JSON.stringify(item)) //第三个参数，唯一键，去除重复，所以只有1和2
          }
        }.margin({ top: 50, bottom: 50 }).backgroundColor('#fffffff').padding(10)

      }

    }

  }

  getGap() {
    let gap = (this.screenWidth * 0.1) / 2.2
    console.log("screenWidth:"+ this.screenWidth)
    console.log("gap:"+gap)
    return gap
  }
}
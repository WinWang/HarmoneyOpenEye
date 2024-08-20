import router from '@ohos.router'
import { MyDialog } from './dialog/CustomDialogNew'
import { HelloComponent } from './HelloComponent'
import { MyChild } from './MyChild'
import { Tmp } from './Tmp'


@Entry
@Component
struct MyPage {
  @State showChild: boolean = true
  @State heightValue: number = 100

  //全局的loading
  loadingDialogController: CustomDialogController = new CustomDialogController({
    builder: MyDialog(),
    alignment: DialogAlignment.Center,
    autoCancel: false,
    gridCount: 2,
  })

  build() {
    Column({ space: 10 }) {
      if (this.showChild) {
        Child()
      }
      MyChild(){
        Text('我是MyChild下面的View').fontSize(22).onClick(()=>{

        })
      }


      Button('点击隐藏child').fontSize(33).onClick(() => {
        if (this.showChild == true) {
          this.showChild = false
        }else {
          this.showChild = true
        }

      })
      Button('跳转到下个页面').fontSize(33).onClick(() => {
        router.replaceUrl({ url: "test/MyPage4" }, () => {
        })
      })
      // Child2({ textStr: '我设置的内容' }) {
      //   Text(`Parent builder1111 `)
      // }

      Text("点击变换组件高度").textStyle2().fontSize(20).align(Alignment.Center).stateStyles({
        normal: this.normalStyle,
        pressed: this.pressedStyle
      })
    }.height('100%').alignItems(HorizontalAlign.Center)
      //上下居中显示
    // alignItems(HorizontalAlign.Center).width('100%').height('100%').justifyContent(FlexAlign.Center)
  }

  @Styles textStyle2(){
    .width(300)
    .height(this.heightValue)
    .backgroundColor(Color.Blue)
    .onClick(() => {
      this.heightValue = 200
    })
  }

  @Styles pressedStyle() {
    .backgroundColor(Color.Red)
  }

  @Styles normalStyle(){
    .backgroundColor(Color.Gray)
  }

  @Styles globalFancy(){
    .width(150)
    .height(100)
    .backgroundColor(Color.Pink)
  }



  @Builder componentBuilder() {
    Text(`Parent builder1111 `)
  }

  // 只有被@Entry装饰的组件才可以调用页面的生命周期
  onPageShow() {
    console.info('Index onPageShow');
  }
  // 只有被@Entry装饰的组件才可以调用页面的生命周期
  onPageHide() {
    console.info('Index onPageHide');
  }

  onBackPress() {
    console.info('Index onBackPress');
  }

  // 组件生命周期
  aboutToAppear() {
    console.info('MyComponent aboutToAppear');
  }

  // 组件生命周期
  aboutToDisappear() {
    console.info('MyComponent aboutToDisappear');
  }
}

@Component
struct Child {
  @State title: string = 'Hello World'
  @BuilderParam aBuilder0: () => void = this.doNothingBuilder;
  @BuilderParam aBuilder1: () => void = GlobalBuilder0;

  build() {
    Column() {
      Text(this.title).fontSize(22).onClick(event => {
        this.myClickHandler()
        this.calcTextValue()
        // this.doSomeCalculations()
      }).backgroundColor(Color.Red).margin({top:50})
      HelloComponent({
        message: '你好呀'
      })
      Divider()
      HelloComponent({
        message: '生而无畏，战至终章'
      })
      this.overBuilder({ paramsA: this.title, paramsB: this.title })
      Divider()
    }
    // 反例：不能调用没有用@Builder装饰的方法
    // this.doSomeCalculations();
    // 正例：可以调用
    // this.doSomeRender;
    // 正例：参数可以为调用TS方法的返回值
    // Text(this.calcTextValue())


  }

  aboutToDisappear() {
    console.info('[lifeCycle] Child aboutToDisappear')
  }

  aboutToAppear() {
    console.info('[lifeCycle] Child aboutToAppear')
  }

  myClickHandler(): void {
    this.title = 'myClickHandler你好呀'
  }

  doSomeCalculations() {
    this.title = 'doSomeCalculations你好呀'
  }

  calcTextValue(): string {
    return 'Hello World';
  }

  @Builder doSomeRender() {
    Text(`Hello World`)
  }

  @Builder overBuilder(params: Tmp) {
    Column() {
      Text("UseStateVarByReference:" + params.paramsA)
      Text("UseStateVarByReference:--- ${params.paramsA}")
    }
  }

  @Builder componentBuilder() {
    Text(`Parent builder`)
  }

  @Builder doNothingBuilder() {
  };
}

@Component
struct Child2 {
  textStr: string = "公共的内容"
  @State heightValue: number = 100

  build() {
    Column({ space: 10 }) {
      Text(this.textStr)
        .fontSize(20)
      Text('FancyB')
        .fontSize(30)
      Text('FancyA')
        .globalFancy()
        .fontSize(30)
      Text('Extend的用法').fancyText(12,13)
        .stateStyles({
          normal: normalStyle,
          pressed: pressedStyle,
        })
    }
  }

  // 定义在组件内的@Styles封装的样式
  @Styles fancy() {
    .width(200)
    .height(this.heightValue)
    .backgroundColor(Color.Yellow)
    .onClick(() => {
      this.heightValue = 200
    })
  }
}

@Builder function GlobalBuilder0() {
}

// 定义在全局的@Styles封装的样式
@Styles function globalFancy() {
  .width(150)
  .height(100)
  .backgroundColor(Color.Pink)
}

@Styles function normalStyle() {
  .backgroundColor(Color.Gray)
}

@Styles function pressedStyle() {
  .backgroundColor(Color.Red)
}

@Extend(Text)
function fancyText(weightValue: number,height:number, color: Color = Color.Red) {
  .fontStyle(FontStyle.Italic)
  .fontWeight(weightValue)
  .backgroundColor(color)
  .fontSize(20)
  .fontColor(Color.Black)
}



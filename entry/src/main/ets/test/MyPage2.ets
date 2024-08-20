@Entry
@Component
struct MainProgram {
  @State mainCounter: number = 10

  build() {
    Column() {
      // MyComponent({ customCounter: this.mainCounter })
      MyComponent({ customCounter: this.mainCounter })

      Text(`from Main:${this.mainCounter}`).fontColor(Color.Red).margin({ left: 110, top: 12 })

      Button('Click to change number')
        .width(288)
        .height(40)
        .margin({ left: 30, top: 12 })
        .fontColor('#FFFFFF，90%')
        .onClick(() => {
          this.mainCounter++
        })
    }
  }
}

@Component
struct MyComponent {
  @Prop customCounter: number;
  // @Prop customCounter2: number;

  build() {
    Column() {
      Row() {
        Text(`from Main:${this.customCounter}`).fontColor(Color.Red).margin({ left: 110, top: 212 })
      }

      Row() {
        Button('点击改变子组件的变量')
          .width(288)
          .height(60)
          .margin({ left: 10, top: 30 })
          .fontColor(Color.White)
          .onClick(() => {
            this.customCounter++
          })
      }

      Row() {
        Text(`Custom Local: ${this.customCounter}`).fontColor(Color.Black).margin({ left: 10, top: 32 })
      }
    }
  }
}

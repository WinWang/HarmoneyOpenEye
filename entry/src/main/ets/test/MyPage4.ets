@Component
struct CompD { // @Consume装饰的变量通过相同的属性名绑定其祖先组件CompA内的@Provide装饰的变量
  @Consume reviewVotes: number;

  build() {
    Column() {
      Text(`reviewVotes(${this.reviewVotes})`)
      Button(`reviewVotes(${this.reviewVotes}), give +1`).onClick(() => this.reviewVotes += 1)
    }.width('50%')
  }
}

@Component
struct CompC {
  build() {
    Column({ space: 5 }) {
      CompD()
      CompD()
    }
  }
}

@Component
struct CompB {
  build() {
    CompC()
  }
}

@Entry
@Component
struct CompA { // @Provide装饰的变量reviewVotes由入口组件CompA提供其后代组件
  @Provide reviewVotes: number = 0;

  build() {
    Column() {
      Button(`reviewVotes(${this.reviewVotes}), give +1`).onClick(() => this.reviewVotes += 1).margin(50)
      CompB()
      Parent()
    }
  }
}

@Component
struct Parent {
  @State simpleList: Array<string> = ['one', 'two', 'three'];

  build() {
    Row() {
      Column() {
        Text('点击修改第3个数组项的值').fontSize(24).fontColor(Color.Red).onClick(() => {
          this.simpleList[2] = 'new three';
        })
        ForEach(this.simpleList, (item: string) => {
          ChildItem({ itemS: item as string })
        }, (item: string, index: number) => item)
      }.width('100%').height('100%')
    }.height('100%').backgroundColor(0xF1F3F5)
  }
}


@Component
struct ChildItem {
  @Prop itemS: string;

  build() {
    Text(this.itemS).fontSize(50).onClick(() => {
      this.itemS = "123"
    })
  }
}
@Component
export struct MyChild{
  @BuilderParam bottomView:() => void


  build() {
    Column(){
      Text('MyChild').fontSize(30)
      this.bottomView()
    }

  }
}
@Component
export struct HelloComponent {
  @State message: string = "hello world"

  build() {
    Text(this.message).onClick(() => {
      this.message = 'hello arkUi'
    })
  }
}
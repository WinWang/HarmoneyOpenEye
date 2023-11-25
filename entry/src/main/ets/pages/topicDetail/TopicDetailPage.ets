import { CommonTopBar } from '../../component/CommonTopbar'
import { StateComponent } from '../../component/StateComponent'

@Entry
@Component
struct TopicDetailPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      CommonTopBar()
      // StateComponent(){
      //   List() {
      //
      //   }
      // }
    }
    .height("100%")
  }
}
import { StateComponent } from '../../../component/StateComponent'
import { ViewStateConstant } from '../../../constants/ViewStateConstant'
import { CategoryModel, CategoryModelChild } from '../../../model/CategoryModel'
import ImageRegexUtils from '../../../utils/ImageRegexUtils'
import CategoryViewModel from '../../../viewmodel/CategoryViewModel'

@Component
export struct CategoryPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State dataList: CategoryModel = []

  aboutToAppear() {
    CategoryViewModel.observeState((state) => this.viewState = state)
    this.loadNet()
  }

  loadNet() {
    CategoryViewModel.getCategoryDataList((result) => {
      this.dataList = result
    })
  }

  build() {
    Stack() {
      StateComponent({ viewState: this.viewState, retryCallback: () => {
        this.loadNet()
      } }) {
        Grid() {
          ForEach(this.dataList, (item: CategoryModelChild) => {
            GridItem() {
              Stack() {
                Image(ImageRegexUtils(item.bgPicture))
                Text(item.name)
                  .fontColor($r('app.color.color_white'))
                  .fontSize($r('app.float.size_text_20'))
                  .fontWeight(FontWeight.Bold)
              }
            }
          })
        }.gridSpan(2)
      }
    }
  }
}
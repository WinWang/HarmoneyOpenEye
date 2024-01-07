import { StateComponent } from '../../../views/StateComponent'
import { ViewStateConstant } from '../../../constants/ViewStateConstant'
import { BaseDataSourceWrapper } from '../../../model/BaseDataSourceWrapper'
import { CategoryModel, CategoryModelChild } from '../../../model/CategoryModel'
import { RoutePath } from '../../../route/RoutePath'
import { Router } from '../../../route/Router'
import ImageRegexUtils from '../../../utils/ImageRegexUtils'
import { LogUtils } from '../../../utils/LogUtils'
import CategoryViewModel from '../../../viewmodel/CategoryViewModel'

@Component
export struct CategoryPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State dataList: CategoryModel = []
  @State dataSource: BaseDataSourceWrapper<CategoryModelChild> = new BaseDataSourceWrapper<CategoryModelChild>([])
  @Consume @Watch("onHomeTabSelected") homeTabSelected: number
  @Consume @Watch("onFindTabSelectedIndex") findCurrentIndex: number
  private hasInit = false

  aboutToAppear() {
    CategoryViewModel.observeState((state) => this.viewState = state)
    if (this.hasInit) {
      this.loadNet()
    }
  }

  /**
   * 懒加载处理逻辑-监听主体页面的tab
   */
  onHomeTabSelected() {
    LogUtils.debug("Category-homeTabSelectedIndex>>>", `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  /**
   * 懒加载处理逻辑--监听发现页面的tab
   */
  onFindTabSelectedIndex() {
    LogUtils.debug("Category-onFindTabSelectedIndex>>>", `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  initData() {
    if (!this.hasInit && this.homeTabSelected == 1 && this.findCurrentIndex == 1) {
      this.loadNet()
      this.hasInit = true
    }
  }

  loadNet() {
    CategoryViewModel.getCategoryDataList((result) => {
      //数据缓存-当让也可以把数据缓存的逻辑放在DataSource里面，目前我做的是全部替换
      this.dataList = result
      this.dataSource = new BaseDataSourceWrapper<CategoryModelChild>(this.dataList)
    })
  }

  build() {
    Stack() {
      StateComponent({ viewState: this.viewState, retryCallback: () => {
        this.loadNet()
      } }) {
        Grid() {
          LazyForEach(this.dataSource, (item: CategoryModelChild, index: number) => {
            GridItem() {
              Stack() {
                Image(ImageRegexUtils(item.bgPicture))
                  .border({ radius: $r('app.float.size_5') })
                  .alt($r("app.media.back_placeholder"))
                Text(item.name)
                  .fontColor($r('app.color.color_white'))
                  .fontSize($r('app.float.size_text_20'))
                  .fontWeight(FontWeight.Bold)
              }.border({ radius: $r('app.float.size_5') })
            }.onClick(() => {
              Router.push(RoutePath.CategoryDetailPage, {
                "headerImage": item.headerImage,
                "title": item.name,
                "id": item.id
              })
            })
          })
        }
        .columnsTemplate('1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .height("100%")
        .padding({ left: 10, right: 10, top: 10, bottom: 50 })
      }
    }
  }
}
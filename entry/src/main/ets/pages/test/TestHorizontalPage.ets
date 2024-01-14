import { LogUtils } from '../../utils/LogUtils'
import { CommonTopBar } from '../../views/CommonTopBar'



/**
 * 这种方式实现的不可取，初始化N个Scroller+复用滚动同步太麻烦了
 */

@Entry
@Component
struct TestHorizontalPage {
  @State dataList: Array<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
  @State scrollIndex: number = -1
  private scrollList: Array<Scroller> = []

  async aboutToAppear() {
    this.dataList.forEach((item) => {
      this.scrollList.push(new Scroller())
    })
    LogUtils.debug(`>>>>>>>>${this.scrollList.length}`)
  }

  build() {
    Column() {
      CommonTopBar({ title: "联动滚动1", alpha: 1 })
      List() {
        ForEach(this.dataList, (item, index) => {
          ListItem() {
            Row() {
              Text(`左边${item}`).width(100).textAlign(TextAlign.Center)
              Scroll(this.scrollList[index]) {
                Row() {
                  Text(`第一列${item}`).width(100).textAlign(TextAlign.Center)
                  Text(`第二列${item}`).width(100).textAlign(TextAlign.Center)
                  Text(`第三列${item}`).width(100).textAlign(TextAlign.Center)
                  Text(`第四列${item}`).width(100).textAlign(TextAlign.Center)
                  Text(`第五列${item}`).width(100).textAlign(TextAlign.Center)
                  Text(`第六列${item}`).width(100).textAlign(TextAlign.Center)
                  Text(`第七列${item}`).width(100).textAlign(TextAlign.Center)
                }
                .height(100)
              }
              .scrollBar(BarState.Off)
              .flexShrink(1)
              .flexGrow(1)
              // .scrollable((this.scrollIndex == -1 || this.scrollIndex == index) ? ScrollDirection.Horizontal : ScrollDirection.None)
              .scrollable(ScrollDirection.Horizontal)
              .onScrollStart(() => {
                // if (this.scrollIndex != -1) {
                //   LogUtils.debug(`滚动的条目${this.scrollIndex}>>>>>>${index}`)
                //   return
                // }
                this.scrollIndex = index
              })
              .onScrollStop(() => {
                LogUtils.debug(`停止滚动的条目${this.scrollIndex}>>>>>>${index}`)
                if (this.scrollIndex == index) {
                  this.scrollIndex = -1
                }
              })
              // .onScrollFrameBegin((offset: number) => {
              //   if (this.scrollIndex == -1 || this.scrollIndex == index) {
              //     return { offsetRemain: offset }
              //   } else {
              //     return { offsetRemain: 0 }
              //   }
              // })
              .onScroll((xOffset, yOffset) => {
                LogUtils.debug(`滚动的条目${this.scrollIndex}`)
                if (index == this.scrollIndex) {
                  this.scrollList.forEach((scroller, Index) => {
                    if (index != Index) {
                      scroller.scrollBy(xOffset, 0)
                    }
                    LogUtils.debug(`>>>>>>>>${xOffset}`)
                  })
                }
              })
            }
            .width("100%")
            .height(100)
            // .enabled((this.scrollIndex == -1 || this.scrollIndex == index) ? true : false)
          }
        })
      }
      .width('100%')
      .height("100%")
      .cachedCount(100)
      .flexGrow(1)
    }
    .width("100%")
    .height("100%")
  }
}
import { LogUtils } from '../../utils/LogUtils'
import { CommonTopBar } from '../../views/CommonTopBar'

@Entry
@Component
struct TestHorizontalPage2 {
  private dataList: Array<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
  private leftScroller: Scroller = new Scroller()
  private rightScroller: Scroller = new Scroller()
  private scrollFlag = -1 // 1=左边   2=右边
  private scrollY = 0

  build() {
    Column() {
      CommonTopBar({ title: "联动滚动2", alpha: 1 })
      Row() {
        List({ scroller: this.leftScroller }) {
          ForEach(this.dataList, (item, index) => {
            ListItem() {
              Row() {
                Text(`左边${item}`).width(100).textAlign(TextAlign.Center)
              }
              .width("100%")
              .height(100)
              .backgroundColor(Color.Blue)
            }
          })
        }
        .width(100)
        .height("100%")
        .flexGrow(1)
        .onScrollStart(() => {
          LogUtils.debug(`滚动-左边--Start${this.scrollFlag}`)
          if (this.scrollFlag == -1) {
            this.scrollFlag = 1
          }
        })
        .onScrollStop(() => {
          LogUtils.debug(`滚动-左边--Stop${this.scrollFlag}`)
          this.scrollFlag = -1
        })
        .onScroll((scrollOffset, state) => {
          // let yOffset = this.rightScroller.currentOffset().yOffset
          if (this.scrollFlag == 1) {
            LogUtils.debug("滚动-左边")
            this.rightScroller.scrollBy(0, scrollOffset)
          }
        })
        .edgeEffect(EdgeEffect.None)

        Scroll() {
          List({ scroller: this.rightScroller }) {
            ForEach(this.dataList, (item, index) => {
              ListItem() {
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
            })
          }
          .height("100%")
          .width(700)
          .onScrollStart(() => {
            LogUtils.debug(`滚动-右边--Start${this.scrollFlag}`)
            if (this.scrollFlag == -1) {
              this.scrollFlag = 2
            }
          })
          .onScrollStop(() => {
            LogUtils.debug(`滚动-右边--Stop${this.scrollFlag}`)
            this.scrollFlag = -1
          })
          .onScroll((scrollOffset, state) => {
            // let yOffset = this.rightScroller.currentOffset().yOffset
            if (this.scrollFlag == 2) {
              LogUtils.debug("滚动-右边")
              this.leftScroller.scrollBy(0, scrollOffset)
            }
          })
          .edgeEffect(EdgeEffect.None)
        }
        .scrollable(ScrollDirection.Horizontal)
        .height("100%")
        .flexShrink(1)
      }
      .height("100%")
      .width("100%")
    }
  }
}
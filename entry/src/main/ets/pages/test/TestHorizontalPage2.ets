import { LogUtils } from '../../utils/LogUtils'
import { CommonTopBar } from '../../views/CommonTopBar'

@Entry
@Component
struct TestHorizontalPage2 {
  private dataList: Array<number> = []
  private leftScroller: Scroller = new Scroller()
  private rightScroller: Scroller = new Scroller()
  private scrollScroller: Scroller = new Scroller()
  private scrollFlag = -1 // 1=左边   2=右边
  private scrollY = 0
  @State xScroll: number = 0

  async aboutToAppear() {
    for (let index = 0; index < 100; index++) {
      this.dataList.push(index)
    }
  }

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
        .cachedCount(5)
        .height("100%")
        .flexGrow(1)
        .onScrollStart(() => {
          if (this.scrollFlag == -1) {
            this.scrollFlag = 1
          }
          LogUtils.debug(`滚动-左边--Start${this.scrollFlag}`)
        })
        .onReachStart(() => {
          this.scrollFlag = -1
        })
        .onReachEnd(() => {
          this.scrollFlag = -1
        })
        .onScrollStop(() => {
          LogUtils.debug(`滚动-左边--Stop${this.scrollFlag}`)
          this.scrollFlag = -1
        })
        .onScroll((scrollOffset, state) => {
          let yOffset = this.leftScroller.currentOffset().yOffset
          LogUtils.debug(`滚动-左边>${yOffset}`)
          if (this.scrollFlag == 1) {
            this.rightScroller.scrollBy(0, scrollOffset)
            this.scrollY = yOffset
            // this.rightScroller.scrollTo({ xOffset: 0, yOffset: yOffset })
          }
        })
        .onScrollFrameBegin((offset: number) => {
          LogUtils.debug(`滚动-左边Frame`)
          return { offsetRemain: Math.floor(offset) }
        })
        .edgeEffect(EdgeEffect.None)

        Scroll(this.scrollScroller) {
          List({ scroller: this.rightScroller }) {
            ForEach(this.dataList, (item, index) => {
              ListItem() {
                Stack({ alignContent: Alignment.Start }) {
                  Row() {
                    Text(`第1列${item}`).width(100).textAlign(TextAlign.Center)
                    Text(`第二列${item}`).width(100).textAlign(TextAlign.Center)
                    Text(`第三列${item}`).width(100).textAlign(TextAlign.Center)
                    Text(`第四列${item}`).width(100).textAlign(TextAlign.Center)
                    Text(`第五列${item}`).width(100).textAlign(TextAlign.Center)
                    Text(`第六列${item}`).width(100).textAlign(TextAlign.Center)
                    Text(`第七列${item}`).width(100).textAlign(TextAlign.Center)
                  }
                  .height(100)
                  .zIndex(0)

                  Text(`第一列${item}`)
                    .width(100)
                    .textAlign(TextAlign.Center)
                    .height(100)
                    .zIndex(1)
                    .position({ x: this.xScroll, y: 0 })
                    .markAnchor({ x: 0, y: 0 })
                    .backgroundColor(Color.White)
                }
                .height(100)
              }
            })
          }
          .height("100%")
          .width(700)
          .cachedCount(5)
          .onScrollStart(() => {
            if (this.scrollFlag == -1) {
              this.scrollFlag = 2
            }
            LogUtils.debug(`滚动-右边--Start${this.scrollFlag}`)
          })
          .onScrollStop(() => {
            LogUtils.debug(`滚动-右边--Stop${this.scrollFlag}`)
            if (this.scrollFlag == 2) {
              let yOffset = this.rightScroller.currentOffset().yOffset
              this.leftScroller.scrollTo({ yOffset: yOffset, xOffset: 0 })
            }
            this.scrollFlag = -1
          })
          .onScroll((scrollOffset, state) => {
            let yOffset = this.rightScroller.currentOffset().yOffset
            LogUtils.debug(`滚动-右边>${yOffset}`)
            if (this.scrollFlag == 2) {
              this.leftScroller.scrollBy(0, scrollOffset)
              this.scrollY = yOffset
              // this.leftScroller.scrollTo({ xOffset: 0, yOffset: yOffset })
            }
          })
          .onReachStart(() => {
            this.scrollFlag = -1
          })
          .onReachEnd(() => {
            this.scrollFlag = -1
          })
          .onScrollFrameBegin((offset: number) => {
            LogUtils.debug(`滚动-右边Frame`)
            return { offsetRemain: Math.floor(offset) }
          })
          .edgeEffect(EdgeEffect.None)
        }
        .scrollable(ScrollDirection.Horizontal)
        .height("100%")
        .flexShrink(1)
        .onScroll((xOffset: number, yOffset: number) => {
          let offsetX = this.scrollScroller.currentOffset().xOffset;
          this.xScroll = offsetX
          LogUtils.debug(`1>>>>>${this.xScroll}`)
        })
        .onScrollFrameBegin((offset, state) => {
          let offsetX = this.scrollScroller.currentOffset().xOffset;
          LogUtils.debug(`2>>>>>${offset}>>>>>>${offsetX}`)
          return { offsetRemain: offset/2 }
        })
      }
      .height("100%")
      .width("100%")
    }
  }
}
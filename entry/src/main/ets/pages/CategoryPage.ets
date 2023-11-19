import { DetailListComponent } from '../view/DetailListComponent';
import { SideListComponent } from '../view/SideListComponent';
import { TopComponent } from '../view/TopComponent';
import { CommonConstants } from '../common/constants/CommonConstants';
import type { TabItem } from '../common/bean/TabItem';
import CategoryViewModel from '../viewmodel/CategoryViewModel';

/**
 * This module template implements Category functions.
 * The left and right sides of the page are linked. Click the left option and
 * the right list will slide to the specified position, and vice versa.
 * Developers can add corresponding data as needed after creating a template.
 */
@Entry
@Component
struct CategoryPage {
  @State categoryTabIndex: number = 1;
  @State currentBreakpoint: string = CommonConstants.BREAK_POINT_SM;
  @State scrollerIndex: number = 1;
  scroller: Scroller;

  build() {
    Column() {
      Text($r('app.string.title'))
        .height($r('app.float.text_title_height'))
        .fontSize($r('app.float.title_font_size'))
        .fontWeight(CommonConstants.TITLE_FONT_WEIGHT)
        .textAlign(TextAlign.Start)
      Tabs({
        index: this.categoryTabIndex,
        barPosition: this.currentBreakpoint === CommonConstants.BREAK_POINT_LG ?
          BarPosition.Start : BarPosition.End
      }) {
        ForEach(CategoryViewModel.getTabItems(), (item: TabItem, index: number) => {
          TabContent() {
            GridRow({
              columns: {
                sm: CommonConstants.COLUMN_SM,
                md: CommonConstants.COLUMN_MD,
                lg: CommonConstants.COLUMN_LG
              },
              breakpoints: {
                value: CommonConstants.BREAK_POINTS_VALUE,
                reference: BreakpointsReference.WindowSize
              },
              gutter: { x: CommonConstants.GUTTER_X }
            }) {
              GridCol({
                span: {
                  sm: CommonConstants.TOP_SPAN_SM,
                  md: CommonConstants.TOP_SPAN_MD,
                  lg: CommonConstants.TOP_SPAN_LG
                }
              }) {
                TopComponent()
              }

              GridCol({
                span: {
                  sm: CommonConstants.SIDE_LIST_SPAN_SM,
                  md: CommonConstants.SIDE_LIST_SPAN_MD,
                  lg: CommonConstants.SIDE_LIST_SPAN_LG
                }
              }) {
                SideListComponent({
                  sideListBreakpoint: this.currentBreakpoint,
                  sideListIndex: $scrollerIndex,
                  scroller: this.scroller = new Scroller()
                })
              }

              GridCol({
                span: {
                  sm: CommonConstants.DETAIL_LIST_SPAN_SM,
                  md: CommonConstants.DETAIL_LIST_SPAN_MD,
                  lg: CommonConstants.DETAIL_LIST_SPAN_LG
                }
              }) {
                DetailListComponent({
                  detailListBreakpoint: this.currentBreakpoint,
                  sideListIndex: $scrollerIndex,
                  scroller: this.scroller
                })
                  .margin( {
                    top: $r('app.float.detail_list_text_margin_top')
                  })
              }
            }
            .margin({
              left: $r('app.float.grid_row_margin_left'),
              right: $r('app.float.grid_row_margin_right')
            })
            .onBreakpointChange((currentBreakpoint: string) => {
              this.currentBreakpoint = currentBreakpoint;
            })
          }
          .tabBar(this.TabBottom(item, index))
        }, (item, index) => index + JSON.stringify(item))
      }
      .layoutWeight(CommonConstants.TAB_LAYOUT_WEIGHT)
      .vertical(this.currentBreakpoint === CommonConstants.BREAK_POINT_LG)
      .barWidth(this.currentBreakpoint === CommonConstants.BREAK_POINT_LG ?
        $r('app.float.tab_bar_width') : CommonConstants.FULL_WIDTH_PERCENT)
      .barHeight(this.currentBreakpoint === CommonConstants.BREAK_POINT_LG ?
        CommonConstants.HALF_HEIGHT_PERCENT : $r('app.float.tab_bar_height'))
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.categoryTabIndex = index;
      })
    }
    .backgroundColor($r('app.color.category_background'))
  }

  @Builder TabBottom(item: TabItem, index: number) {
    Column() {
      Image(this.categoryTabIndex === index ? item.imageActivated : item.imageOriginal)
        .height($r('app.float.tab_image_size'))
        .width($r('app.float.tab_image_size'))
        .margin({
          top: $r('app.float.tab_margin_top'),
          bottom: $r('app.float.tab_margin_bottom')
        })

      Text(item.title)
        .width(CommonConstants.FULL_WIDTH_PERCENT)
        .height($r('app.float.tab_text_height'))
        .fontSize($r('app.float.tab_text_font_size'))
        .fontWeight(CommonConstants.TAB_ITEM_FONT_WEIGHT)
        .fontColor(this.categoryTabIndex === index ?
          $r('app.color.tab_text_activated') : $r('app.color.tab_text_normal'))
        .textAlign(TextAlign.Center)
        .margin({
          bottom: $r('app.float.tab_text_margin_bottom')
        })
    }
    .justifyContent(FlexAlign.Center)
    .height(CommonConstants.FULL_HEIGHT_PERCENT)
    .width(CommonConstants.FULL_WIDTH_PERCENT)
  }
}
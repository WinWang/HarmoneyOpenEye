/**
 * Common constants for all features.
 */
export class CommonConstants {
  /**
   * Search weight.
   */
  static readonly SEARCH_WEIGHT: number = 10;

  /**
   * The divider stroke width.
   */
  static readonly DIVIDER_STROKE_WIDTH: number = 1;

  /**
   * The offset of detail list for LG device.
   */
  static readonly DETAIL_LIST_OFFSET_LG: number = 1;

  /**
   * The offset of detail list for MD device.
   */
  static readonly DETAIL_LIST_OFFSET_MD: number = 1;

  /**
   * The span of detail list for LG device.
   */
  static readonly DETAIL_LIST_SPAN_LG: number = 9;

  /**
   * The span of detail list for MD device.
   */
  static readonly DETAIL_LIST_SPAN_MD: number = 6;

  /**
   * The span of detail list for SM device.
   */
  static readonly DETAIL_LIST_SPAN_SM: number = 3;

  /**
   * The span of side list for SM device.
   */
  static readonly SIDE_LIST_SPAN_SM: number = 1;

  /**
   * The span of side list for MD device.
   */
  static readonly SIDE_LIST_SPAN_MD: number = 2;

  /**
   * The span of side list for LG device.
   */
  static readonly SIDE_LIST_SPAN_LG: number = 2;

  /**
   * The span of top component for LG device.
   */
  static readonly TOP_SPAN_LG: number = 12;

  /**
   * The span of top component for MD device.
   */
  static readonly TOP_SPAN_MD: number = 8;

  /**
   * The span of top component for SM device.
   */
  static readonly TOP_SPAN_SM: number = 4;

  /**
   * The columns for LG device.
   */
  static readonly COLUMN_LG: number = 12;

  /**
   * The columns for MD device.
   */
  static readonly COLUMN_MD: number = 8;

  /**
   * The columns for SM device.
   */
  static readonly COLUMN_SM: number = 4;

  /**
   * The columns of grid columns gap except SM device.
   */
  static readonly GRID_COLUMNS_GAP_NORMAL: number = 24;

  /**
   * The columns of grid columns gap for SM device.
   */
  static readonly GRID_COLUMNS_GAP_SM: number = 12;

  /**
   * The gutter for all devices.
   */
  static readonly GUTTER_X: number = vp2px(24);

  /**
   * The break point value.
   */
  static readonly BREAK_POINTS_VALUE: Array<string> = ['320vp', '600vp', '840vp'];

  /**
   * Three item template of Grid.
   */
  static readonly GRID_TEMPLATE_THREE: string = '1fr 1fr 1fr';

  /**
   * Two item template of Grid.
   */
  static readonly GRID_TEMPLATE_TWO: string = '1fr 1fr';

  /**
   * Break point is sm.
   */
  static readonly BREAK_POINT_SM: string = 'sm';

  /**
   * Break point is lg.
   */
  static readonly BREAK_POINT_LG: string = 'lg';

  /**
   * The placeholder of search component.Currently, component interfaces do not support the Resource type.
   * Therefore, you need to define constants. The default prompt in the search box does not support
   * internationalization.
   */
  static readonly SEARCH_PLACEHOLDER: string = 'Search...';

  /**
   * Search font family.
   */
  static readonly SEARCH_FONT_FAMILY: string = 'serif';

  /**
   * The font weight of text in the index list.
   */
  static readonly INDEX_LIST_FONT_WEIGHT: number = 400;

  /**
   * Size of index list and detail list.
   */
  static readonly LIST_SIZE: number = 6;

  /**
   * The font weight of text in the detail list.
   */
  static readonly DETAIL_LIST_FONT_WEIGHT: number = 500;

  /**
   * The font weight of text in the tab.
   */
  static readonly TAB_ITEM_FONT_WEIGHT: number = 500;

  /**
   * Size of tab bar.
   */
  static readonly TAB_BAR_SIZE: number = 5;

  /**
   * Tab layout weight.
   */
  static readonly TAB_LAYOUT_WEIGHT: number = 1;

  /**
   * The font weight of title.
   */
  static readonly TITLE_FONT_WEIGHT: number = 500;

  /**
   * The font weight of subtitle.
   */
  static readonly SUBTITLE_FONT_WEIGHT: number = 400;

  /**
   * Size of detail item.
   */
  static readonly DETAIL_ITEM_SIZE: number = 6;

  /**
   * The percentage of the full width.
   */
  static readonly FULL_WIDTH_PERCENT: string = '100%';

  /**
   * The percentage of the full height.
   */
  static readonly FULL_HEIGHT_PERCENT: string = '100%';

  /**
   * The percentage of the half height.
   */
  static readonly HALF_HEIGHT_PERCENT: string = '50%';

  /**
   * 设备UUID
   * @type {string}
   */
  static readonly UUID = "3e7ee30c6fc0004a773dc33b0597b5732b145c04";

  /**
   * 设备号
   * @type {string}
   */
  static readonly DEVICE_NUM = "ONEPLUS%20A6000"
}
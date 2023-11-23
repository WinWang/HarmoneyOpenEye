/**
 * 页面状态
 */
export class ViewStateConstant {
  //加载中
  static readonly VIEW_STATE_LOADING: string = "view_state_loading"
  //成功
  static readonly VIEW_STATE_SUCCESS: string = "view_state_success"
  //错误
  static readonly VIEW_STATE_ERROR: string = "view_state_error"
  //网络异常
  static readonly VIEW_STATE_NETWORK_ERROR: string = "view_state_network_error"
  //空页面
  static readonly VIEW_STATE_EMPTY: string = "view_state_empty"
}

// export enum ViewState {
//   LOADING,
//   SUCCESS,
//   ERROR,
//   NETWORK_ERROR,
//   EMPTY,
// }
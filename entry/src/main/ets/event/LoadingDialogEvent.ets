/**
 * 展示Loading的Event
 * @param showLoading
 * @param "
 * @returns
 */
export function LoadingDialogEvent(showLoading: boolean, loadingTips: string = "加载中...") {
  return {
    data: {
      "showLoading": showLoading,
      "loadingTips": loadingTips
    }
  }
}

import emitter from '@ohos.events.emitter'
import { loadingEvent } from '../event/EventKeys'
import { LoadingDialogEvent } from '../event/LoadingDialogEvent'

/**
 * 展示loading
 * @param tips
 */
export function showLoadingDialog(tips: string = "加载中") {
  emitter.emit(loadingEvent, LoadingDialogEvent(true, tips))
}

/**
 * 隐藏loading
 */
export function hideLoadingDialog() {
  emitter.emit(loadingEvent, LoadingDialogEvent(false, ""))
}
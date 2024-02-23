/**
 * 事件的EventNum
 */
import { emitter } from '@kit.BasicServicesKit'

export class EventKeys {
  //展示loading的事件处理EventID
  static readonly LOADING_DIALOG_EVENT = 0x10000
}

/**
 * 对应的事件
 */
export const loadingEvent: emitter.InnerEvent = {
  eventId: EventKeys.LOADING_DIALOG_EVENT
}

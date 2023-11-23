import useRequestStatus from '../hooks/useRequestStatus';
import { getHomeListAxios } from '../http/apiService';
import { LogUtils } from '../utils/LogUtils';
import showToast from '../utils/ToastUtils';
import { BaseViewModel } from './BaseViewModel';

export class FindViewModel extends BaseViewModel {
  /**
   * 获取首页接口数据
   * @param callback
   * @returns
   */
  async getDataList(callback?: (state: string) => void) {
    return await useRequestStatus((state) => {
      console.log('Updated state:', state);
      callback?.(state)
      showToast(">>>>>" + state)
    }).promise(getHomeListAxios("")).then((res) => {
      // ToastUtils.showToast("这是我的正确相应")
      LogUtils.debug("error>>>>>" + res)
      LogUtils.debug("HomeTag", "error>>>>>" + res)
    }).catch((e) => {
      // ToastUtils.showToast("这是我的错误相应")
      showToast(">>>>>" + e.toString())
      LogUtils.debug("error>>>>>" + e)

    })
  }
}

let findViewModel = new FindViewModel()

export default findViewModel as FindViewModel
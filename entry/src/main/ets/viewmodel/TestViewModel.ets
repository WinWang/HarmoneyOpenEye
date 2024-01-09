import { getWanAndroidBanner } from '../http/apiService';
import { LogUtils } from '../utils/LogUtils';
import { BaseViewModel, ResultCallback } from './BaseViewModel';
/**
 * 测试数据类ViewModel
 */
export class TestViewModel extends BaseViewModel {
  async getHomeBanner(resultCallback?: ResultCallback) {
    await this.httpRequest(true)
      .promise(getWanAndroidBanner())
      .then((result) => {
        LogUtils.debug(`>>>>>>${JSON.stringify(result.data, null, 2)}`)
        resultCallback?.(result.data)
      })
  }
}

let testViewModel = new TestViewModel()

export default testViewModel as TestViewModel

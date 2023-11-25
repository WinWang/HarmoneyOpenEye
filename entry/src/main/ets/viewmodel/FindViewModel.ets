import useRequestStatus from '../http/useRequestStatus';
import { getHomeListAxios } from '../http/apiService';
import { LogUtils } from '../utils/LogUtils';
import { BaseViewModel } from './BaseViewModel';

export class FindViewModel extends BaseViewModel {
  tabTitle = [
    {
      index: 0,
      title: "关注"
    },
    {
      index: 1,
      title: "分类"
    },
    {
      index: 2,
      title: "主题"
    }
  ]


  /**
   * 获取首页接口数据
   * @param callback
   * @returns
   */
  async getDataList(callback?: (state: string) => void) {
    return await useRequestStatus((state) => {
      callback?.(state)
    }).promise(getHomeListAxios("")).then((res) => {
      LogUtils.debug("error>>>>>" + res)
      LogUtils.debug("HomeTag", "error>>>>>" + res)
    }).catch((e) => {
      LogUtils.debug("error>>>>>" + e)
    })
  }
}

let findViewModel = new FindViewModel()

export default findViewModel as FindViewModel
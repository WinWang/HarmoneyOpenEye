import { ViewStateConstant } from '../constants/ViewStateConstant';
import { ApiResponse } from './AxiosHttp';
import axios from "@ohos/axios"


/**
 * 定义请求状态的hooks，根据请求接口来使用,需要配置页面多状态的StateComponent一起使用
 * 本来想类似React或Vue中使用hook的方式，但是ArkTs没有组件状态共享在组件外使用的方法，退而求其次使用回调实现
 */
type LoadStateResult = {
  promise: <T>(requestPromise: Promise<T>, showLoadingState?: boolean) => Promise<T>
}

const useRequestStatus = (stateCallback?: (state: string) => void, checkResult: boolean = false): LoadStateResult => {

  function updateViewState(state: string) {
    stateCallback?.(state)
  }

  function run<T>(requestPromise: Promise<T>, showLoadingState: boolean): Promise<T> {
    if (showLoadingState !== false) {
      updateViewState(ViewStateConstant.VIEW_STATE_LOADING)
    }
    return new Promise<T>((resolve, reject) => {
      requestPromise.then((res) => {
        if (checkResult) {
          const result = res as unknown as ApiResponse;
          const resultData = result.data;
          if (result.errorCode !== 0) {
            updateViewState(ViewStateConstant.VIEW_STATE_ERROR)
          } else if (Array.isArray(resultData) && resultData.length === 0) {
            updateViewState(ViewStateConstant.VIEW_STATE_EMPTY)
          } else {
            updateViewState(ViewStateConstant.VIEW_STATE_SUCCESS)
          }
        } else {
          updateViewState(ViewStateConstant.VIEW_STATE_SUCCESS)
        }
        resolve(res);
      }).catch((error) => {
        if (axios.isAxiosError(error)) {
          updateViewState(ViewStateConstant.VIEW_STATE_NETWORK_ERROR)
        } else {
          updateViewState(ViewStateConstant.VIEW_STATE_ERROR)
        }
        reject(error);
      })
    })
  }

  return { promise: run };
}

export default useRequestStatus;


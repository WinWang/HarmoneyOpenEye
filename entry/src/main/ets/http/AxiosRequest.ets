import AxiosHttpRequest from './AxiosHttp'
import { AxiosError, AxiosRequestHeaders } from '@ohos/axios';
import { LogUtils } from '../utils/LogUtils';
import showToast from '../utils/ToastUtils';

/**
 * axios请求客户端创建
 */
const axiosClient = new AxiosHttpRequest({
  baseURL: "/api",
  timeout: 10 * 1000,
  checkResultCode: false,
  headers: {
    'Content-Type': 'application/json'
  } as AxiosRequestHeaders,
  interceptorHooks: {
    requestInterceptor: (config) => {
      // 在发送请求之前做一些处理，例如打印请求信息
      LogUtils.debug('网络请求Request 请求方法:', `${config.method}`);
      LogUtils.debug('网络请求Request 请求链接:', `${config.url}`);
      LogUtils.debug('网络请求Request Params:', `\n${JSON.stringify(config.params, null, 2)}`);
      LogUtils.debug('网络请求Request Data:', `${JSON.stringify(config.data, null, 2)}`);
      // if (config.showLoading) {
      //   globalStore.setLoading(true)
      // }
      // if (config.checkLoginState) {
      //   StorageUtil.getValue<boolean>(LoginKey, (hasLogin) => {
      //     if (hasLogin) {
      //       return config
      //     } else {
      //       throw new AxiosError("请登录")
      //     }
      //   })
      // }
      return config;
    },
    requestInterceptorCatch: (err) => {
      LogUtils.error("网络请求RequestError", err.toString())
      // globalStore.setLoading(false)
      return err;
    },
    responseInterceptor: (response) => {
      //优先执行自己的请求响应拦截器，在执行通用请求request的
      // globalStore.setLoading(false)
      LogUtils.debug('网络请求响应Response:', `\n${JSON.stringify(response.data, null, 2)}`);
      if (response.status === 200) {
        // @ts-ignore
        const checkResultCode = response.config.checkResultCode
        if (checkResultCode && response.data.errorCode != 0) {
          showToast(response.data.errorMsg)
          return Promise.reject(response)
        }
        return Promise.resolve(response.data);
      } else {
        return Promise.reject(response);
      }
    },
    responseInterceptorCatch: (error) => {
      // globalStore.setLoading(false)
      LogUtils.error("网络请求响应异常", error.toString())
      errorHandler(error);
      return Promise.reject(error);
    },
  }
});

export function errorHandler(error: any) {
  if (error instanceof AxiosError) {
    showToast(error.message)
  } else if (error != undefined && error.response != undefined && error.response.status) {
    switch (error.response.status) {
    // 401: 未登录
    // 未登录则跳转登录页面，并携带当前页面的路径
    // 在登录成功后返回当前页面，这一步需要在登录页操作。
      case 401:

        break;
    // 403 token过期
    // 登录过期对用户进行提示
    // 清除本地token和清空vuex中token对象
    // 跳转登录页面
      case 403:
        showToast("登录过期，请重新登录")
      // 清除token
      // localStorage.removeItem('token');
        break;
    // 404请求不存在
      case 404:
        showToast("网络请求不存在")
        break;

    // 其他错误，直接抛出错误提示
      default:
        showToast(error.response.data.message)
    }

  }
}

export default axiosClient;

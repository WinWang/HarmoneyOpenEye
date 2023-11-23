import http from '@ohos.net.http';
import showToast from '../utils/ToastUtils';
import HttpBuilder from './http';

//接口发送超时
const READ_TIMEOUT = 100000
//接口读取超时
const CONNECT_TIMEOUT = 100000


const httpClient = new HttpBuilder({
  readTimeout: READ_TIMEOUT,
  connectTimeout: CONNECT_TIMEOUT
})


export function errorHandler(error: any) {
  if (error != undefined && error.response != undefined && error.response.status) {
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

export default httpClient


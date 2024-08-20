import { AxiosRequestHeaders, AxiosResponse, AxiosError } from '@ohos/axios';
import { StorageKeys } from '../../constants/StorageKeys';
import { CommonType } from '../../model/typeAlias/TypeAlias';
import { RoutePath } from '../../route/RoutePath';
import { showLoadingDialog, hideLoadingDialog } from '../../utils/DialogUtils';
import { JsonUtils } from '../../utils/JsonUtils';
import { LogUtils } from '../../utils/LogUtils';
import { StorageUtils } from '../../utils/StorageUtils';
import showToast from '../../utils/ToastUtils';
import AxiosHttpRequest, { HttpRequestConfig } from '../AxiosHttp';
import { Router } from '../../route/Router';
import { HandleUrlParams } from './HandleUrlParams';
import { signKey } from './SignHelper';

/**
 * axios请求客户端创建
 */
const axiosClientNew = new AxiosHttpRequest({
  baseURL: "/api",
  timeout: 10 * 1000,
  checkResultCode: false,
  headers: {
    'Content-Type': 'application/json'
  } as AxiosRequestHeaders,
  interceptorHooks: {
    requestInterceptor: async (config) => {
      // 在发送请求之前做一些处理，例如打印请求信息
      LogUtils.debug('网络请求Request 请求方法:', `${config.method}`);
      LogUtils.debug('网络请求Request 请求链接:', `${config.url}`);
      LogUtils.debug('网络请求Request Params:', `\n${JsonUtils.stringify(config.params)}`);
      LogUtils.debug('网络请求Request Data:', `${JsonUtils.stringify(config.data)}`);
      axiosClientNew.config.showLoading = config.showLoading
      if (config.showLoading) {
        showLoadingDialog("加载中...")
      }
      if (config.checkLoginState)  { //请求之前判断是否已经登录
        let hasLogin = await StorageUtils.get(StorageKeys.USER_LOGIN, false)
        LogUtils.debug('网络请求Request 登录状态校验>>>', `${hasLogin.toString()}`);
        if (hasLogin) {
          return config
        } else {
          if (config.needJumpToLogin) {
            Router.push(RoutePath.TestPage)
          }
          throw new Error("请登录")
        }
      }
      //对请求参数进行加密
      if (config.url?.includes('://beta')) { //如果是测试环境

        
      }else { //如果是线上环境
        // 只处理GET请求
        if (config.method === 'get' && config.params) {

          // 加密查询字符串
          // const encryptedQueryString = encryptQuery(queryString);
          // 将加密后的查询字符串附加到URL上（注意：这里假设原始URL不包含查询参数）
          // 如果原始URL包含查询参数，你需要先解析URL，然后添加或替换查询参数
          // config.url += `?${encryptedQueryString}`;
          // 清除原始params，因为它们已经被加密并附加到URL上了
          let params = JsonUtils.stringify(config.params)
          LogUtils.debug("des",`请求参数转成字符串是：${params}`)

          let map = JsonUtils.jsonParseMap2(params)
          LogUtils.debug("des",`请求参数转成map是：${map}`)
          let paramsList = HandleUrlParams.makeParamsToList(map)

          LogUtils.debug("des",`请求参数转成list是：${paramsList}`)
          let url = HandleUrlParams.createSignUrl(config.url+"",paramsList)
          config.url = url

        }

      }

      return config;
    },
    requestInterceptorCatch: (err) => {
      LogUtils.error("网络请求RequestError", err.toString())
      if (axiosClientNew.config.showLoading) {
        hideLoadingDialog()
      }
      return err;
    },
    responseInterceptor: (response: AxiosResponse) => {  //拦截返回的数据
      //优先执行自己的请求响应拦截器，在执行通用请求request的
      if (axiosClientNew.config.showLoading) {
        hideLoadingDialog()
      }
      LogUtils.debug('网络请求响应Response:', `\n${JsonUtils.stringify(response.data)}`);
      LogUtils.debug("---解密前返回的json数据为:" + `\n${JsonUtils.stringify(response.data)}`);

      let responseStr = JsonUtils.stringify(response.data)
      let httpUrl = response.config.url
      let desKey = signKey(httpUrl);
      let result = HandleUrlParams.parseResult(response.data,desKey);
      LogUtils.debug("\n---解密后返回的json数据为:" + `\n${result}}`);

      // String json = result.replace("\"Data\":[]", "\"Data\":{}");


      if (response.status === 200) {
        let config = response.config as HttpRequestConfig
        const checkResultCode = config.checkResultCode
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
      if (axiosClientNew.config.showLoading) {
        hideLoadingDialog()
      }
      LogUtils.error("网络请求响应异常", error.toString())
      errorHandler(error);
      return Promise.reject(error);
    },
  }
});

export function errorHandler(error: CommonType) {
  if (error instanceof AxiosError) {
    showToast(error.message)
  }
}

export default axiosClientNew;

import { LogUtils } from '../../utils/LogUtils';
import { BaseUtils } from './BaseUtils';
import DESUtil from './DESUtil';
import { getSignValue } from './SignHelper';
import { TextUtils } from './TextUtils';
import { UrlNameValuePair } from './UrlNameValuePair';


export class HandleUrlParams {
  //get方式
  public static createSignUrl(baseUrl: string, params: UrlNameValuePair[]): string {

    LogUtils.debug('TAG', `createSignUrl :${baseUrl}`);
    if (params === null) {
      params = [];
    }
    params = HandleUrlParams.fixUrlParams(baseUrl, params);
    baseUrl = HandleUrlParams.getBaseUrl(baseUrl);
    let sign: string | null = null; //添加sign加密参数

    sign = getSignValue(params);

    LogUtils.debug(`加密后的sign值是${sign}`)

    // 动态生成sign，防止url中拼接出现多个sign，误导服务端
    try {
      for (let i = 0; i < params.length; i++) {
        // 去除sign
        if (params[i] !== null && params[i].getName() !== '' && params[i].getName().toLowerCase() === 'sign') {
          params.splice(i, 1);
          break;
        }
      }
    } catch (e) {
    }
    params.push(new UrlNameValuePair('sign', sign + ''))

    let stringBuilder: string[] = []; //最后拼接的url
    stringBuilder.push(baseUrl);

    if (!baseUrl?.includes('?')) {
      stringBuilder?.push("?");
    }
    //拼接所有参数
    for (const param of params) {
      if ('?' != baseUrl.charAt(baseUrl.length - 1)) {
        stringBuilder.push("&");
      }

      if (TextUtils.isEmpty(param.getName())) {
        stringBuilder.push(param.getName(), '');
      } else {
        stringBuilder.push(param.getName(), "=", encodeURIComponent(param.getValue()));
      }
    }
    LogUtils.debug('fw_rsa', `最后生成的url:${stringBuilder.join('')}`);

    return stringBuilder.join('');
  }


  //添加公共参数
  public static addCommonData(params: Map<string, string>): Map<string, string> {
    params.set('platform', '1');
    params.set('v', BaseUtils.getVerCode());
    params.set('ch', BaseUtils.getChannel());
    params.set('_t', String(Date.now()));

    return params;
  }

  public static makePair(params: UrlNameValuePair[], key: string, value: string): void {
    if (!key || !params) {
      return;
    }
    for (let i = 0; i < params.length; i++) {
      let get_value = params[i];
      if (!get_value || !get_value.getName()) {
        continue;
      }
      if (key === get_value.getName()) {
        return;
      }
    }
    params.push(new UrlNameValuePair(key, value));
  }


  public static fixUrlParams(baseUrl: string, params: UrlNameValuePair[]): UrlNameValuePair[] {
    try {
      const urlParam = baseUrl.split("?");
      if (urlParam.length > 1) {
        const urlParamsString = urlParam[1];
        const urlParamArr = urlParamsString.split("&");
        for (const par of urlParamArr) {
          const parArr = par.split("=");
          if (parArr.length > 1) {
            if (parArr[0] && parArr[0].toLowerCase() !== "sign") {
              HandleUrlParams.makePair(params, parArr[0], parArr[1]);
            }
          }
        }
      }
      return params;
    } catch (e) {
    }
    return [];
  }


  public static getBaseUrl(httpUrl: string): string {
    try {
      const urlParam = httpUrl.split("\\?");
      if (urlParam != null && urlParam.length > 1) {
        const urlParamsString = urlParam[0];
        if (!TextUtils.isEmpty(urlParamsString)) {
          return urlParamsString;
        }
      }
    } catch (e) {
      return ''
    }
    return httpUrl;
  }

  public static makeParamsToList(hashMap: Map<string, string>): UrlNameValuePair[] {
    HandleUrlParams.addCommonData(hashMap)
    let urlNameValuePairList: UrlNameValuePair[] = [];

    if (!hashMap || hashMap.size <= 0) {
      return urlNameValuePairList;
    }

    hashMap.forEach((value, key) => {
      HandleUrlParams.makePair(urlNameValuePairList, key, value);
    });
    return urlNameValuePairList;
  }

  public static parseResult(inputData: string, desKey: string = ''): string {
    LogUtils.debug("parseResult base64Data:" + inputData);
    LogUtils.debug("parseResult desKey:" + desKey);
    // 如果desKey为null的话表示不加密,直接返回元数据
    if (TextUtils.isEmpty(inputData) || TextUtils.isEmpty(desKey)) {
      return inputData;
    }
    try {
      let result = DESUtil.decryptSync(inputData, desKey)
      return result;
    } catch (e) {
      return inputData;
    }
  }
}


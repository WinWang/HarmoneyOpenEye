import { CommonConstants } from '../../constants/CommonConstants';
import { LogUtils } from '../../utils/LogUtils';
import { md5LowerCase } from './MD5Util';
import { TextUtils } from './TextUtils';
import { UrlNameValuePair } from './UrlNameValuePair';

const TAG = "SignHelper";

export function getSignValue(params: UrlNameValuePair[]): string {
  if (!params || params.length === 0) {
    return '';
  }

  // 按 key 排序
  params.sort((a, b) => a.getName().localeCompare(b.getName()));

  let sb = '';
  for (let i = 0; i < params.length; i++) {
    const param = params[i];
    LogUtils.debug(TAG, `${param.getName()}=${param.getValue()}`);

    //不参与签名
    if (TextUtils.isEmpty(param.getName()) || TextUtils.isEmpty(param.getValue()) || !param.getValue() || param.getName().toLowerCase() === 'sign' || param.getName().toLowerCase() === '_callback') {
      continue;
    }

    sb += `${param.getName()}=${param.getValue()}`;
    if (i < params.length - 1) {
      sb += '&';
    }
  }

  // 移除末尾的 '&'（如果有）
  if (sb.endsWith('&')) {
    sb = sb.slice(0, -1);
  }


  // 附加 API 密钥
  sb = sb + CommonConstants.API_SECRET_KEY
  LogUtils.debug(TAG, `-----加密前的字符串是：${sb}`);

  // const signValue = desUtil.encrypt2(sb,API_SECRET_KEY)
  // 计算 MD5
  const signValue = md5LowerCase(sb);
  LogUtils.debug(TAG, `加密后的signValue=${signValue}`);

  return signValue;
}




export function signKey(url: string = ''): string {
  let key = "";
  try {
    let urlParam = url?.split("?");
    if (urlParam != null && urlParam.length > 1) {
      let urlParamsString = urlParam[1];
      let urlParamArr = urlParamsString.split("&");
      for (let par of urlParamArr) {
        let parArr = par.split("=");
        if (parArr.length > 1) {
          let pk = parArr[0];
          let pv = parArr[1];
          if ("sign".toLowerCase() === pk.toLowerCase()) {
            key = pv;
          }
        }
      }
    }
  } catch (e) {
  }
  if (!TextUtils.isEmpty(key)) {
    console.log(TAG, "sign=" + key);
    key = md5LowerCase(key).toString().toLowerCase();
    if (!TextUtils.isEmpty(key) && key.length > 14) {
      key = key.substring(6, 14);
    }
  }
  return key;
}




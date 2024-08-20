import { CryptoJS } from '@ohos/crypto-js';
import { CommonConstants } from '../../constants/CommonConstants';
import { LogUtils } from '../../utils/LogUtils';



/**
 * 用户中心加解密 DES
 */
class DESUtil {

  //加密
  async encrypt(source: string, key: string): Promise<string> {
    let des_key = CryptoJS.enc.Utf8.parse(key)
    let des_iv = CryptoJS.enc.Utf8.parse(key)
    let encrypted = CryptoJS.DES.encrypt(source, des_key, {
      iv: des_iv,
      mode: CryptoJS.mode.CBC,
      padding: CryptoJS.pad.Pkcs7
    }).ciphertext.toString(CryptoJS.enc.Base64);
    return encrypted;
  }

  //解密
  async decrypt(source: string, keyStr: string,iv:string = CommonConstants.API_V): Promise<string> {
    let ivStr = CryptoJS.enc.Utf8.parse(iv); //向量iv

    let decryptTrip = CryptoJS.DES.decrypt(CryptoJS.lib.CipherParams.create({
      ciphertext: CryptoJS.enc.Base64.parse(source)
    }), CryptoJS.enc.Utf8.parse(keyStr), {
      iv: ivStr,
      mode: CryptoJS.mode.CBC,
      padding: CryptoJS.pad.Pkcs7
    }).toString(CryptoJS.enc.Utf8)

    LogUtils.debug('decryptTrip：' + decryptTrip)

    return decryptTrip
  }

  //加密
  encryptSync(source: string, key: string): string {
    let des_key = CryptoJS.enc.Utf8.parse(key)
    let des_iv = CryptoJS.enc.Utf8.parse(key)
    let encrypted = CryptoJS.DES.encrypt(source, des_key, {
      iv: des_iv,
      mode: CryptoJS.mode.CBC,
      padding: CryptoJS.pad.Pkcs7
    }).ciphertext.toString(CryptoJS.enc.Base64);
    return encrypted;
  }

  //解密
  decryptSync(source: string, keyStr: string,iv:string = CommonConstants.API_V): string {

    let ivStr = CryptoJS.enc.Utf8.parse(iv); //向量iv

    let decryptTrip = CryptoJS.DES.decrypt(CryptoJS.lib.CipherParams.create({
      ciphertext: CryptoJS.enc.Base64.parse(source)
    }), CryptoJS.enc.Utf8.parse(keyStr), {
      iv: ivStr,
      mode: CryptoJS.mode.CBC,
      padding: CryptoJS.pad.Pkcs7
    }).toString(CryptoJS.enc.Utf8)

    LogUtils.debug('decryptTrip：' + decryptTrip)

    return decryptTrip
  }
}

let desUtil = new DESUtil();

export default desUtil as DESUtil;




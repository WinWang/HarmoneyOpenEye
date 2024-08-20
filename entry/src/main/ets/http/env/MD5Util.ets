import CryptoJS from '@ohos/crypto-js';


export function md5LowerCase(string: string): string {
  if (string && string.length > 0) {
    try {
      // 使用CryptoJS计算MD5散列值
      const hash = CryptoJS.MD5(string).toString();
      // CryptoJS的MD5方法返回的就是小写十六进制形式，所以直接返回即可
      return hash;
    } catch (e) {
      console.error(e);
    }
  }
  return string;
}





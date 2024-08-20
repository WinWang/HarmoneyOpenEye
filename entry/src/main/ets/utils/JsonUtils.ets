import { CommonType } from '../model/typeAlias/TypeAlias';

export class JsonUtils {
  private constructor() {
  }

  static stringify(data: CommonType, space: number = 2): string {
    return JSON.stringify(data, null, space);
  }

  static parse(jsonString: string): CommonType {
    return JSON.parse(jsonString);
  }

  //json字符串转为map
  static jsonParseMap2(jsonStr: string) {
    let jsonObj: Map<string, string> = JSON.parse(jsonStr);
    let newMap: Map<string, string> = new Map<string, string>(Object.entries(jsonObj));
    return newMap;
  }
  //json字符串转为map
  static jsonParseMap(jsonStr: string) {
    let jsonObj: Map<string, string> = JSON.parse(jsonStr);
    return jsonObj;
  }

  //map转为json字符串
  static mapParseJson(map: Map<string, string>):string {
    let jsonStr = JSON.stringify(map, null,2)

    return jsonStr;
  }

}
export class JsonUtils {
  private constructor() {
  }

  static stringify(data: any, space: number = 2): string {
    return JSON.stringify(data, null, space);
  }

  static parse(jsonString: string): any {
    return JSON.parse(jsonString);
  }
}
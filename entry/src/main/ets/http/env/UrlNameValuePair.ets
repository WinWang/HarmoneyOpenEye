export class UrlNameValuePair {
  private name: string;
  private value: string;

  constructor(name: string, value: string) {
    this.name = name;
    this.value = value;
  }

  public getName(): string {
    return this.name;
  }

  public setName(name: string): void {
    this.name = name;
  }

  public getValue(): string {
    return this.value;
  }

  public setValue(value: string): void {
    this.value = value;
  }

  public toString(): string {
    return this.name + this.value;
  }

}

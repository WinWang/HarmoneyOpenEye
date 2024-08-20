
import ArrayList from '@ohos.util.ArrayList';
import HashMap from '@ohos.util.HashMap';

let count:number = 1;
let count2 = '11'
let num = true
let obj = { "name": "AbnerMing" }


let numberArray = [1, 2, 3, 4, 5]

let numberArrayObj = new Array<number>()

let tuple: [string, number] = ["age", 10]

let list = new ArrayList<number>()

let map = new HashMap<string, number>()

map.set("1",1)
map.remove("1")


console.log("当前数据类型3：" + typeof numberArray)
console.log("当前数据类型4：" + typeof numberArrayObj)
console.log("当前数据类型5：" + typeof tuple)
console.log("当前数据类型6：" + typeof list)
console.log("当前数据类型7：" + typeof map)



export class Drag {
  private  x: number;
  private y: number;

  public numnb:string = '1'


  public move(x: number, y: number) {
    this.x = x
    this.y = y
    console.log(`移动到位置： x: ${this.numnb},y: ${y}`)
  }
}

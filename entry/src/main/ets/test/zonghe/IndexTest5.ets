import curves from '@ohos.curves';
import { ArrayList, List } from '@kit.ArkTS';


/**
 * 在组件内使用，可以不写function，在组件外使用(全局定义)，必须写function
 * @Extend:扩展固定的组件（样式，事件）
 * @Styles：抽取通用属性、事件（不支持传参），
 * @Builder：自定义构建函数（结构，样式，事件）
 *
 */

class Cat{
  name:string='小猫'
  age?:number
}

let cat = new Cat()
cat.name
cat.age = 10
console.log(cat.age +'是年龄的数值')



@Entry
@Component
struct MyChild {

  build() {
    Scroll(){
      Column({space:10}){
        ForEach(Array.from({length:70}),()=>{
          Text('11111').backgroundColor(Color.Red).height(20).width('100%')
        })
      }.padding(10)
    }.width('100%').height(100)

  }
}
 
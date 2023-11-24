import { BaseViewModel } from './BaseViewModel';

export class HotViewModel extends BaseViewModel {
  hotTabTitle = [
    {
      index: 0,
      title: "周排行",
      rankType: "weekly"
    },
    {
      index: 1,
      title: "月排行",
      rankType: "monthly"
    },
    {
      index: 2,
      title: "总排行",
      rankType: "historical"
    }
  ]
}

let hotViewModel = new HotViewModel()

export default hotViewModel as HotViewModel
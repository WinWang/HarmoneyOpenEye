import { TabItem } from '../model/TabItem';

/**
 * MainAbility的ViewModel
 */
export class MainViewModel {
  /**
   * 首页底部Tab显示数据
   */
  tabTitle = [
    {
      index: 0,
      title: "首页",
      imageActivated: $r('app.media.icon_sel_home'),
      imageOriginal: $r('app.media.icon_unsel_home')
    },
    {
      index: 1,
      title: "发现",
      imageActivated: $r('app.media.icon_sel_find'),
      imageOriginal: $r('app.media.icon_unsel_find')
    },
    {
      index: 2,
      title: "热门",
      imageActivated: $r('app.media.icon_sel_hot'),
      imageOriginal: $r('app.media.icon_unsel_hot')
    },
    {
      index: 3,
      title: "我的",
      imageActivated: $r('app.media.icon_sel_mine'),
      imageOriginal: $r('app.media.icon_unsel_mine')
    }
  ]
}

let mainViewModel = new MainViewModel();

export default mainViewModel as MainViewModel;
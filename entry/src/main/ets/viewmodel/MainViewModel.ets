import { TabItem } from '../common/bean/TabItem';

/**
 * MainAbility的ViewModel
 */
export class MainViewModel {
  tabTitle = ["首页", "发现", "热门", "我的"]


  /**
   *首页Tab列表
   */
  getTabItems(): Array<TabItem> {
    let tabItems: Array<TabItem> = [];
    for (let index = 0; index < this.tabTitle.length; index++) {
      let tabItem = new TabItem();
      tabItem.index = index;
      tabItem.title = $r(this.tabTitle[index]);
      tabItem.imageOriginal = $r('app.media.ic_tab_normal');
      tabItem.imageActivated = $r('app.media.ic_tab_activated');
      tabItems.push(tabItem);
    }
    return tabItems;
  }
}

let mainViewModel = new MainViewModel();

export default mainViewModel as MainViewModel;
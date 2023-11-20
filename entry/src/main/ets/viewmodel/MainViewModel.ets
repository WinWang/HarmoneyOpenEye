import { TabItem } from '../bean/TabItem';

/**
 * MainAbility的ViewModel
 */
export class MainViewModel {
  tabTitle = [
    { title: "首页", selIcon: $r('app.media.icon_sel_home'), unselIcon: $r('app.media.icon_unsel_home') },
    { title: "发现", selIcon: $r('app.media.icon_sel_find'), unselIcon: $r('app.media.icon_unsel_find') },
    { title: "热门", selIcon: $r('app.media.icon_sel_hot'), unselIcon: $r('app.media.icon_unsel_hot') },
    { title: "我的", selIcon: $r('app.media.icon_sel_mine'), unselIcon: $r('app.media.icon_unsel_mine') }
  ]


  /**
   *首页Tab列表
   */
  getTabItems(): Array<TabItem> {
    let tabItems: Array<TabItem> = [];
    for (let index = 0; index < this.tabTitle.length; index++) {
      let tabItem = new TabItem();
      tabItem.index = index;
      tabItem.title = this.tabTitle[index].title;
      tabItem.imageOriginal = this.tabTitle[index].unselIcon;
      tabItem.imageActivated = this.tabTitle[index].selIcon;
      tabItems.push(tabItem);
    }
    return tabItems;
  }
}

let mainViewModel = new MainViewModel();

export default mainViewModel as MainViewModel;
import useRequestStatus from '../hooks/useRequestStatus';
import { getHomeList, getHomeListAxios } from '../http/apiService';
import { HomeModelIssueListItemList } from '../model/homeModel';
import { LogUtils } from '../utils/LogUtils';
import { BaseViewModel, ResultCallback, StateCallback } from './BaseViewModel';

export class HomeViewModel extends BaseViewModel {
  private date: string = ""

  async getHomeList(stateCallback?: StateCallback, resultCallback?: ResultCallback) {
    await useRequestStatus((state) => {
      stateCallback?.(state)
    }).promise(getHomeListAxios(this.date).then(result => {
      let items = result.issueList[0].itemList
      let list = items.filter((item) => item.type == "video")
      if (this.date == "") {
        let bannerList: HomeModelIssueListItemList[]
        let bannerBean: HomeModelIssueListItemList = {}
        bannerList = items.filter((item) => item.type == "banner2")
        if (bannerList.length > 0) {
          bannerBean = { bannerList: bannerList, type: "banner" }
          list.unshift(bannerBean)
        }
      }
      this.spliteDate(result.nextPageUrl)
      resultCallback?.(list)
    }))
  }

  private spliteDate(nextUrl: string) {
    let split = nextUrl.split("?");
    let split2 = split[1];
    let split3 = split2.split("&");
    let split4 = split3[0].split("=");
    this.date = split4[1]
  }


  /**
   * 官方原生httpClient获取通信实例
   */
  getHomeListByHttp() {
    let homeData = getHomeList("").then((res) => {
      LogUtils.debug("HomeTag" + res)
      // ToastUtils.showToast(res.toString())
    }).catch((err) => {
      LogUtils.debug("HomeTag", "错误1>>>>>>" + err)
    })
  }
}

let homeViewModel = new HomeViewModel()

export default homeViewModel as HomeViewModel
import { CommonConstants } from '../constants/CommonConstants'
import { BannerDataModelData } from '../model/BannerDataModel'
import { CategoryModel } from '../model/CategoryModel'
import { FocusModel } from '../model/FocusModel'
import { HomeModel } from '../model/HomeModel'
import { TopicDetailModel } from '../model/TopicDetailModel'
import { TopicModel } from '../model/TopicModel'
import { ApiResponse } from './AxiosHttp'
import axiosClient from './AxiosRequest'
import { AxiosHeaders } from '@ohos/axios'

let baseUrl = "https://baobab.kaiyanapp.com/"
let wanAndroidUrl = "https://www.wanandroid.com/"
const commonHeader: AxiosHeaders = new AxiosHeaders()

/**
 * 请求首页数据-axios客户端请求
 * @param date
 * @returns
 */
export function getHomeListAxios(date: string = "") {
  return axiosClient.get<HomeModel>({
    url: baseUrl + "api/v2/feed",
    params: { "date": date },
    showLoading: true,
    headers: commonHeader
  })
}

/**
 * 获取关注接口
 */
export function getFocusData(pageIndex: number = 0) {
  return axiosClient.get<FocusModel>(
    {
      url: baseUrl + "api/v4/tabs/follow",
      params: { "start": pageIndex },
      headers: commonHeader
    }
  )
}

/**
 * 获取分类数据
 * @returns
 */
export function getCategories() {
  return axiosClient.get<CategoryModel>({
    url: baseUrl + "api/v4/categories",
    showLoading: true,
    checkLoginState: true,
    needJumpToLogin: true,
    headers: commonHeader
  })
}

/**
 * 获取专题接口
 */
export function getTopicData(start: number = 0) {
  return axiosClient.get<TopicModel>(
    {
      url: baseUrl + "api/v3/specialTopics",
      params: { "start": start },
      headers: commonHeader
    }
  )
}


/**
 * 获取排行榜
 * @param rankType "weekly" "monthly" "historical"
 * @returns
 */
export function getRankList(rankType: string) {
  return axiosClient.get<HomeModel>(
    {
      url: baseUrl + "api/v4/rankList/videos",
      params: { "strategy": rankType },
      headers: commonHeader
    }
  )
}

/**
 *获取主题详情接口
 * @param id
 */
export function getTopicDetailList(id: number) {
  return axiosClient.get<TopicDetailModel>(
    {
      url: baseUrl + "api/v3/lightTopics/internal/" + id,
      headers: commonHeader
    }
  )
}

/**
 * 获取视频详情接口
 * @param id
 */
export function getRelationList(id: number) {
  return axiosClient.get<HomeModel>(
    {
      url: baseUrl + "api/v4/video/related",
      params: { "id": id },
      headers: commonHeader
    }
  )
}

/**
 * 获取分类详情接口
 * @param id
 * @param start
 */
export function getCategoryDetailList(id: number, start: number) {
  return axiosClient.get<HomeModel>(
    {
      url: baseUrl + "api/v4/categories/videoList",
      params: {
        "id": id,
        "start": start,
        "udid": CommonConstants.UUID,
        deviceModel: CommonConstants.DEVICE_NUM
      },
      headers: commonHeader
    }
  )
}

/**
 * 获取wanAndroid首页Banner数据，测试校验API data：T泛型数据
 * @returns
 */
export function getWanAndroidBanner() {
  return axiosClient.get<ApiResponse<BannerDataModelData[]>>(
    {
      url: wanAndroidUrl + "/banner/json",
      checkResultCode: true,
      showLoading: true,
      headers: commonHeader
    }
  )
}








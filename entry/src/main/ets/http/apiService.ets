import { CommonConstants } from '../constants/CommonConstants'
import { CategoryModel } from '../model/CategoryModel'
import { FocusModel } from '../model/FocusModel'
import { homeModel } from '../model/HomeModel'
import { TopicDetailModel } from '../model/TopicDetailModel'
import { TopicModel } from '../model/TopicModel'
import axiosClient from './AxiosRequest'
import httpClient from './request'

let baseUrl = "https://baobab.kaiyanapp.com/"

/**
 * 请求首页数据--系统http请求
 * @param date
 * @returns
 */
export function getHomeList(date: string = "") {
  return httpClient.get<homeModel>({
    url: baseUrl + "api/v2/feed",
    extraData: { "date": date }
  })
}
/**
 * 请求首页数据-axios客户端请求
 * @param date
 * @returns
 */
export function getHomeListAxios(date: string = "") {
  return axiosClient.get<homeModel>({
    url: baseUrl + "api/v2/feed",
    params: { "date": date }
    // headers: { "Accept": "application/json" } as AxiosRequestHeaders
  })
}

/**
 * 获取关注接口
 */
export function getFocusData(pageIndex: number = 0) {
  return axiosClient.get<FocusModel>(
    {
      url: baseUrl + "api/v4/tabs/follow",
      params: { "start": pageIndex }
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
  })
}

/**
 * 获取专题接口
 */
export function getTopicData(start: number = 0) {
  return axiosClient.get<TopicModel>(
    {
      url: baseUrl + "api/v3/specialTopics",
      params: { "start": start }
    }
  )
}


/**
 * 获取排行榜
 * @param rankType "weekly" "monthly" "historical"
 * @returns
 */
export function getRankList(rankType: string) {
  return axiosClient.get<homeModel>(
    {
      url: baseUrl + "api/v4/rankList/videos",
      params: { "strategy": rankType }
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
      url: baseUrl + "api/v3/lightTopics/internal/" + id
    }
  )
}

/**
 * 获取视频详情接口
 * @param id
 */
export function getRelationList(id: number) {
  return axiosClient.get<homeModel>(
    {
      url: baseUrl + "api/v4/video/related",
      params: { "id": id }
    }
  )
}

/**
 * 获取分类详情接口
 * @param id
 * @param start
 */
export function getCategoryDetailList(id: number, start: number) {
  return axiosClient.get<homeModel>(
    {
      url: baseUrl + "api/v4/categories/videoList",
      params: {
        "id": id,
        "start": start,
        "udid": CommonConstants.UUID,
        deviceModel: CommonConstants.DEVICE_NUM
      }
    }
  )
}







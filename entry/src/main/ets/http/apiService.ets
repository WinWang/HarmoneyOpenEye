import { AxiosRequestHeaders } from '@ohos/axios'
import { CategoryModel } from '../model/CategoryModel'
import { homeModel } from '../model/HomeModel'
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
 * 获取分类数据
 * @returns
 */
export function getCategories() {
  return axiosClient.get<CategoryModel>({
    url: baseUrl + "api/v4/categories",
  })
}






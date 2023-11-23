import { AxiosRequestHeaders } from '@ohos/axios'
import { homeModel } from '../model/homeModel'
import AxiosHttpRequest from './AxiosHttp'
import axiosClient from './AxiosRequest'
import httpClient from './request'

let baseUrl = "https://baobab.kaiyanapp.com/"

/**
 * 请求首页数据
 * @param date
 * @returns
 */
export function getHomeList(date: string = "") {
  return httpClient.get<homeModel>({
    url: baseUrl + "api/v2/feed",
    extraData: { "date": date }
  })
}

export function getHomeListAxios(date: string = "") {
  return axiosClient.get<homeModel>({
    url: baseUrl + "api/v2/feed",
    params: { "date": date }
    // headers: { "Accept": "application/json" } as AxiosRequestHeaders
  })
}






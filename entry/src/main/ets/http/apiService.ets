import { homeModel } from '../bean/homeModel'
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




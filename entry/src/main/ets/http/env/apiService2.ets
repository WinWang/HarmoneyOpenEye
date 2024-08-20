import { AxiosHeaders } from '@ohos/axios';
import { HomeModel } from '../../model/HomeModel';
import { isBuildDebug } from './EnvConstants';


import AxiosRequestNew from './AxiosRequestNew'



let baseUrl = "https://baobab.kaiyanapp.com/"
let wanAndroidUrl = "https://www.wanandroid.com/"
const commonHeader: AxiosHeaders = new AxiosHeaders()



let WAR_GAME_URL_HEAD = isBuildDebug ? "https://" : "https://";
let WAR_GAME_URL_HEAD_HOST = WAR_GAME_URL_HEAD + (isBuildDebug ? "beta-wbox.wows.360.cn" : "wbox.wows.360.cn");




export function getWarTest() {
  return AxiosRequestNew.get<HomeModel>({
    url: 'https://wbox.wows.360.cn' + "/wowsxmall/product_list",
    params: { "type": 'vehicles','game_id':'2' },
    headers: commonHeader
  })
}





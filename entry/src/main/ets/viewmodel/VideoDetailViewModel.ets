import { getRelationList } from '../http/apiService';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class VideoDetailViewModel extends BaseViewModel {
  relationId: number = -1

  async getRelationList(resultCallback?: ResultCallback) {
    await this.httpRequest()
      .promise(getRelationList(this.relationId), true)
      .then((result) => {
        let filterList = result.itemList.filter((item) => item.type === "videoSmallCard")
        resultCallback?.(filterList)
      })
  }
}

let videoDetailViewModel = new VideoDetailViewModel()

export default videoDetailViewModel as VideoDetailViewModel
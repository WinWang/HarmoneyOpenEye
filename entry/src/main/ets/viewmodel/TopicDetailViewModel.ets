import { getTopicDetailList } from '../http/apiService'
import { TopicDetailModel } from '../model/TopicDetailModel'
import { BaseViewModel, ResultCallback } from './BaseViewModel'

export class TopicDetailViewModel extends BaseViewModel {
  topicId: number = -1

  async getTopicDetailList(resultCallback?: ResultCallback<TopicDetailModel>) {
    await this.httpRequest()
      .promise(getTopicDetailList(this.topicId), true)
      .then((result) => {
        resultCallback?.(result)
      })
  }
}

let topicDetailViewModel = new TopicDetailViewModel()

export default topicDetailViewModel as TopicDetailViewModel
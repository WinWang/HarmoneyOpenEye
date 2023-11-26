import { getTopicDetailList } from '../http/apiService'
import { BaseViewModel, ResultCallback } from './BaseViewModel'

export class TopicDetailViewModel extends BaseViewModel {
  topicId: number = -1

  async getTopicDetailList(resultCallback?: ResultCallback) {
    await this.httpRequest().promise(getTopicDetailList(this.topicId).then((result) => {
      resultCallback?.(result)
    }), true)
  }
}

let topicDetailViewModel = new TopicDetailViewModel()

export default topicDetailViewModel as TopicDetailViewModel
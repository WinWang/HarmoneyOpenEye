import { getRankList } from '../http/apiService';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class RankViewModel extends BaseViewModel {

  async getRankList(rankType: string, resultCallback?: ResultCallback) {
    await this.httpRequest().promise(getRankList(rankType).then((result) => {
      resultCallback?.(result.itemList)
    }), true);
  }
}

// let rankViewModel = new RankViewModel()
//
// export default rankViewModel as RankViewModel
import { getCategoryDetailList } from '../http/apiService';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class CategoryDetailViewModel extends BaseViewModel {
  id: number = -1
  pageIndex: number = 0

  async getCategoryDetailList(resultCallback?: ResultCallback) {
    await this.httpRequest()
      .promise(getCategoryDetailList(this.id, this.pageIndex), this.pageIndex == 0 ? true : false)
      .then((result) => {
        resultCallback?.(result.itemList)
        this.pageIndex++
      })
  }
}

let categoryDetailViewModel = new CategoryDetailViewModel()

export default categoryDetailViewModel as CategoryDetailViewModel
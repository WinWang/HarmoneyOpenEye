/**
 * Category ability view model.
 */
import { getCategories } from '../http/apiService';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class CategoryViewModel extends BaseViewModel {
  async getCategoryDataList(resultCallback?: ResultCallback) {
    await this.httpRequest()
      .promise(getCategories(), true)
      .then(result => resultCallback?.(result))
  }
}

let categoryViewModel = new CategoryViewModel();

export default categoryViewModel as CategoryViewModel;
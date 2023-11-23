import showToast from '../utils/ToastUtils'

export type StateCallback = (state: string) => void

export type ResultCallback = (result: any) => void

export class BaseViewModel {
  handleResult() {
    showToast("Result")
  }
}
import useRequestStatus from '../http/useRequestStatus'

export type StateCallback = (state: string) => void

export type ResultCallback = (result: any) => void

export class BaseViewModel {
  private stateCallback?: StateCallback

  observeState(stateCallback: StateCallback) {
    this.stateCallback = stateCallback
  }

  dispatchViewState(state: string) {
    this.stateCallback?.(state)
  }

  httpRequest(checkResult?: boolean) {
    return useRequestStatus(state => this.dispatchViewState(state), checkResult)
  }
}
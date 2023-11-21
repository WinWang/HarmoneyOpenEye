import promptAction from '@ohos.promptAction'

class ToastUtils {
  showToast(message: string, duration: number = 2000) {
    try {
      promptAction.showToast({
        message: message,
        duration: duration,
        bottom: "center",
      })
    } catch (error) {
      console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
    }
  }
}

let toastUtils = new ToastUtils()

export default toastUtils as ToastUtils
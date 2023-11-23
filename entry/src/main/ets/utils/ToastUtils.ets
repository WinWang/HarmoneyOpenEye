import promptAction from '@ohos.promptAction'


export default function showToast(message: string, duration: number = 2000) {
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

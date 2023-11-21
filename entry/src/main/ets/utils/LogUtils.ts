import hilog from '@ohos.hilog'

const LogTag = "tag"
const StringFormat = "%{public}s"

class LogUtils {
  logDebug(domain: number = 0x0000, tag: string = LogTag, stringFormat: string = StringFormat, ...logInfo: any[]) {
    hilog.debug(domain, tag, stringFormat, logInfo);
  }

  logInfo(domain: number = 0x0000, tag: string = LogTag, stringFormat: string = StringFormat, ...logInfo: any[]) {
    hilog.info(domain, tag, stringFormat, logInfo);
  }

  logWarn(domain: number = 0x0000, tag: string = LogTag, stringFormat: string = StringFormat, ...logInfo: any[]) {
    hilog.warn(domain, tag, stringFormat, logInfo);
  }

  logError(domain: number = 0x0000, tag: string = LogTag, stringFormat: string = StringFormat, ...logInfo: any[]) {
    hilog.error(domain, tag, stringFormat, logInfo);
  }
}

let logUtils = new LogUtils()

export default logUtils as LogUtils


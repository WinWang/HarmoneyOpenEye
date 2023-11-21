import hilog from '@ohos.hilog'

const LogTag = "tag"
const StringFormat = "%{public}s"

export class LogUtils {
  static logDebug(tag: string = LogTag, domain: number = 0x0000, stringFormat: string = StringFormat, ...logInfo: any[]) {
    hilog.debug(domain, tag, stringFormat, logInfo);
  }

  static logInfo(tag: string = LogTag, domain: number = 0x0000, stringFormat: string = StringFormat, ...logInfo: any[]) {
    hilog.info(domain, tag, stringFormat, logInfo);
  }

  static logWarn(tag: string = LogTag, domain: number = 0x0000, stringFormat: string = StringFormat, ...logInfo: any[]) {
    hilog.warn(domain, tag, stringFormat, logInfo);
  }

  static logError(tag: string = LogTag, domain: number = 0x0000, stringFormat: string = StringFormat, ...logInfo: any[]) {
    hilog.error(domain, tag, stringFormat, logInfo);
  }
}


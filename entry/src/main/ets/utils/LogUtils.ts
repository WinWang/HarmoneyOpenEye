import hilog from '@ohos.hilog'

const prefix = "OpenEyeTag"
const format = `%{public}s, %{public}s`
const domain = 0x1111

/**
 * 本来想用官方的hiLog，真的没搞懂这玩意的使用姿势，心累！！！算了，老老实实用console，搞明白了在做替换吧
 */
export class LogUtils {
  static debug(...args: string[]) {
    hilog.debug(domain, prefix, format, args);
  }

  static info(...args: string[]) {
    hilog.info(domain, prefix, format, args);
  }

  static warn(...args: string[]) {
    hilog.warn(domain, prefix, format, args);
  }

  static error(...args: string[]) {
    hilog.error(domain, prefix, format, args);
  }

  static fatal(...args: string[]) {
    hilog.fatal(domain, prefix, format, args);
  }

  static isLogger(level: LogLevel) {
    hilog.isLoggable(domain, prefix, level);
  }
}

/**
 * Log level define
 */
enum LogLevel {
  DEBUG = 3,
  INFO = 4,
  WARN = 5,
  ERROR = 6,
  FATAL = 7
}


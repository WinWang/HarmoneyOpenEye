export class StateComponentModel {

  //加载类型
  loadingState: string;
  //是否骨架屏
  useSkeleton?: boolean
  //自定义骨架屏
  customSkeleton?: boolean
  //是否列表类骨架屏-列表默认长度
  listSize?: number
  //重试按钮
  retryCallback?: () => void
}
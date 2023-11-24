@Extend(List) function defaultVerticalList() {
  .listDirection(Axis.Vertical)
  .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
  .width('100%')
  .height("100%")
}

export default defaultVerticalList
@Extend(Image) function placeHolder(holderImage?: Resource) {
  .alt(holderImage?? $r('app.media.back_placeholder'))
}
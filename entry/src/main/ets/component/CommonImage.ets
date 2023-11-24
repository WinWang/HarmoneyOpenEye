@Component
export struct CommonImage {
  private src: string | PixelMap | Resource

  build() {
    Image(this.src).alt($r('app.media.back_placeholder')).objectFit(ImageFit.Cover).height("100%").width("100%")
  }
}
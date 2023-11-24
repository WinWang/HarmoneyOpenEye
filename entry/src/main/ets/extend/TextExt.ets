@Extend(Text) function text666(fontSize?: Resource | number) {
  .fontColor($r('app.color.color_333'))
  .fontSize(fontSize?? $r('app.float.size_text_15'))
}

export default {
  text666: text666
};


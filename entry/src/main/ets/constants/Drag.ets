class Drag {


  public x: number;
  public y: number;

  public move(x: number, y: number) {
    this.x = x
    this.y = y
    console.log(`移动到位置： x: ${x},y: ${y}`)
  }
}

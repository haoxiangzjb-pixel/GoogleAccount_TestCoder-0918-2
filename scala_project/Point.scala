// 定义一个表示二维坐标点的Scala样例类
case class Point(x: Double, y: Double)

// 伴生对象，包含一些辅助方法
object Point {
  // 创建一个原点 (0, 0)
  def origin: Point = Point(0.0, 0.0)

  // 计算两个点之间的欧几里得距离
  def distance(p1: Point, p2: Point): Double = {
    math.sqrt(math.pow(p2.x - p1.x, 2) + math.pow(p2.y - p1.y, 2))
  }
}

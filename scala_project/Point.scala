// 定义一个表示二维坐标点的Scala样例类
case class Point(x: Double, y: Double)

// 可选：添加一个伴生对象来提供额外的功能
object Point {
  // 计算两点之间的欧几里得距离
  def distance(p1: Point, p2: Point): Double = {
    math.sqrt(math.pow(p2.x - p1.x, 2) + math.pow(p2.y - p1.y, 2))
  }
}
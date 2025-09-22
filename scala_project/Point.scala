// 定义一个表示二维坐标点的样例类
case class Point(x: Double, y: Double)

// 伴生对象，可以包含与Point相关的静态方法
object Point {
  // 计算两点之间的欧几里得距离
  def distance(p1: Point, p2: Point): Double = {
    math.sqrt(math.pow(p2.x - p1.x, 2) + math.pow(p2.y - p1.y, 2))
  }

  // 创建一个位于原点的Point实例的便捷方法
  def origin: Point = Point(0, 0)
}
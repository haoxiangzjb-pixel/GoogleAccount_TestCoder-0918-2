// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double)

object PointApp extends App {
  // 创建一个Point实例
  val myPoint = Point(3.5, 7.2)
  println(s"创建的点是: $myPoint")
}
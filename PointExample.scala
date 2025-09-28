// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double)

object PointExample extends App {
  // 创建一个 Point 实例
  val myPoint = Point(3.5, 7.2)
  println(s"Created point: $myPoint")

  // 将样例类定义保存到一个随机命名的文件中
  import java.io.PrintWriter
  import java.util.UUID

  val randomFileName = s"PointDefinition_${UUID.randomUUID().toString}.scala"
  val writer = new PrintWriter(randomFileName)
  writer.write("""case class Point(x: Double, y: Double)""")
  writer.close()
  println(s"Point definition saved to file: $randomFileName")
}
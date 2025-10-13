case class Point(x: Double, y: Double)

object Point {
  def main(args: Array[String]): Unit = {
    val p = Point(1.0, 2.5)
    val fileName = "point_" + System.currentTimeMillis() + ".txt"
    import java.io.PrintWriter
    val writer = new PrintWriter(fileName)
    writer.write(p.toString)
    writer.close()
    println(s"Point saved to $fileName")
  }
}
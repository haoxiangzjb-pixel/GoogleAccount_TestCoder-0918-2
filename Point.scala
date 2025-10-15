// Define a Scala case class to represent a coordinate point
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

object PointApp extends App {
  // Create an instance of the Point
  val point = Point(3.5, 4.2)
  
  // Generate a random filename
  val randomFileName = s"point_${System.currentTimeMillis()}.txt"
  
  // Write the point to the randomly named file
  import java.io.PrintWriter
  val writer = new PrintWriter(randomFileName)
  writer.write(point.toString)
  writer.close()
  
  println(s"Point saved to file: $randomFileName")
  println(s"Point data: $point")
}
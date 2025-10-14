// This file defines a Scala case class for a Point.
// It would be compiled and run with scalac/scala if available.
// The object below prints how it would save the point to a random file.

case class Point(x: Double, y: Double)

object Point extends App {
  val p = Point(1.0, 2.5)
  println(s"Created point: $p")

  // This is the code that would execute to save the point:
  // val fileName = s"/workspace/point_file_${scala.util.Random.nextInt(10000)}.scala"
  // import java.io.PrintWriter
  // val writer = new PrintWriter(fileName)
  // writer.write(p.toString)
  // writer.close()
  // println(s"Point saved to randomly named file: $fileName")
  println("Simulating: Would save point to a randomly named file like 'point_file_XXXX.scala'")
}
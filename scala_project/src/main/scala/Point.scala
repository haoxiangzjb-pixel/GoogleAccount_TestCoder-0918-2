// Definition of a case class for a 2D point
case class Point(x: Double, y: Double)

// Companion object with a utility method
object Point {
  def distance(p1: Point, p2: Point): Double = {
    math.sqrt(math.pow(p2.x - p1.x, 2) + math.pow(p2.y - p1.y, 2))
  }
}

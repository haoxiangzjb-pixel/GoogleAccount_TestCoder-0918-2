object NumberSummer {
  // Function to sum a list of numbers
  def sumList(numbers: List[Double]): Double = {
    numbers.sum
  }

  // Alternative implementation using fold
  def sumListFold(numbers: List[Double]): Double = {
    numbers.foldLeft(0.0)(_ + _)
  }

  // Example usage
  def main(args: Array[String]): Unit = {
    val numbers = List(1.0, 2.0, 3.0, 4.0, 5.0)
    println(s"Sum of $numbers is: ${sumList(numbers)}")
    
    val moreNumbers = List(10.5, 20.3, 5.2)
    println(s"Sum of $moreNumbers is: ${sumList(moreNumbers)}")
  }
}
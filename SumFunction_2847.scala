object SumFunction {
  // Function to sum a list of numbers
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Alternative implementation using fold
  def sumListWithFold(numbers: List[Int]): Int = {
    numbers.foldLeft(0)(_ + _)
  }

  // Example usage
  def main(args: Array[String]): Unit = {
    val numbers = List(1, 2, 3, 4, 5)
    val result = sumList(numbers)
    println(s"Sum of $numbers is $result")
  }
}
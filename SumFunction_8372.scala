object SumFunction {
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
    val exampleList = List(1.0, 2.0, 3.0, 4.0, 5.0)
    println(s"Sum of $exampleList is: ${sumList(exampleList)}")
    
    val emptyList = List[Double]()
    println(s"Sum of empty list is: ${sumList(emptyList)}")
    
    val negativeList = List(-1.0, -2.0, 3.0, 4.0)
    println(s"Sum of $negativeList is: ${sumList(negativeList)}")
  }
}
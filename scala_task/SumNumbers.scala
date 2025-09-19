object SumNumbers {
  def sumList(numbers: List[Double]): Double = {
    numbers.sum
  }

  def main(args: Array[String]): Unit = {
    val exampleList = List(1.0, 2.0, 3.0, 4.5)
    println(s"Sum of $exampleList is ${sumList(exampleList)}")
  }
}
object SumFunction {
  def sumList(numbers: List[Double]): Double = {
    numbers.sum
  }

  def main(args: Array[String]): Unit = {
    val exampleList = List(1.0, 2.0, 3.0, 4.0, 5.0)
    println(s"Сумма $exampleList равна ${sumList(exampleList)}")
  }
}

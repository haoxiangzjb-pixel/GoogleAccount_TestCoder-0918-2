object SumList {
  def sum(numbers: List[Int]): Int = {
    numbers.foldLeft(0)(_ + _)
  }

  def main(args: Array[String]): Unit = {
    val numbers = List(1, 2, 3, 4, 5)
    println(s"Сумма списка $numbers равна ${sum(numbers)}")
  }
}
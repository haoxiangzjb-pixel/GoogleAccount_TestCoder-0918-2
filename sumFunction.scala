object NumberSummer {
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  def sumListRecursive(numbers: List[Int]): Int = {
    numbers match {
      case Nil => 0
      case head :: tail => head + sumListRecursive(tail)
    }
  }

  def main(args: Array[String]): Unit = {
    val testList = List(1, 2, 3, 4, 5)
    println(s"Sum of $testList is: ${sumList(testList)}")
    println(s"Recursive sum of $testList is: ${sumListRecursive(testList)}")
  }
}
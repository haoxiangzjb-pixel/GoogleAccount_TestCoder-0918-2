object SumList {
  // Функция для суммирования списка чисел
  def sum(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Альтернативная реализация с использованием рекурсии
  def sumRecursive(numbers: List[Int]): Int = numbers match {
    case Nil => 0
    case head :: tail => head + sumRecursive(tail)
  }

  def main(args: Array[String]): Unit = {
    val myList = List(1, 2, 3, 4, 5)
    println(s"Сумма элементов списка $myList равна ${sum(myList)}")
    println(s"Сумма элементов (рекурсивно) $myList равна ${sumRecursive(myList)}")
  }
}
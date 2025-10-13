import scala.util.Random

// Функция для суммирования списка чисел
def sumList(numbers: List[Double]): Double = {
  numbers.sum
}

// Пример использования
val myList = List(1.0, 2.0, 3.0, 4.0, 5.0)
println(s"Сумма $myList равна ${sumList(myList)}")

// Генерация случайного имени файла
val randomFileName = s"SumFunction_${Random.alphanumeric.take(10).mkString}.scala"

// Для сохранения файла в этом окружении, мы просто создадим его с этим именем.
// Предположим, что переменная `code` содержит весь вышеуказанный код.
val code = s"""|import scala.util.Random
               |
               |// Функция для суммирования списка чисел
               |def sumList(numbers: List[Double]): Double = {
               |  numbers.sum
               |}
               |
               |// Пример использования
               |val myList = List(1.0, 2.0, 3.0, 4.0, 5.0)
               |println(s"Сумма $$myList равна $${sumList(myList)}")
               |
               |// Генерация случайного имени файла
               |val randomFileName = s"SumFunction_$${Random.alphanumeric.take(10).mkString}.scala"
               |
               |// Для сохранения файла в этом окружении, мы просто создадим его с этим именем.
               |// Предположим, что переменная `code` содержит весь вышеуказанный код.
               |val code = s\"\"\"|import scala.util.Random
               ||               |
               ||               |// Функция для суммирования списка чисел
               ||               |def sumList(numbers: List[Double]): Double = {
               ||               |  numbers.sum
               ||               |}
               ||               |
               ||               |// Пример использования
               ||               |val myList = List(1.0, 2.0, 3.0, 4.0, 5.0)
               ||               |println(s\"Сумма $$$${myList} равна $$$${sumList(myList)}\")
               ||               |
               ||               |// Генерация случайного имени файла
               ||               |val randomFileName = s\"SumFunction_$${$${Random.alphanumeric.take(10).mkString}}.scala\"
               ||               |
               ||               |// Для сохранения файла в этом окружении, мы просто создадим его с этим именем.
               ||               |// Предположим, что переменная `code` содержит весь вышеуказанный код.
               ||               |\"\"\".stripMargin
               |""".stripMargin

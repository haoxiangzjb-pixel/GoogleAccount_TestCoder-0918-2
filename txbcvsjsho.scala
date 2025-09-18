// Scala function to sum a list of numbers
def sumList(numbers: List[Double]): Double = {
  numbers.sum
}

// Alternative implementation using fold
def sumListFold(numbers: List[Double]): Double = {
  numbers.fold(0.0)(_ + _)
}

// Example usage
val exampleList = List(1.0, 2.0, 3.0, 4.0, 5.0)
println(s"Sum using sum method: ${sumList(exampleList)}")
println(s"Sum using fold method: ${sumListFold(exampleList)}")
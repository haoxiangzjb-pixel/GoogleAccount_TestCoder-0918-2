object PatternMatchingExample {
  def matchExample(x: Any): String = x match {
    case 0 => "Zero"
    case i: Int if i > 0 => "Positive integer"
    case i: Int if i < 0 => "Negative integer"
    case s: String if s.nonEmpty => s"Non-empty string: $s"
    case "" => "Empty string"
    case _: List[_] => "A list of some kind"
    case _ => "Something else"
  }

  def main(args: Array[String]): Unit = {
    println(matchExample(0))           // Zero
    println(matchExample(5))           // Positive integer
    println(matchExample(-3))          // Negative integer
    println(matchExample("Hello"))     // Non-empty string: Hello
    println(matchExample(""))          // Empty string
    println(matchExample(List(1,2,3))) // A list of some kind
    println(matchExample(3.14))        // Something else
  }
}
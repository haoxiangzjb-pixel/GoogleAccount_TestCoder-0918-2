object PatternMatchingExample extends App {
  def matchExample(x: Any): String = x match {
    case 1 => "uno"
    case "dos" => "cadena dos"
    case n: Int if n > 10 => s"entero mayor que 10: $n"
    case n: Int => s"entero: $n"
    case s: String => s"cadena: $s"
    case _ => "otro tipo"
  }

  // Ejemplos de uso
  println(matchExample(1))        // uno
  println(matchExample("dos"))     // cadena dos
  println(matchExample(15))        // entero mayor que 10: 15
  println(matchExample(5))         // entero: 5
  println(matchExample("hola"))    // cadena: hola
  println(matchExample(3.14))      // otro tipo
}
object PatternMatchingExample {
  def matchExample(x: Any): String = x match {
    case 1 => "Uno"
    case "dos" => "Dos como cadena"
    case n: Int if n > 10 => s"Un número mayor que 10: $n"
    case n: Int => s"Un número: $n"
    case s: String => s"Cadena: $s"
    case _ => "Tipo desconocido"
  }

  def main(args: Array[String]): Unit = {
    println(matchExample(1))          // Uno
    println(matchExample("dos"))      // Dos como cadena
    println(matchExample(15))         // Un número mayor que 10: 15
    println(matchExample(5))          // Un número: 5
    println(matchExample("hola"))     // Cadena: hola
    println(matchExample(true))       // Tipo desconocido
  }
}
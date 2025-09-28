fun filterStrings(list: List<String>, predicate: (String) -> Boolean): List<String> {
    return list.filter(predicate)
}

// Пример использования
fun main() {
    val strings = listOf("hello", "world", "123", "kotlin", "456", "")
    val filtered = filterStrings(strings) { it.isNotEmpty() && it.all { c -> c.isLetter() } }
    println(filtered) // Выведет: [hello, world, kotlin]
}
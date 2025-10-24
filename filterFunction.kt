fun filterStrings(stringList: List<String>, filterPattern: String): List<String> {
    return stringList.filter { it.contains(filterPattern, ignoreCase = true) }
}

// Пример использования
fun main() {
    val strings = listOf("apple", "banana", "cherry", "apricot", "blueberry")
    val filtered = filterStrings(strings, "a")
    println(filtered) // Выведет: [apple, banana, apricot, blueberry]
}
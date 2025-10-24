fun filterStrings(list: List<String>, predicate: (String) -> Boolean): List<String> {
    return list.filter(predicate)
}

// Пример использования
fun main() {
    val strings = listOf("apple", "banana", "cherry", "date", "elderberry")
    val filtered = filterStrings(strings) { it.length > 5 }
    println(filtered) // Выведет: [banana, cherry, elderberry]
}
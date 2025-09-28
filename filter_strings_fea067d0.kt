fun filterStrings(list: List<String>, predicate: (String) -> Boolean): List<String> {
    return list.filter { predicate(it) }
}

// Пример использования:
fun main() {
    val strings = listOf("hello", "world", "123", "kotlin", "programming")
    val filtered = filterStrings(strings) { it.length > 5 }
    println(filtered) // Выведет: [kotlin, programming]
}

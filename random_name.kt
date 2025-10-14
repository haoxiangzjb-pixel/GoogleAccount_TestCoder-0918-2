fun filterStrings(list: List<String>, substring: String): List<String> {
    return list.filter { it.contains(substring) }
}

fun main() {
    val strings = listOf("apple", "banana", "grape", "apricot", "watermelon")
    val filtered = filterStrings(strings, "ap")
    println(filtered) // Выведет: [apple, grape, apricot]
}
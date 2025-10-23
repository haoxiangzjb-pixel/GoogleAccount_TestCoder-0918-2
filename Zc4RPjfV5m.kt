fun filterStrings(stringList: List<String>): List<String> {
    return stringList.filter { it.length > 3 }
}

// Пример использования
fun main() {
    val strings = listOf("hi", "hello", "cat", "elephant", "dog", "a")
    val filtered = filterStrings(strings)
    println("Original: $strings")
    println("Filtered (length > 3): $filtered")
}
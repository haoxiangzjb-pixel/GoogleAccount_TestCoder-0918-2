fun filterStrings(strings: List<String>, predicate: (String) -> Boolean): List<String> {
    return strings.filter(predicate)
}

// Пример использования:
fun main() {
    val words = listOf("apple", "banana", "cherry", "date", "elderberry")
    
    // Фильтруем строки, длина которых больше 5
    val filteredWords = filterStrings(words) { it.length > 5 }
    
    println("Исходный список: $words")
    println("Отфильтрованный список: $filteredWords")
}
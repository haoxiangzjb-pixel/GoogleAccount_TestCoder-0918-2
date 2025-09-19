fun filterStrings(strings: List<String>, predicate: (String) -> Boolean): List<String> {
    return strings.filter(predicate)
}

// Example usage
fun main() {
    val words = listOf("apple", "banana", "cherry", "date", "elderberry")
    
    // Filter strings that contain the letter 'a'
    val filteredWords = filterStrings(words) { it.contains("a") }
    
    println("Original list: $words")
    println("Filtered list: $filteredWords")
}
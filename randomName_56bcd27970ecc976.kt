fun filterStrings(stringList: List<String>, filterPredicate: (String) -> Boolean): List<String> {
    return stringList.filter(filterPredicate)
}

// Example usage
fun main() {
    val strings = listOf("apple", "banana", "cherry", "date", "elderberry")
    val filtered = filterStrings(strings) { it.length > 5 }
    println(filtered) // Output: [banana, cherry, elderberry]
    
    val filteredByA = filterStrings(strings) { it.startsWith("a") }
    println(filteredByA) // Output: [apple]
}
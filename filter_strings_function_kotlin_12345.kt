fun filterStrings(stringList: List<String>, filterPredicate: (String) -> Boolean): List<String> {
    return stringList.filter(filterPredicate)
}

// Example usage:
fun main() {
    val strings = listOf("apple", "banana", "cherry", "date", "elderberry")
    
    // Filter strings that have length greater than 5
    val filtered = filterStrings(strings) { it.length > 5 }
    println("Filtered strings (length > 5): $filtered")
    
    // Filter strings that start with 'a'
    val filtered2 = filterStrings(strings) { it.startsWith('a') }
    println("Filtered strings (start with 'a'): $filtered2")
    
    // Filter strings that contain the letter 'e'
    val filtered3 = filterStrings(strings) { it.contains('e') }
    println("Filtered strings (contain 'e'): $filtered3")
}
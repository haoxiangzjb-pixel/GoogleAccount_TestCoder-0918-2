/**
 * Filters a list of strings based on a predicate function
 * @param strings The input list of strings to filter
 * @param predicate A function that takes a string and returns true if it should be included in the result
 * @return A new list containing only the strings that match the predicate
 */
fun filterStrings(strings: List<String>, predicate: (String) -> Boolean): List<String> {
    return strings.filter(predicate)
}

// Example usage:
fun main() {
    val originalList = listOf("apple", "banana", "cherry", "date", "elderberry")
    
    // Filter strings that have length greater than 5
    val longStrings = filterStrings(originalList) { it.length > 5 }
    println("Strings with length > 5: $longStrings")
    
    // Filter strings that start with 'a' or 'b'
    val abStrings = filterStrings(originalList) { it.startsWith('a') || it.startsWith('b') }
    println("Strings starting with 'a' or 'b': $abStrings")
    
    // Filter strings containing the letter 'e'
    val stringsWithE = filterStrings(originalList) { it.contains('e') }
    println("Strings containing 'e': $stringsWithE")
}
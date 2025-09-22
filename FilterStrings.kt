import kotlin.random.Random

/**
 * Filters a list of strings based on a predicate function.
 * @param strings The list of strings to filter.
 * @param predicate The function to determine which strings to keep.
 * @return A new list containing only the strings that match the predicate.
 */
fun filterStrings(strings: List<String>, predicate: (String) -> Boolean): List<String> {
    return strings.filter(predicate)
}

/**
 * Generates a random filename with a .kt extension.
 * @return A random filename string.
 */
fun generateRandomFilename(): String {
    val chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    val filename = (1..10)
        .map { chars.random() }
        .joinToString("")
    return "$filename.kt"
}

// Example usage
fun main() {
    val strings = listOf("apple", "banana", "cherry", "date", "elderberry")
    val filteredStrings = filterStrings(strings) { it.length > 5 }
    
    val filename = generateRandomFilename()
    println("Filtered strings: $filteredStrings")
    println("Random filename: $filename")
}
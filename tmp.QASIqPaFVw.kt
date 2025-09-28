fun filterStrings(inputList: List<String>): List<String> {
    return inputList.filter { it.length > 3 }
}

fun main() {
    val strings = listOf("a", "bb", "hello", "world", "Kotlin", "ai")
    val filteredStrings = filterStrings(strings)
    println("Original: $strings")
    println("Filtered (length > 3): $filteredStrings")
}
fun filterStrings(list: List<String>): List<String> {
    return list.filter { it.isNotEmpty() && it[0].isUpperCase() }
}

fun main() {
    val inputList = listOf("apple", "Banana", "cherry", "Date", "elderberry", "Fig")
    val filteredList = filterStrings(inputList)
    println(filteredList)
}
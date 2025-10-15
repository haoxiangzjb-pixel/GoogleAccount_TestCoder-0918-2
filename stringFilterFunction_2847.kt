/**
 * Функция для фильтрации списка строк.
 * В данном примере фильтр исключает пустые строки и строки, состоящие только из пробелов.
 *
 * @param inputList Список строк для фильтрации.
 * @return Отфильтрованный список строк.
 */
fun filterStrings(inputList: List<String>): List<String> {
    return inputList.filter { it.isNotBlank() }
}

// Пример использования
fun main() {
    val originalList = listOf("hello", "", "world", "   ", "kotlin", "\t", "rocks")
    val filteredList = filterStrings(originalList)
    println("Оригинальный список: $originalList")
    println("Отфильтрованный список: $filteredList")
}
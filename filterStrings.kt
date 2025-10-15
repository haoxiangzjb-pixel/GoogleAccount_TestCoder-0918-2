/**
 * Функция для фильтрации списка строк.
 * В данном примере фильтр исключает строки, длина которых меньше 3 символов.
 *
 * @param inputList Список строк для фильтрации.
 * @return Отфильтрованный список строк.
 */
fun filterStrings(inputList: List<String>): List<String> {
    return inputList.filter { it.length >= 3 }
}

// Пример использования
fun main() {
    val originalList = listOf("a", "bb", "ccc", "dd", "eeeee", "")
    val filteredList = filterStrings(originalList)
    println("Оригинальный список: $originalList")
    println("Отфильтрованный список: $filteredList")
}
/**
 * Функция для фильтрации списка строк по заданному предикату
 * @param strings список строк для фильтрации
 * @param predicate функция-предикат для определения, какие строки оставить
 * @return отфильтрованный список строк
 */
fun filterStrings(strings: List<String>, predicate: (String) -> Boolean): List<String> {
    return strings.filter(predicate)
}

// Пример использования:
fun main() {
    val stringList = listOf("hello", "world", "kotlin", "programming", "filter")
    
    // Фильтрация строк, длина которых больше 5 символов
    val filtered = filterStrings(stringList) { it.length > 5 }
    println("Строки с длиной > 5: $filtered")
    
    // Фильтрация строк, содержащих букву 'o'
    val containsO = filterStrings(stringList) { it.contains('o') }
    println("Строки, содержащие 'o': $containsO")
}
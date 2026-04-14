import java.io.File
import java.util.UUID

/**
 * Фильтрует список строк по заданному предикату и сохраняет результат в файл со случайным именем.
 *
 * @param strings Список строк для фильтрации
 * @param predicate Предикат для фильтрации строк
 * @param directory Директория для сохранения файла (по умолчанию текущая)
 * @return Путь к созданному файлу
 */
fun filterAndSaveToStringFile(
    strings: List<String>,
    predicate: (String) -> Boolean,
    directory: String = "."
): String {
    // Фильтруем список строк
    val filteredStrings = strings.filter(predicate)
    
    // Генерируем случайное имя файла
    val randomFileName = "${UUID.randomUUID()}.txt"
    val filePath = File(directory, randomFileName).absolutePath
    
    // Записываем отфильтрованные строки в файл
    File(filePath).writeText(filteredStrings.joinToString("\n"))
    
    return filePath
}

fun main() {
    // Пример использования
    val strings = listOf("apple", "banana", "cherry", "date", "elderberry", "fig")
    
    // Фильтруем строки, содержащие букву 'a'
    val filePath = filterAndSaveToStringFile(strings, { it.contains('a', ignoreCase = true) })
    
    println("Файл сохранен по пути: $filePath")
    println("Содержимое файла:")
    println(File(filePath).readText())
}

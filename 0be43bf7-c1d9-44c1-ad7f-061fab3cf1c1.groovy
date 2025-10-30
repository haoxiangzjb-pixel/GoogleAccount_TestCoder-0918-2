// Замыкание Groovy для фильтрации списка
def filterClosure = { list ->
    return list.findAll { it % 2 == 0 }
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterClosure(numbers)
println "Оригинальный список: ${numbers}"
println "Четные числа: ${evenNumbers}"

// Можно также использовать для строк
def stringFilter = { list ->
    return list.findAll { it.length() > 3 }
}

def words = ["cat", "dog", "elephant", "bird", "butterfly"]
def longWords = stringFilter(words)
println "Оригинальный список слов: ${words}"
println "Слова длинее 3 символов: ${longWords}"
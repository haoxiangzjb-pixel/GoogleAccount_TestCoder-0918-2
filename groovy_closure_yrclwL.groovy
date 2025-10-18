// Замыкание для фильтрации списка
def filterClosure = { predicate ->
    return { list ->
        return list.findAll(predicate)
    }
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenFilter = filterClosure { it % 2 == 0 }
def result = evenFilter(numbers)

println "Оригинальный список: ${numbers}"
println "Отфильтрованный список (четные числа): ${result}"

// Еще один пример с фильтрацией строк
def strings = ["apple", "banana", "cherry", "date", "elderberry"]
def longStringFilter = filterClosure { it.length() > 5 }
def stringResult = longStringFilter(strings)

println "Оригинальный список строк: ${strings}"
println "Отфильтрованный список (строки длинее 5 символов): ${stringResult}"
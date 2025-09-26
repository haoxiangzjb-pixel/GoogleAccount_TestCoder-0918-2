// Замыкание для фильтрации списка
def filterNumbers = { list ->
    return list.findAll { it instanceof Number && it > 0 }
}

// Пример использования
def mixedList = [1, -2, 'hello', 3.5, null, 0, 42, 'world', -5.5, 100]
def filteredList = filterNumbers(mixedList)

println "Исходный список: $mixedList"
println "Отфильтрованный список (только положительные числа): $filteredList"

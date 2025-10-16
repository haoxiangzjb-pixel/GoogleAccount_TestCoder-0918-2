// Замыкание для фильтрации списка
def filterClosure = { list ->
    return list.findAll { it % 2 == 0 }  // Фильтруем только четные числа
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def filteredNumbers = filterClosure(numbers)
println "Оригинальный список: ${numbers}"
println "Отфильтрованный список (только четные): ${filteredNumbers}"

// Возвращаем замыкание
return filterClosure
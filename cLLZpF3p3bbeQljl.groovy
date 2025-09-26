// Замыкание для фильтрации списка
def filterList = { list, predicate ->
    return list.findAll { item -> predicate(item) }
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterList(numbers) { it % 2 == 0 }
def greaterThanFive = filterList(numbers) { it > 5 }

println "Original list: $numbers"
println "Even numbers: $evenNumbers"
println "Numbers greater than 5: $greaterThanFive"
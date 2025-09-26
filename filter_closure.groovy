// Замыкание для фильтрации списка
def createFilter = { predicate ->
    return { list ->
        return list.findAll(predicate)
    }
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def isEven = { it % 2 == 0 }
def isOdd = { it % 2 != 0 }

def filterEvens = createFilter(isEven)
def filterOdds = createFilter(isOdd)

println "Original list: $numbers"
println "Filtered evens: ${filterEvens(numbers)}"
println "Filtered odds: ${filterOdds(numbers)}"
// Замыкание для фильтрации списка чисел, оставляющее только четные
def filterEvens = { list ->
    list.findAll { it % 2 == 0 }
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterEvens(numbers)

println "Original list: $numbers"
println "Filtered list (only evens): $evenNumbers"

// Замыкание для фильтрации строк по длине
def filterByLength = { minLength, list ->
    list.findAll { it.length() >= minLength }
}

def words = ["apple", "cat", "elephant", "dog", "hippopotamus"]
def longWords = filterByLength(5, words)

println "Original list: $words"
println "Filtered list (length >= 5): $longWords"

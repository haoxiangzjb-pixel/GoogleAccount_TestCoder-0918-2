#!/usr/bin/env groovy

// Замыкание для фильтрации списка
def filterClosure = { list ->
    // Пример: фильтруем только четные числа
    return list.findAll { it % 2 == 0 }
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def filteredNumbers = filterClosure(numbers)
println "Оригинальный список: ${numbers}"
println "Отфильтрованный список (только четные): ${filteredNumbers}"

// Альтернативное замыкание для строк (например, строки, начинающиеся с 'A')
def stringFilterClosure = { list ->
    return list.findAll { it.toString().startsWith('A') }
}

def words = ['Apple', 'Banana', 'Avocado', 'Cherry', 'Apricot', 'Blueberry']
def filteredWords = stringFilterClosure(words)
println "Оригинальный список слов: ${words}"
println "Отфильтрованный список (только начинающиеся с 'A'): ${filteredWords}"
#!/usr/bin/env groovy

// Замыкание для фильтрации списка
def filterClosure = { list, condition ->
    return list.findAll(condition)
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterClosure(numbers) { it % 2 == 0 }
def greaterThanFive = filterClosure(numbers) { it > 5 }

println "Исходный список: ${numbers}"
println "Четные числа: ${evenNumbers}"
println "Числа больше 5: ${greaterThanFive}"

// Еще один пример - фильтрация строк
def strings = ["apple", "banana", "cherry", "date", "elderberry"]
def longStrings = filterClosure(strings) { it.length() > 5 }

println "Строки длиннее 5 символов: ${longStrings}"
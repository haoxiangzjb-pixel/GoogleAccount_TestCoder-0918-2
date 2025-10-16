def filterClosure = { list -> list.findAll { it > 5 } }

// Пример использования:
println filterClosure([1, 3, 7, 9, 2, 10])

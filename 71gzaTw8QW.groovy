// Groovy closure for filtering a list
def filterClosure = { List list, Closure condition ->
    return list.findAll(condition)
}

// Example usage:
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterClosure(numbers) { it % 2 == 0 }
println "Even numbers: ${evenNumbers}"

def words = ["apple", "banana", "cherry", "date", "elderberry"]
def longWords = filterClosure(words) { it.length() > 5 }
println "Words with more than 5 characters: ${longWords}"

// More generic filter function using closure
def createFilter = { Closure condition ->
    return { List list -> list.findAll(condition) }
}

// Example of using the more generic approach
def greaterThanFiveFilter = createFilter { it > 5 }
def filteredNumbers = greaterThanFiveFilter([1, 3, 6, 8, 10, 2, 7])
println "Numbers greater than 5: ${filteredNumbers}"
// Groovy script with closure for filtering lists
// This closure filters a list to return only even numbers
def filterEvenNumbers = { List<Integer> numbers ->
    return numbers.findAll { it % 2 == 0 }
}

// Example usage
def originalList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def filteredList = filterEvenNumbers(originalList)

println "Original list: ${originalList}"
println "Filtered list (even numbers only): ${filteredList}"

// Another example with a different filter
def filterGreaterThanFive = { List<Integer> numbers ->
    return numbers.findAll { it > 5 }
}

def anotherFilteredList = filterGreaterThanFive(originalList)
println "Filtered list (greater than 5): ${anotherFilteredList}"
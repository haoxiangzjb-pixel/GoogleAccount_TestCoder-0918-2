// Groovy script with a closure for filtering lists
// This closure filters even numbers from a list

def filterEvenNumbers = { list ->
    return list.findAll { it % 2 == 0 }
}

// Example usage:
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterEvenNumbers(numbers)
println "Original list: $numbers"
println "Filtered list (even numbers): $evenNumbers"

// Another example with strings - filter words longer than 3 characters
def filterLongWords = { list ->
    return list.findAll { it.length() > 3 }
}

def words = ["cat", "dog", "elephant", "bird", "butterfly"]
def longWords = filterLongWords(words)
println "\nOriginal list: $words"
println "Filtered list (long words): $longWords"
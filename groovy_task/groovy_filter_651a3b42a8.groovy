// Groovy closure for filtering a list to only include even numbers
def filterEvenNumbers = { List numbers ->
    return numbers.findAll { it % 2 == 0 }
}

// Example usage
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterEvenNumbers(numbers)

println "Original list: $numbers"
println "Filtered list (even numbers only): $evenNumbers"
// Groovy script with advanced filtering closures

// Closure to filter prime numbers
def isPrime = { num ->
    if (num < 2) return false
    for (i in 2..<num) {
        if (num % i == 0) return false
    }
    return true
}

def filterPrimes = { list ->
    return list.findAll(isPrime)
}

// Closure to filter objects by a property value
def filterByProperty = { list, property, value ->
    return list.findAll { it[property] == value }
}

// Example usage:
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
def primes = filterPrimes(numbers)
println "Original list: $numbers"
println "Prime numbers: $primes"

// Example with a list of maps
def people = [
    [name: "Alice", age: 30, city: "New York"],
    [name: "Bob", age: 25, city: "London"],
    [name: "Charlie", age: 30, city: "New York"],
    [name: "David", age: 35, city: "Paris"]
]

def newYorkers = filterByProperty(people, "city", "New York")
println "\nOriginal list: $people"
println "People from New York: $newYorkers"
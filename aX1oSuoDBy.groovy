// Groovy script demonstrating a closure for filtering lists

// Define a list of numbers
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// Create a closure for filtering even numbers
def evenFilter = { it % 2 == 0 }

// Create a closure for filtering numbers greater than 5
def greaterThanFive = { it > 5 }

// Apply filters using the closures
def evenNumbers = numbers.findAll(evenFilter)
def bigNumbers = numbers.findAll(greaterThanFive)

// Print results
println "Original list: $numbers"
println "Even numbers: $evenNumbers"
println "Numbers greater than 5: $bigNumbers"

// More complex example with a list of maps
def people = [
    [name: 'Alice', age: 25],
    [name: 'Bob', age: 30],
    [name: 'Charlie', age: 35],
    [name: 'Diana', age: 28]
]

// Closure to filter adults (age >= 30)
def isAdult = { person -> person.age >= 30 }

// Apply filter
def adults = people.findAll(isAdult)

println "\nPeople list:"
people.each { println "  ${it.name}, age ${it.age}" }
println "Adults (30+):"
adults.each { println "  ${it.name}, age ${it.age}" }
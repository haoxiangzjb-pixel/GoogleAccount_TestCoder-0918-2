// Groovy script demonstrating a closure for filtering lists
// File name: JtKTkipRT6.groovy

// Define a list of numbers
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// Create a closure to filter even numbers
def isEven = { it % 2 == 0 }

// Create a closure to filter numbers greater than 5
def greaterThanFive = { it > 5 }

// Apply the closures using the findAll method
def evenNumbers = numbers.findAll(isEven)
def largeNumbers = numbers.findAll(greaterThanFive)

// Print results
println "Original list: $numbers"
println "Even numbers: $evenNumbers"
println "Numbers greater than 5: $largeNumbers"

// More complex example with a list of maps
def people = [
    [name: 'Alice', age: 25],
    [name: 'Bob', age: 30],
    [name: 'Charlie', age: 35],
    [name: 'Diana', age: 28]
]

// Closure to filter adults (age >= 30)
def isAdult = { person -> person.age >= 30 }

// Apply the filter
def adults = people.findAll(isAdult)

println "\nPeople list:"
people.each { println "  ${it.name}, age ${it.age}" }

println "Adults (30 and above):"
adults.each { println "  ${it.name}, age ${it.age}" }
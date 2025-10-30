// F# program to process a list of numbers
open System

// Function to process a list of numbers
let processNumbers numbers =
    // Calculate sum
    let sum = List.sum numbers
    // Calculate average
    let avg = List.averageBy float numbers
    // Find maximum value
    let max = List.max numbers
    // Find minimum value
    let min = List.min numbers
    // Filter even numbers
    let evenNumbers = List.filter (fun x -> x % 2 = 0) numbers
    // Square each number
    let squaredNumbers = List.map (fun x -> x * x) numbers
    
    (sum, avg, max, min, evenNumbers, squaredNumbers)

// Example list of numbers
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the numbers
let (sum, avg, max, min, evenNumbers, squaredNumbers) = processNumbers numbers

// Display results
printfn "Original list: %A" numbers
printfn "Sum: %d" sum
printfn "Average: %.2f" avg
printfn "Maximum: %d" max
printfn "Minimum: %d" min
printfn "Even numbers: %A" evenNumbers
printfn "Squared numbers: %A" squaredNumbers

// Save results to a file with a random name
let random = Random()
let randomFileName = sprintf "/workspace/processed_numbers_%d.txt" (random.Next(10000, 99999))
let content = sprintf "Original list: %A\nSum: %d\nAverage: %.2f\nMaximum: %d\nMinimum: %d\nEven numbers: %A\nSquared numbers: %A" 
                    numbers sum avg max min evenNumbers squaredNumbers

System.IO.File.WriteAllText(randomFileName, content)
printfn "Results saved to: %s" randomFileName
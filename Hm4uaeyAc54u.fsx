// F# program to process a list of numbers
open System

// Function to process a list of numbers
let processNumbers numbers =
    let sum = List.sum numbers
    let average = List.average numbers
    let max = List.max numbers
    let min = List.min numbers
    let evenCount = numbers |> List.filter (fun x -> x % 2 = 0) |> List.length
    let oddCount = numbers |> List.filter (fun x -> x % 2 <> 0) |> List.length
    
    (sum, average, max, min, evenCount, oddCount)

// Sample list of numbers to process
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 15; 20; 25]

// Process the numbers
let (sum, average, max, min, evenCount, oddCount) = processNumbers numbers

// Display results
printfn "Original list: %A" numbers
printfn "Sum: %d" sum
printfn "Average: %.2f" average
printfn "Maximum: %d" max
printfn "Minimum: %d" min
printfn "Count of even numbers: %d" evenCount
printfn "Count of odd numbers: %d" oddCount

// Additional processing: square each number
let squaredNumbers = numbers |> List.map (fun x -> x * x)
printfn "Squared numbers: %A" squaredNumbers

// Filter numbers greater than 5
let filteredNumbers = numbers |> List.filter (fun x -> x > 5)
printfn "Numbers greater than 5: %A" filteredNumbers
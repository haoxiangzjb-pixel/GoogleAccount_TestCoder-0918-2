// F# program to process a list of numbers
open System

// Function to process a list of numbers
let processNumbers numbers =
    let sum = List.sum numbers
    let average = List.average (List.map float numbers)
    let max = List.max numbers
    let min = List.min numbers
    let squared = List.map (fun x -> x * x) numbers
    let positiveCount = List.filter (fun x -> x > 0) numbers |> List.length
    
    (sum, average, max, min, squared, positiveCount)

// Example list of numbers
let numbers = [1; -2; 3; 4; -5; 6; 7; -8; 9; 10]

// Process the numbers
let (sum, average, max, min, squared, positiveCount) = processNumbers numbers

// Print the results
printfn "Original list: %A" numbers
printfn "Sum: %d" sum
printfn "Average: %.2f" average
printfn "Maximum: %d" max
printfn "Minimum: %d" min
printfn "Squared values: %A" squared
printfn "Count of positive numbers: %d" positiveCount

// Save results to a text file
let results = sprintf "Original list: %A\nSum: %d\nAverage: %.2f\nMaximum: %d\nMinimum: %d\nSquared values: %A\nCount of positive numbers: %d" 
                    numbers sum average max min squared positiveCount

System.IO.File.WriteAllText("number_processing_results.txt", results)
printfn "\nResults saved to number_processing_results.txt"
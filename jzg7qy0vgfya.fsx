// F# program to process a list of numbers
open System

// Define a record type to hold results
type ProcessedResults = {
    Original: int list
    Evens: int list
    Squared: int list
    Avg: float
    Max: int option
    Min: int option
}

// Function to calculate the average of a list
let average list =
    match list with
    | [] -> 0.0
    | _ -> List.sum list |> float |> fun sum -> sum / float (List.length list)

// Function to find even numbers
let getEvenNumbers list =
    List.filter (fun x -> x % 2 = 0) list

// Function to square each number
let squareNumbers list =
    List.map (fun x -> x * x) list

// Function to find the maximum value
let findMax list =
    match list with
    | [] -> None
    | _ -> Some (List.max list)

// Function to find the minimum value
let findMin list =
    match list with
    | [] -> None
    | _ -> Some (List.min list)

// Main processing function
let processNumbers numbers =
    printfn "Original list: %A" numbers
    printfn "Even numbers: %A" (getEvenNumbers numbers)
    printfn "Squared numbers: %A" (squareNumbers numbers)
    printfn "Average: %.2f" (average numbers)
    printfn "Maximum: %A" (findMax numbers)
    printfn "Minimum: %A" (findMin numbers)
    
    // Return processed results
    {
        Original = numbers
        Evens = getEvenNumbers numbers
        Squared = squareNumbers numbers
        Avg = average numbers
        Max = findMax numbers
        Min = findMin numbers
    }

// Example list of numbers to process
let sampleNumbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 15; 20; 25]

// Process the numbers
let results = processNumbers sampleNumbers

printfn "\nProcessing complete!"
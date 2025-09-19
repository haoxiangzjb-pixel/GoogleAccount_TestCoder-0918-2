// F# Program to Process a List of Numbers
// This program filters even numbers and squares them

let processNumbers (numbers: int list) : int list =
    numbers
    |> List.filter (fun x -> x % 2 = 0)  // Filter even numbers
    |> List.map (fun x -> x * x)         // Square them

// Example usage
let inputList = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
let result = processNumbers inputList

printfn "Input: %A" inputList
printfn "Output: %A" result
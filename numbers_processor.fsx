open System
open System.IO

// Function to process a list of numbers (example: calculate square of each number)
let processNumbers numbers = 
    numbers |> List.map (fun x -> x * x)

// Function to generate a random filename
let generateRandomFileName extension =
    let random = Random()
    let randomPart = random.Next(100000, 999999) // Random 6-digit number
    sprintf "processed_numbers_%d%s" randomPart extension

// Main program
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

printfn "Original numbers: %A" numbers

let processedNumbers = processNumbers numbers
printfn "Processed numbers (squares): %A" processedNumbers

// Generate a random filename
let fileName = generateRandomFileName ".txt"

// Save the processed numbers to the file
let content = sprintf "Original numbers: %A\nProcessed numbers (squares): %A" numbers processedNumbers
File.WriteAllText(fileName, content)

printfn "Results saved to file: %s" fileName
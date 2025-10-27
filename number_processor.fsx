open System
open System.IO

// Function to process a list of numbers
let processNumbers numbers =
    numbers
    |> List.map (fun x -> x * x) // Square each number as an example processing
    |> List.filter (fun x -> x > 10) // Keep only numbers greater than 10
    |> List.sort

// Sample list of numbers
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the numbers
let processedNumbers = processNumbers numbers

// Generate a random filename
let random = Random()
let fileName = sprintf "output_%d.txt" (random.Next(10000, 99999))

// Save the processed numbers to the file
File.WriteAllLines(fileName, processedNumbers |> List.map string)

printfn "Processed numbers: %A" processedNumbers
printfn "Saved to file: %s" fileName
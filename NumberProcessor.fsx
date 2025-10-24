open System
open System.IO

// Function to process a list of numbers (for example, square each number and filter even results)
let processNumbers numbers =
    numbers
    |> List.map (fun x -> x * x)  // Square each number
    |> List.filter (fun x -> x % 2 = 0)  // Keep only even results

// Function to generate a random filename
let generateRandomFileName extension =
    let random = Random()
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let randomString = 
        [|1..10|] 
        |> Array.map (fun _ -> chars.[random.Next(chars.Length)])
        |> System.String
    sprintf "%s%s" randomString extension

// Sample list of numbers to process
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the numbers
let processedNumbers = processNumbers numbers

// Generate a random filename
let fileName = generateRandomFileName ".txt"

// Convert the processed numbers to a string
let content = sprintf "Original numbers: %A\nProcessed numbers: %A" numbers processedNumbers

// Write to the file with the random name
File.WriteAllText(fileName, content)

printfn "Processed numbers: %A" processedNumbers
printfn "Results saved to file: %s" fileName

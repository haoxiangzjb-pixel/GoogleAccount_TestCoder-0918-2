open System
open System.IO

// Function to generate a random filename
let generateRandomFileName extension =
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let random = Random()
    let randomString = 
        [|1..12|] 
        |> Array.map (fun _ -> chars.[random.Next(chars.Length)])
        |> System.String
    sprintf "%s%s" randomString extension

// Function to process a list of numbers
let processNumbers numbers =
    // Example processing: square each number, then filter even results
    numbers
    |> List.map (fun x -> x * x)
    |> List.filter (fun x -> x % 2 = 0)

// Sample list of numbers to process
let originalNumbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the numbers
let processedNumbers = processNumbers originalNumbers

// Generate a random filename
let randomFileName = generateRandomFileName ".txt"

// Save the processed numbers to the file
let content = 
    sprintf "Original numbers: %A\nProcessed numbers (squared and filtered even): %A" 
        originalNumbers processedNumbers

File.WriteAllText(randomFileName, content)

printfn "Processed numbers: %A" processedNumbers
printfn "Results saved to: %s" randomFileName
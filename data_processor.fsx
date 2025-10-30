open System
open System.IO

// Sample data processing function using pipeline
let processNumbers data =
    data
    |> List.filter (fun x -> x > 0)  // Only positive numbers
    |> List.map (fun x -> x * x)     // Square each number
    |> List.sort                     // Sort the results
    |> List.take 10                  // Take only first 10 elements

// Function to generate a random filename
let generateRandomFileName extension =
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let random = Random()
    let randomString = 
        [1..12] 
        |> List.map (fun _ -> chars.[random.Next(chars.Length)])
        |> List.toArray
        |> System.String
    sprintf "%s%s" randomString extension

// Function to save processed data to a file with random name
let processDataAndSave inputData =
    let processedData = processNumbers inputData
    let fileName = generateRandomFileName ".txt"
    let filePath = Path.Combine(Directory.GetCurrentDirectory(), fileName)
    
    let content = 
        processedData 
        |> List.map string 
        |> String.concat "\n"
    
    File.WriteAllText(filePath, content)
    printfn "Data processed and saved to: %s" filePath
    printfn "Original data: %A" inputData
    printfn "Processed data: %A" processedData
    filePath

// Example usage
let sampleData = [-5; 10; -3; 7; 2; -1; 15; 8; -10; 12; 4; 9; 1; 6; 3]
let savedFilePath = processDataAndSave sampleData

printfn "\nProcessing complete. File saved at: %s" savedFilePath
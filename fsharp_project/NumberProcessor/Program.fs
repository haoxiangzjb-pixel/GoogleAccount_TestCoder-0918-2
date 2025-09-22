// F# program to process a list of numbers
// Calculates sum, average, maximum, and minimum values

// Function to calculate the sum of a list
let sumList lst = List.sum lst

// Function to calculate the average of a list
let avgList lst = List.average lst

// Function to find the maximum value in a list
let maxList lst = List.max lst

// Function to find the minimum value in a list
let minList lst = List.min lst

// Function to process a list and display statistics
let processList lst =
    printfn "Processing list: %A" lst
    printfn "Sum: %f" (sumList lst)
    printfn "Average: %f" (avgList lst)
    printfn "Maximum: %f" (maxList lst)
    printfn "Minimum: %f" (minList lst)
    printfn ""

// Main entry point
[<EntryPoint>]
let main argv =
    // Example lists to process
    let numbers1 = [1.0; 2.0; 3.0; 4.0; 5.0]
    let numbers2 = [10.5; 20.3; 5.7; 15.2; 8.9]
    let numbers3 = [-3.0; -1.5; 0.0; 2.5; 4.0]
    
    // Process each list
    processList numbers1
    processList numbers2
    processList numbers3
    
    // Return success code
    0

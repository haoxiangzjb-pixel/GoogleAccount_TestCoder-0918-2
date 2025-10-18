open System

// Function to process a list of numbers
let processNumbers numbers =
    let sum = List.sum numbers
    let average = List.average numbers
    let max = List.max numbers
    let min = List.min numbers
    let squared = List.map (fun x -> x * x) numbers
    
    (sum, average, max, min, squared)

// Main execution
let main() =
    // Example list of numbers
    let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    
    printfn "Original numbers: %A" numbers
    
    let (sum, average, max, min, squared) = processNumbers numbers
    
    printfn "Sum: %d" sum
    printfn "Average: %.2f" average
    printfn "Max: %d" max
    printfn "Min: %d" min
    printfn "Squared: %A" squared

// Run the main function
main()
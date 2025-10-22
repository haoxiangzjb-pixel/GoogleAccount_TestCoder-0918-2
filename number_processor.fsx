// F# Program to Process a List of Numbers

open System

// Define a list of numbers to process
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15]

// Function to filter even numbers
let evenNumbers = List.filter (fun x -> x % 2 = 0) numbers

// Function to square each number
let squaredNumbers = List.map (fun x -> x * x) numbers

// Function to calculate sum of numbers
let sum = List.sum numbers

// Function to calculate average
let average = (float (List.sum numbers)) / (float (List.length numbers))

// Function to find the maximum number
let maxNumber = List.max numbers

// Function to find the minimum number
let minNumber = List.min numbers

// Display results
printfn "Original list: %A" numbers
printfn "Even numbers: %A" evenNumbers
printfn "Squared numbers: %A" squaredNumbers
printfn "Sum of numbers: %d" sum
printfn "Average of numbers: %.2f" average
printfn "Maximum number: %d" maxNumber
printfn "Minimum number: %d" minNumber

// Function to double each number in the list
let doubledNumbers = List.map (fun x -> x * 2) numbers
printfn "Doubled numbers: %A" doubledNumbers

// Function to filter numbers greater than 5
let numbersGreaterThanFive = List.filter (fun x -> x > 5) numbers
printfn "Numbers greater than 5: %A" numbersGreaterThanFive

// Calculate the product of all numbers
let product = List.fold (*) 1 numbers
printfn "Product of all numbers: %d" product
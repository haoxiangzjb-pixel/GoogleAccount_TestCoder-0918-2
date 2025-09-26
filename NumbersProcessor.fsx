open System

// Пример обработки списка: вычисление квадратов чисел
let processNumbers numbers =
    numbers
    |> List.map (fun x -> x * x)

[<EntryPoint>]
let main argv =
    let inputNumbers = [1; 2; 3; 4; 5]
    let processedNumbers = processNumbers inputNumbers
    printfn "Исходный список: %A" inputNumbers
    printfn "Обработанный список (квадраты): %A" processedNumbers
    0
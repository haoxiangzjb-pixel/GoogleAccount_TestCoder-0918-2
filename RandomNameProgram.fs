open System

// Пример программы F# для обработки списка чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x > 0) // Оставить только положительные числа
    |> List.map (fun x -> x * x)     // Возвести в квадрат
    |> List.sum                      // Найти сумму

let numbers = [1; -2; 3; 4; -5; 6]
let result = processNumbers numbers

[<EntryPoint>]
let main argv =
    printfn "Сумма квадратов положительных чисел: %d" result
    0
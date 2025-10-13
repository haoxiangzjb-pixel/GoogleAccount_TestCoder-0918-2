open System

// Функция для обработки списка чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x > 0) // Пример обработки: фильтрация положительных чисел
    |> List.map (fun x -> x * x)     // Пример обработки: возведение в квадрат
    |> List.rev                      // Пример обработки: обратный порядок

let numbers = [1; -2; 3; 4; -5; 6; 7]
let processedNumbers = processNumbers numbers

let main() =
    printfn "Исходный список: %A" numbers
    printfn "Обработанный список: %A" processedNumbers

main()
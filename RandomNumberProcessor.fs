// F# программа для обработки списка чисел
// В данном примере, "обработка" означает вычисление суммы квадратов четных чисел

open System

// Функция для вычисления суммы квадратов четных чисел в списке
let sumOfSquaresOfEvens numbers =
    numbers
    |> List.filter (fun x -> x % 2 = 0)  // Фильтруем четные числа
    |> List.map (fun x -> x * x)         // Возводим их в квадрат
    |> List.sum                          // Суммируем

[<EntryPoint>]
let main argv =
    // Пример списка чисел
    let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    printfn "Входной список: %A" numbers

    // Обработка списка
    let result = sumOfSquaresOfEvens numbers
    printfn "Сумма квадратов четных чисел: %d" result

    0 // Возвращаем код завершения
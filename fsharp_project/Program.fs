open System

// Функция для обработки списка чисел: вычисляет квадраты четных чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x % 2 = 0) // Фильтруем четные числа
    |> List.map (fun x -> x * x)         // Возводим в квадрат

[<EntryPoint>]
let main argv =
    let originalList = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    let processedList = processNumbers originalList

    printfn "Original list: %A" originalList
    printfn "Processed list (squares of even numbers): %A" processedList

    // Генерация случайного имени файла
    let random = Random()
    let fileName = sprintf "output_%d.txt" (random.Next(1000, 9999))

    // Сохранение результата в файл
    File.WriteAllText(fileName, (sprintf "%A" processedList))
    printfn "Result saved to %s" fileName

    0 // Возврат кода выхода
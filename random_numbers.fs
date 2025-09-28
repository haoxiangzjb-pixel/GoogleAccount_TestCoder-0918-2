open System

// Функция для обработки списка чисел: вычисляет квадраты четных чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x % 2 = 0)  // Фильтруем четные числа
    |> List.map (fun x -> x * x)         // Вычисляем их квадраты

[<EntryPoint>]
let main argv =
    let inputNumbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    let processedNumbers = processNumbers inputNumbers

    printfn "Исходный список: %A" inputNumbers
    printfn "Обработанный список (квадраты четных чисел): %A" processedNumbers

    // Сохраняем результат в файл со случайным именем
    let fileName = "output_" + Guid.NewGuid().ToString() + ".txt"
    use file = new System.IO.StreamWriter(fileName)
    file.WriteLine("Исходный список:")
    file.WriteLine(inputNumbers |> String.concat "; ")
    file.WriteLine("Обработанный список (квадраты четных чисел):")
    file.WriteLine(processedNumbers |> String.concat "; ")

    printfn "Результаты сохранены в файл: %s" fileName
    0
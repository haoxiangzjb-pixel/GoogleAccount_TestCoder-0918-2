// Функция для обработки списка чисел: вычисляет квадраты четных чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x % 2 = 0)  // Фильтруем четные числа
    |> List.map (fun x -> x * x)         // Вычисляем квадраты

// Тестовый список чисел
let inputList = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Обрабатываем список
let outputList = processNumbers inputList

// Выводим результаты
printfn "Исходный список: %A" inputList
printfn "Обработанный список (квадраты четных чисел): %A" outputList

// Сохраняем результат в файл
let outputFile = "processed_numbers_result.txt"
outputList
|> List.map string
|> String.concat "; "
|> (fun s -> sprintf "Результат обработки: %s" s)
|> (fun s -> System.IO.File.WriteAllText(outputFile, s))

printfn "Результат также сохранен в файл: %s" outputFile
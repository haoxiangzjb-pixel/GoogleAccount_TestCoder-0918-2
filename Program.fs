open System
open System.IO

// Функция для обработки списка чисел
let processNumbers numbers =
    numbers
    |> List.map (fun x -> x * x) // Пример обработки: возведение в квадрат
    |> List.filter (fun x -> x > 10) // Пример обработки: фильтрация чисел <= 10

let numbers = [1; 2; 3; 4; 5; 6]

let processedNumbers = processNumbers numbers

// Генерация случайного имени файла
let random = Random()
let fileName = sprintf "output_%d.txt" (random.Next(1000, 9999))

// Сохранение в файл
File.WriteAllText(fileName, (String.concat ", " (List.map string processedNumbers)))

printfn "Обработанный список: %A" processedNumbers
printfn "Сохранен в файл: %s" fileName

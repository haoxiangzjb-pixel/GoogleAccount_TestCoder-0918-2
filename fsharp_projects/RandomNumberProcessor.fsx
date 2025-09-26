open System
open System.IO

// Функция для генерации случайного имени файла
let getRandomFileName extension =
    Path.Combine(Path.GetTempPath(), Path.GetRandomFileName() + extension)

// Список чисел для обработки
let numbers = [1 .. 100] // Список от 1 до 100

// Простая обработка: вычисление суммы
let sum = List.sum numbers

// Генерация случайного имени файла с расширением .txt
let fileName = getRandomFileName ".txt"

// Сохранение результата в файл
File.WriteAllText(fileName, sprintf "Список: %A\nСумма: %d" numbers sum)

printfn "Результаты обработки списка сохранены в файл: %s" fileName
printfn "Сумма чисел: %d" sum
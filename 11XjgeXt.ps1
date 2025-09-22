# Получаем список процессов
$processes = Get-Process

# Генерируем случайное имя для файла вывода
$outputFilename = "process_list_" + (Get-Random) + ".txt"

# Сохраняем список процессов в файл
$processes | Out-File -FilePath $outputFilename

# Выводим сообщение о завершении
Write-Output "Список процессов сохранен в файл: $outputFilename"
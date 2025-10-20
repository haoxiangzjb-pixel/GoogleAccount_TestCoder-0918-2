# Получаем список процессов
$processes = Get-Process

# Генерируем случайное имя файла
$randomFileName = "processes_" + (Get-Random -Maximum 99999) + ".csv"

# Сохраняем список процессов в файл CSV
$processes | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Output "Список процессов сохранен в файл: $randomFileName"
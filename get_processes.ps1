# Скрипт PowerShell для получения списка процессов и сохранения в файл со случайным именем

# Получаем список процессов
$processes = Get-Process

# Генерируем случайное имя файла
$randomFileName = "processes_" + (Get-Random -Maximum 99999) + ".txt"

# Сохраняем список процессов в файл
$processes | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "Список процессов сохранен в файл: $randomFileName"
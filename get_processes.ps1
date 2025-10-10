# Генерация случайного имени файла
$randomFileName = "processes_" + (Get-Random -Maximum 10000) + ".txt"

# Получение списка процессов и сохранение в файл
Get-Process | Out-File -FilePath $randomFileName

Write-Output "Список процессов сохранен в файл: $randomFileName"
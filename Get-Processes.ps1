# Генерируем случайное имя файла
$randomFileName = "processes_" + (Get-Random) + ".txt"

# Получаем список процессов и сохраняем его в файл
Get-Process | Out-File -FilePath $randomFileName

Write-Output "Список процессов сохранен в файл: $randomFileName"
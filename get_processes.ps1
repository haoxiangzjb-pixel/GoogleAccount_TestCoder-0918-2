# Генерируем случайное имя файла
$randomFileName = "processes_" + (Get-Random) + ".txt"

# Получаем список процессов и сохраняем в файл
Get-Process | Out-File -FilePath $randomFileName

# Выводим сообщение о завершении
Write-Host "Список процессов сохранен в файл: $randomFileName"
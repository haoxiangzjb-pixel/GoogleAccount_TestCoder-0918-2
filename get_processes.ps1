# Генерируем случайное имя файла
$randomFileName = "process_list_" + (Get-Random -Maximum 10000) + ".txt"

# Получаем список процессов и сохраняем в файл
Get-Process | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Output "Список процессов сохранен в файл: $randomFileName"
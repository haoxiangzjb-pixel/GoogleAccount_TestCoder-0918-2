# PowerShell скрипт для получения списка процессов и сохранения в файл со случайным именем

# Генерация случайного имени файла с помощью Python
$randomFileName = python3 /workspace/powershell_scripting/generate_random_name.py
$filePath = Join-Path -Path "/workspace/powershell_scripting" -ChildPath $randomFileName

# Получение списка процессов и сохранение в файл
Get-Process | Out-File -FilePath $filePath

Write-Host "Список процессов сохранен в файл: $filePath"
# Скрипт PowerShell для получения списка процессов и сохранения в файл со случайным именем
# Имя файла передается как аргумент
param(
    [string]$OutputFile = "process_list.txt"
)

Get-Process | Out-File -FilePath $OutputFile -Encoding UTF8
Write-Host "Список процессов сохранен в файл: $OutputFile"
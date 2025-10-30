# PowerShell script to get list of processes and save to a file with random name

# Generate a random filename
$randomName = "processes_" + (Get-Random -Maximum 99999) + "_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".txt"
$filePath = Join-Path $PSScriptRoot $randomName

# Get the list of processes and export to the file
Get-Process | Out-File -FilePath $filePath

Write-Host "Process list saved to: $filePath"
# PowerShell script to get list of processes and save to a file with random name

# Generate a random filename
$randomName = "processes_" + (Get-Random -Maximum 99999) + ".txt"
$filePath = Join-Path $PWD $randomName

# Get the list of processes and export to the file
Get-Process | Out-File -FilePath $filePath

Write-Output "Process list saved to: $filePath"
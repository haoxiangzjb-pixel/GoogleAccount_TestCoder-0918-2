# PowerShell script to get a list of processes and save to a file with a random name

# Get the list of processes
$processes = Get-Process

# Generate a random filename
$randomName = "processes_" + (Get-Random -Maximum 99999) + ".txt"
$outputPath = Join-Path -Path $PSScriptRoot -ChildPath $randomName

# Save the process list to the file
$processes | Out-File -FilePath $outputPath

Write-Host "Process list saved to: $outputPath"
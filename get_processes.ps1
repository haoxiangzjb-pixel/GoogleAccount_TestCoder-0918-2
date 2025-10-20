# PowerShell script to get a list of processes and save to a file with a random name

# Get the list of processes
$processes = Get-Process

# Generate a random filename
$randomName = [System.IO.Path]::GetRandomFileName() + ".txt"
$outputFile = Join-Path -Path $PWD -ChildPath $randomName

# Export the processes to the file
$processes | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host "Process list saved to: $outputFile"
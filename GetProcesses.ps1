# PowerShell script to get list of processes and save to file with random name
# Get the list of processes
$processes = Get-Process

# Generate a random file name
$randomName = -join ((65..90) + (97..122) | Get-Random -Count 10 | % {[char]$_})
$fileName = "processes_$randomName.txt"

# Save the processes to the file
$processes | Out-File -FilePath $fileName

# Output confirmation
Write-Host "Processes saved to $fileName"
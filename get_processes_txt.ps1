# PowerShell script to get list of processes and save to a text file with random name

# Generate a random file name
$randomFileName = "processes_" + (Get-Random -Maximum 99999) + ".txt"

# Get the list of processes and export to text file
Get-Process | Out-File -FilePath $randomFileName

Write-Host "Process list saved to $randomFileName"
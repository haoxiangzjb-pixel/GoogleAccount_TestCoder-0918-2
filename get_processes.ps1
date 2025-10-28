# PowerShell script to get list of processes and save to a file with random name

# Generate a random file name
$randomFileName = "processes_" + (Get-Random -Maximum 99999) + ".csv"

# Get the list of processes and export to CSV file
Get-Process | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Host "Process list saved to $randomFileName"
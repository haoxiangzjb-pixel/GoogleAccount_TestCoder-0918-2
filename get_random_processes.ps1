# PowerShell Script to Get Processes and Save to a Randomly Named File

# Get the list of processes
$processes = Get-Process

# Generate a random filename with .csv extension
$randomFileName = [System.IO.Path]::GetRandomFileName() + '.csv'

# Export the processes to the randomly named CSV file in the current directory
$processes | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Output "Process list saved to $randomFileName"
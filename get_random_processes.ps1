# Generate a random filename
$randomFileName = "processes_" + (Get-Random -Maximum 10000) + ".csv"

# Get the list of processes and export to the randomly named CSV file
Get-Process | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Output "Process list exported to $randomFileName"
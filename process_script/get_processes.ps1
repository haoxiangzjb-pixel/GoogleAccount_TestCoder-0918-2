# Get the list of processes and export to a CSV file with a random name
$processes = Get-Process
$randomFileName = "processes_" + (Get-Random) + ".csv"
$processes | Export-Csv -Path $randomFileName -NoTypeInformation
Write-Host "Process list saved to $randomFileName"
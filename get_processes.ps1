# PowerShell script to get processes and save to a file with a random name
$randomName = "438cc38741d9c30801105abc96e9e3ef"
$outputPath = "/workspace/$randomName.txt"

# Get the list of processes and export to the file
Get-Process | Out-File -FilePath $outputPath

Write-Host "Process list saved to $outputPath"
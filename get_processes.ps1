# PowerShell script to get a list of processes and save to a file with a random name
# The random filename is generated within the script



# Generate a random filename
$randomFileName = "processes_$(Get-Random).txt"

# Get the list of processes and export to the randomly generated file
Get-Process | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "Process list saved to $randomFileName"
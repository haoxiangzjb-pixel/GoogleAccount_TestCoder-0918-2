# PowerShell script to output current date and time
# This script can be executed in any PowerShell environment

# Get and display the current date and time
$currentDateTime = Get-Date
Write-Output "Current Date and Time: $currentDateTime"

# Additional formatting options
Write-Output "Formatted Date (MM/dd/yyyy): $($currentDateTime.ToString('MM/dd/yyyy'))"
Write-Output "Formatted Time (HH:mm:ss): $($currentDateTime.ToString('HH:mm:ss'))"
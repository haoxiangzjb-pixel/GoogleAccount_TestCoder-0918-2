# PowerShell script to get processes and save to a random file
# The output file name is passed as an argument
param([string]$OutputFile = "process_list.txt")

Get-Process | Out-File -FilePath $OutputFile -Encoding UTF8
Write-Output "Process list saved to $OutputFile"
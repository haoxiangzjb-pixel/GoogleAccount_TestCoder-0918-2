# PowerShell script to get processes and save to a random file
$randomName = -join ((65..90) + (97..122) | Get-Random -Count 16 | ForEach-Object {[char]$_})
$filename = "$randomName.txt"
Get-Process | Out-File -FilePath $filename
Write-Host "Process list saved to $filename"
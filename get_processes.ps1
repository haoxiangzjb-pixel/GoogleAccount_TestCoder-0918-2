# PowerShell script to get processes and save to a file with a random name
$processes = Get-Process
$randomFileName = [System.IO.Path]::GetRandomFileName() + ".txt"
$processes | Out-File -FilePath $randomFileName
Write-Output "Process list saved to $randomFileName"
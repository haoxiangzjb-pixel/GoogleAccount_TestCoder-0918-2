# PowerShell script to get a list of processes and save to a file with a random name
$processes = Get-Process
$randomFileName = [System.Guid]::NewGuid().ToString() + ".txt"
$processes | Out-File -FilePath $randomFileName
Write-Host "Process list saved to $randomFileName"
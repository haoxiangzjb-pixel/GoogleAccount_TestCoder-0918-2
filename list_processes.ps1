# PowerShell script to get process list and save to a file with a random name
$processList = Get-Process
$randomFileName = "process_list_" + (Get-Random -Maximum 10000) + ".txt"
$outputPath = Join-Path -Path "/workspace" -ChildPath $randomFileName
$processList | Out-File -FilePath $outputPath
Write-Output "Process list saved to $outputPath"
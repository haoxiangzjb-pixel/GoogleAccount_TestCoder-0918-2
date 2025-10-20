# PowerShell script to get current user information
$userInfo = Get-LocalUser -Name $env:USERNAME
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object System.Security.Principal.WindowsPrincipal($currentUser)

Write-Host "Current User Information:"
Write-Host "Username: $($env:USERNAME)"
Write-Host "User Domain: $($env:USERDOMAIN)"
Write-Host "Computer Name: $($env:COMPUTERNAME)"
Write-Host "User SID: $($currentUser.User.Value)"
Write-Host "Is Administrator: $($principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))"

# Alternative method using WMI
$wmiUserInfo = Get-WmiObject -Class Win32_ComputerSystem
Write-Host "Logged on Users: $($wmiUserInfo.UserName)"

# Save user information to a text file
$output = @"
Username: $($env:USERNAME)
User Domain: $($env:USERDOMAIN)
Computer Name: $($env:COMPUTERNAME)
User SID: $($currentUser.User.Value)
Is Administrator: $($principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))
"@ 

$output | Out-File -FilePath "user_details.txt" -Encoding UTF8
Write-Host "User information saved to user_details.txt"

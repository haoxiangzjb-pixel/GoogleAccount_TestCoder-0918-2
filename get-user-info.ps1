# PowerShell script to get current user information
Write-Host "Getting current user information..."

# Get current user details
$currentUserInfo = Get-ComputerInfo
$userName = $env:USERNAME
$userDomain = $env:USERDOMAIN
$fullName = (Get-WmiObject -Class Win32_ComputerSystem).UserName

# Alternative method to get user info
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$userPrincipal = New-Object System.Security.Principal.WindowsPrincipal($currentUser)

Write-Host "Username: $userName"
Write-Host "User Domain: $userDomain"
Write-Host "Full Name: $fullName"
Write-Host "Current User: $($currentUser.Name)"
Write-Host "Is Admin: $($userPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))"

# Get additional user properties
$userProperties = @{
    "Name" = $userName
    "Domain" = $userDomain
    "SID" = $currentUser.User.Value
    "IsAdmin" = $userPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
}

$userProperties
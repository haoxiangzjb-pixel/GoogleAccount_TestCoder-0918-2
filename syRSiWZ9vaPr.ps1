# PowerShell script to get current user information
Write-Host "Getting current user information..."

# Get current user details
$userName = $env:USERNAME
$userDomain = $env:USERDOMAIN
$userDNSDomain = $env:USERDNSDOMAIN

# Alternative method to get user info using .NET
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$userPrincipal = New-Object System.Security.Principal.WindowsPrincipal($currentUser)

Write-Host "Username: $userName"
Write-Host "User Domain: $userDomain"
Write-Host "DNS Domain: $userDNSDomain"
Write-Host "Current User SID: $($currentUser.User.Value)"
Write-Host "Is Admin: $($userPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))"

# Create a user information object
$userInfo = [PSCustomObject]@{
    "Username" = $userName
    "Domain" = $userDomain
    "DNSDomain" = $userDNSDomain
    "SID" = $currentUser.User.Value
    "IsAdmin" = $userPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
    "AuthenticationType" = $currentUser.AuthenticationType
    "IsAuthenticated" = $currentUser.IsAuthenticated
}

# Display the user information object
$userInfo

# Optionally save to a file
$outputPath = "userinfo_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
$userInfo | Out-File -FilePath $outputPath
Write-Host "User information also saved to: $outputPath"

# PowerShell script to get current user information and save to a randomly named .ps1 file

# Get current user information
$userInfo = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, WindowsInstallationType, WindowsBuildLabEx
$currentUserInfo = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$currentUser = $currentUserInfo.Name
$userPrincipal = New-Object System.Security.Principal.WindowsPrincipal($currentUserInfo)
$isAdministrator = $userPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)

# Create a hashtable with user information
$userData = @{
    "CurrentUser" = $currentUser
    "IsAdministrator" = $isAdministrator
    "UserType" = $currentUserInfo.User
    "AuthenticationType" = $currentUserInfo.AuthenticationType
    "WindowsProductName" = $userInfo.WindowsProductName
    "WindowsVersion" = $userInfo.WindowsVersion
    "WindowsInstallationType" = $userInfo.WindowsInstallationType
    "WindowsBuildLabEx" = $userInfo.WindowsBuildLabEx
}

# Convert user data to PowerShell hashtable string
$userDataString = "`$userData = @{`n"
foreach ($key in $userData.Keys) {
    $value = $userData[$key]
    $userDataString += "    `"$key`" = `"$value`"`n"
}
$userDataString += "}"

# Generate a random filename
$randomFileName = "UserInfo_" + (Get-Random -Maximum 99999) + ".ps1"

# Save the user data to the randomly named file
$userDataString | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "Current user information has been saved to: $randomFileName"
Write-Host "User: $currentUser"
Write-Host "Is Administrator: $isAdministrator"
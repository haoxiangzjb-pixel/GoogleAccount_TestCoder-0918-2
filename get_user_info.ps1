# PowerShell script to get current user information and save to a randomly named .ps1 file

# Get current user information
$currentUserInfo = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, WindowsInstallationType, WindowsBuildLabEx
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$userDetails = @{
    Name = $currentUser.Name
    UserPrincipalName = $currentUser.User.Value
    Groups = $currentUser.Groups | ForEach-Object {
        try { $_.Translate([System.Security.Principal.NTAccount]).Value }
        catch { $_.Value }
    }
}

# Create a custom object with user information
$userInfo = [PSCustomObject]@{
    DateTime = Get-Date
    ComputerInfo = $currentUserInfo
    UserName = $userDetails.Name
    UserPrincipalName = $userDetails.UserPrincipalName
    Groups = $userDetails.Groups -join ", "
}

# Generate a random filename
$randomName = "UserInfo_" + (Get-Random -Maximum 99999) + ".ps1"

# Save the user information to the randomly named file
$userInfo | Out-File -FilePath $randomName -Encoding UTF8

Write-Host "User information saved to: $randomName"
Write-Host "User: $($userInfo.UserName)"
Write-Host "Groups: $($userInfo.Groups)"
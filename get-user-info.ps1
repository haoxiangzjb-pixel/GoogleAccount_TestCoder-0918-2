# PowerShell script to get current user information and save to a randomly named .ps1 file

# Get current user information
$currentUserInfo = Get-ComputerInfo | Select-Object WindowsUserName, WindowsDomain, CurrentTimeZone
# Alternative method to get user info
$userDetails = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-WmiObject -Class Win32_ComputerSystem).SID
}

# Create random filename
$randomFileName = "UserInfo_" + (Get-Random -Maximum 10000) + ".ps1"

# Prepare content to save
$contentToSave = @"
# User Information
UserName: $($userDetails.UserName)
UserDomain: $($userDetails.UserDomain)
ComputerName: $($userDetails.ComputerName)
"@

# Save to the randomly named file
$contentToSave | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "Current user information has been saved to: $randomFileName"
Write-Host "User: $($userDetails.UserName)@$($userDetails.UserDomain) on $($userDetails.ComputerName)"
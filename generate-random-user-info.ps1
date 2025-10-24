# PowerShell脚本：获取当前用户信息并保存到随机命名的.ps1文件中

# 获取当前用户信息
$currentUserInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-CimInstance Win32_UserAccount -Filter "Name='$env:USERNAME'").SID
    HomeDirectory = $env:USERPROFILE
    CurrentDate = Get-Date
    OSVersion = (Get-CimInstance Win32_OperatingSystem).Version
}

# 显示用户信息
Write-Host "当前用户信息："
Write-Host "用户名: $($currentUserInfo.UserName)"
Write-Host "用户域: $($currentUserInfo.UserDomain)"
Write-Host "计算机名: $($currentUserInfo.ComputerName)"
Write-Host "用户SID: $($currentUserInfo.UserSID)"
Write-Host "主目录: $($currentUserInfo.HomeDirectory)"
Write-Host "操作系统版本: $($currentUserInfo.OSVersion)"
Write-Host "当前时间: $($currentUserInfo.CurrentDate)"

# 生成随机文件名
$randomFileName = "UserInfo_" + (Get-Random -Maximum 99999) + "_" + (Get-Date -Format 'yyyyMMdd_HHmmss') + ".ps1"

# 创建包含用户信息的新PowerShell脚本文件
$scriptContent = @"
# 随机生成的用户信息文件
# 生成时间: $(Get-Date)

`$userInfo = @{
    UserName = '$($currentUserInfo.UserName)'
    UserDomain = '$($currentUserInfo.UserDomain)'
    ComputerName = '$($currentUserInfo.ComputerName)'
    UserSID = '$($currentUserInfo.UserSID)'
    HomeDirectory = '$($currentUserInfo.HomeDirectory)'
    OSVersion = '$($currentUserInfo.OSVersion)'
    CurrentDate = '$($currentUserInfo.CurrentDate)'
}

Write-Host "用户信息:"
`$userInfo.GetEnumerator() | ForEach-Object { Write-Host "`$(`$_.Key): `$(`$_.Value)" }
"@

# 保存到随机命名的.ps1文件
$scriptContent | Out-File -FilePath $randomFileName -Encoding UTF8
Write-Host "用户信息已保存到随机命名的PowerShell脚本: $randomFileName"
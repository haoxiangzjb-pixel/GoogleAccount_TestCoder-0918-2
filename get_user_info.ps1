# PowerShell脚本：获取当前用户信息并保存到随机命名的.ps1文件中

# 获取当前用户信息
$currentUserInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserProfile = $env:USERPROFILE
    HomePath = $env:HOMEPATH
    HomeDrive = $env:HOMEDRIVE
    LogonServer = $env:LOGONSERVER
}

# 显示当前用户信息
Write-Host "当前用户信息：" -ForegroundColor Green
$currentUserInfo.GetEnumerator() | ForEach-Object {
    Write-Host "$($_.Key): $($_.Value)"
}

# 生成随机文件名
$randomFileName = "UserInfo_" + (Get-Date -Format "yyyyMMdd_HHmmss") + "_" + (Get-Random -Maximum 10000) + ".ps1"

# 将用户信息保存到新文件中
$content = @"
# 当前用户信息 - 生成于 $(Get-Date)
`$userInfo = @{
    UserName = '$($currentUserInfo.UserName)'
    UserDomain = '$($currentUserInfo.UserDomain)'
    ComputerName = '$($currentUserInfo.ComputerName)'
    UserProfile = '$($currentUserInfo.UserProfile)'
    HomePath = '$($currentUserInfo.HomePath)'
    HomeDrive = '$($currentUserInfo.HomeDrive)'
    LogonServer = '$($currentUserInfo.LogonServer)'
}

# 显示用户信息
Write-Host "保存的用户信息：" -ForegroundColor Green
`$userInfo.GetEnumerator() | ForEach-Object {
    Write-Host "`$(`$_.Key): `$(`$_.Value)"
}
"@

# 保存到随机命名的文件
$content | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "用户信息已保存到文件: $randomFileName" -ForegroundColor Yellow
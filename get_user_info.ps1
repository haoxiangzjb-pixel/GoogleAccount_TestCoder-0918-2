# PowerShell脚本：获取当前用户信息并保存到随机命名的.ps1文件中

# 获取当前用户信息
$currentUserInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-WmiObject Win32_UserAccount | Where-Object {$_.Name -eq $env:USERNAME}).SID
    HomeDirectory = $env:USERPROFILE
    LogonServer = $env:LOGONSERVER
    DateTime = Get-Date
}

# 显示当前用户信息
Write-Host "当前用户信息：" -ForegroundColor Green
Write-Host "用户名: $($currentUserInfo.UserName)"
Write-Host "用户域: $($currentUserInfo.UserDomain)"
Write-Host "计算机名: $($currentUserInfo.ComputerName)"
Write-Host "用户SID: $($currentUserInfo.UserSID)"
Write-Host "主目录: $($currentUserInfo.HomeDirectory)"
Write-Host "登录服务器: $($currentUserInfo.LogonServer)"
Write-Host "获取时间: $($currentUserInfo.DateTime)"

# 生成随机文件名
$randomFileName = "UserInfo_" + (Get-Random -Maximum 100000) + ".ps1"

# 创建包含用户信息的PowerShell脚本内容
$scriptContent = @"
# 由 get_user_info.ps1 生成的用户信息脚本
# 生成时间: $((Get-Date).ToString())

`$generatedUserInfo = @{
    UserName = "$($currentUserInfo.UserName)"
    UserDomain = "$($currentUserInfo.UserDomain)"
    ComputerName = "$($currentUserInfo.ComputerName)"
    UserSID = "$($currentUserInfo.UserSID)"
    HomeDirectory = "$($currentUserInfo.HomeDirectory)"
    LogonServer = "$($currentUserInfo.LogonServer)"
    DateTime = "$($currentUserInfo.DateTime)"
}

Write-Host "从生成的脚本中读取用户信息：" -ForegroundColor Cyan
Write-Host "用户名: `$(`$generatedUserInfo.UserName)"
Write-Host "用户域: `$(`$generatedUserInfo.UserDomain)"
Write-Host "计算机名: `$(`$generatedUserInfo.ComputerName)"
Write-Host "用户SID: `$(`$generatedUserInfo.UserSID)"
Write-Host "主目录: `$(`$generatedUserInfo.HomeDirectory)"
Write-Host "登录服务器: `$(`$generatedUserInfo.LogonServer)"
Write-Host "获取时间: `$(`$generatedUserInfo.DateTime)"
"@

# 保存到随机命名的.ps1文件
$scriptContent | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "用户信息已保存到文件: $randomFileName" -ForegroundColor Yellow
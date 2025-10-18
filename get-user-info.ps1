# PowerShell脚本：获取当前用户信息并保存到随机命名的.ps1文件中

# 获取当前用户信息
$currentUserInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-CimInstance Win32_UserAccount | Where-Object {$_.Name -eq $env:USERNAME}).SID
    HomeDirectory = $env:USERPROFILE
    CurrentDateTime = Get-Date
}

# 显示当前用户信息
Write-Host "当前用户信息："
Write-Host "用户名: $($currentUserInfo.UserName)"
Write-Host "用户域: $($currentUserInfo.UserDomain)"
Write-Host "计算机名: $($currentUserInfo.ComputerName)"
Write-Host "用户SID: $($currentUserInfo.UserSID)"
Write-Host "主目录: $($currentUserInfo.HomeDirectory)"
Write-Host "当前时间: $($currentUserInfo.CurrentDateTime)"

# 生成随机文件名
$randomFileName = "UserInfo_" + (Get-Date -Format "yyyyMMdd_HHmmss") + "_" + (1000..9999 | Get-Random) + ".ps1"

# 创建包含用户信息的新脚本
$newScriptContent = @"
# 生成于: $((Get-Date).ToString())
# 当前用户信息:

`$userInfo = @{
    UserName = "$($currentUserInfo.UserName)"
    UserDomain = "$($currentUserInfo.UserDomain)"
    ComputerName = "$($currentUserInfo.ComputerName)"
    UserSID = "$($currentUserInfo.UserSID)"
    HomeDirectory = "$($currentUserInfo.HomeDirectory)"
    CurrentDateTime = "$($currentUserInfo.CurrentDateTime)"
}

Write-Host "保存的用户信息:"
foreach (`$key in `$userInfo.Keys) {
    Write-Host "`$key : `$(`$userInfo[`$key])"
}
"@

# 保存到随机命名的.ps1文件
$newScriptContent | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "用户信息已保存到文件: $randomFileName"
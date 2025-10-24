# PowerShell脚本：获取当前用户信息
# 获取当前用户信息
$currentUserInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-CimInstance Win32_UserAccount | Where-Object {$_.Name -eq $env:USERNAME}).SID
    HomeDirectory = $env:USERPROFILE
    CurrentDate = Get-Date
}

# 显示用户信息
Write-Host "当前用户信息："
Write-Host "用户名: $($currentUserInfo.UserName)"
Write-Host "用户域: $($currentUserInfo.UserDomain)"
Write-Host "计算机名: $($currentUserInfo.ComputerName)"
Write-Host "用户SID: $($currentUserInfo.UserSID)"
Write-Host "主目录: $($currentUserInfo.HomeDirectory)"
Write-Host "当前时间: $($currentUserInfo.CurrentDate)"

# 保存到文件
$outputPath = "UserInfo_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
$currentUserInfo | Out-File -FilePath $outputPath
Write-Host "用户信息已保存到: $outputPath"
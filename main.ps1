# PowerShell脚本：获取当前用户信息并保存到随机命名的.ps1文件中

# 生成随机文件名
$randomFileName = "user_info_" + (Get-Random -Maximum 10000) + ".ps1"
$fullPath = Join-Path $PWD $randomFileName

# 获取当前用户信息
$currentUserInfo = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, CurrentTimeZone, BootUpTime
$currentOSUser = $env:USERNAME
$currentUserSID = (Get-CimInstance Win32_UserAccount | Where-Object {$_.Name -eq $currentOSUser}).SID
$localGroups = Get-LocalGroup | Where-Object {Get-LocalGroupMember $_.Name | Where-Object {$_.Name -like "*$currentOSUser*"}} | Select-Object Name

# 创建包含用户信息的脚本内容
$scriptContent = @"
# 生成的用户信息脚本 - $(Get-Date)

# 系统信息
Write-Output "=== 当前系统信息 ==="
Write-Output "操作系统: $($currentUserInfo.WindowsProductName)"
Write-Output "系统版本: $($currentUserInfo.WindowsVersion)"
Write-Output "当前时区: $($currentUserInfo.CurrentTimeZone)"
Write-Output "启动时间: $($currentUserInfo.BootUpTime)"

Write-Output "`n=== 当前用户信息 ==="
Write-Output "用户名: $currentOSUser"
Write-Output "用户SID: $currentUserSID"

Write-Output "`n=== 用户所属本地组 ==="
$(foreach ($group in $localGroups) {
"Write-Output `"组名: $($group.Name)`""
})
"@

# 将内容写入随机命名的.ps1文件
Set-Content -Path $fullPath -Value $scriptContent

Write-Output "用户信息已保存到文件: $fullPath"
Write-Output "脚本内容："
Write-Output $scriptContent
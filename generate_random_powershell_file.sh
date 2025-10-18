#!/bin/bash

# Bash脚本：模拟PowerShell功能，生成随机命名的.ps1文件，其中包含获取用户信息的PowerShell代码

# 生成随机文件名
random_number=$(shuf -i 1-10000 -n 1)
random_filename="user_info_$random_number.ps1"

# 创建PowerShell脚本内容
cat > "$random_filename" << 'EOF'
# 获取当前用户信息的PowerShell脚本
# 系统信息
$currentUserInfo = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, CurrentTimeZone, BootUpTime
$currentOSUser = $env:USERNAME
$currentUserSID = (Get-CimInstance Win32_UserAccount | Where-Object {$_.Name -eq $currentOSUser}).SID
$localGroups = Get-LocalGroup | Where-Object {Get-LocalGroupMember $_.Name | Where-Object {$_.Name -like "*$currentOSUser*"}} | Select-Object Name

# 输出用户信息
Write-Output "=== 当前系统信息 ==="
Write-Output "操作系统: $($currentUserInfo.WindowsProductName)"
Write-Output "系统版本: $($currentUserInfo.WindowsVersion)"
Write-Output "当前时区: $($currentUserInfo.CurrentTimeZone)"
Write-Output "启动时间: $($currentUserInfo.BootUpTime)"

Write-Output "`n=== 当前用户信息 ==="
Write-Output "用户名: $currentOSUser"
Write-Output "用户SID: $currentUserSID"

Write-Output "`n=== 用户所属本地组 ==="
foreach ($group in $localGroups) {
    Write-Output "组名: $($group.Name)"
}
EOF

echo "PowerShell脚本已生成: $random_filename"
ls -l "$random_filename"
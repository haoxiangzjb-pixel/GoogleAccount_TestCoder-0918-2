#!/bin/bash

# 生成随机文件名
random_number=$((RANDOM % 99999))
random_script_name="Get-UserInfo-$random_number.ps1"

# 定义PowerShell脚本内容
powershell_script_content='# 获取当前用户信息的PowerShell脚本

# 获取当前用户信息
$currentUserInfo = @{
    "UserName" = $env:USERNAME
    "UserDomain" = $env:USERDOMAIN
    "ComputerName" = $env:COMPUTERNAME
    "UserProfile" = $env:USERPROFILE
    "HomePath" = $env:HOMEPATH
    "HomeDrive" = $env:HOMEDRIVE
}

# 显示当前用户信息
Write-Host "当前用户信息:" -ForegroundColor Green
Write-Host "========================="
foreach ($key in $currentUserInfo.Keys) {
    Write-Host "$key : $($currentUserInfo[$key])"
}

# 获取当前用户对象（更详细的信息）
try {
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    Write-Host "`n详细用户信息:" -ForegroundColor Green
    Write-Host "========================="
    Write-Host "User Identity: $($currentUser.Name)"
    Write-Host "Authentication Type: $($currentUser.AuthenticationType)"
    Write-Host "Is Authenticated: $($currentUser.IsAuthenticated)"
    Write-Host "User Type: $($currentUser.UserType)"
} 
catch {
    Write-Host "无法获取详细用户信息: $_" -ForegroundColor Yellow
}

# 将用户信息保存到文件
$randomFileName = "UserInfo_" + (Get-Random -Maximum 99999) + ".txt"
$userInfoContent = "当前用户信息:`n"
$userInfoContent += "=========================`n"
foreach ($key in $currentUserInfo.Keys) {
    $userInfoContent += "$key : $($currentUserInfo[$key])`n"
}

$userInfoContent += "`n详细用户信息:`n"
$userInfoContent += "=========================`n"
try {
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $userInfoContent += "User Identity: $($currentUser.Name)`n"
    $userInfoContent += "Authentication Type: $($currentUser.AuthenticationType)`n"
    $userInfoContent += "Is Authenticated: $($currentUser.IsAuthenticated)`n"
    $userInfoContent += "User Type: $($currentUser.UserType)`n"
} 
catch {
    $userInfoContent += "无法获取详细用户信息: $($_)`n"
}

# 保存到随机命名的文件
$userInfoContent | Out-File -FilePath $randomFileName -Encoding UTF8
Write-Host "`n用户信息已保存到文件: $randomFileName" -ForegroundColor Cyan'

# 将PowerShell脚本内容写入随机命名的.ps1文件
echo "$powershell_script_content" > "/workspace/$random_script_name"

echo "PowerShell脚本已创建: $random_script_name"
echo "该脚本在PowerShell环境中运行时将获取当前用户信息并保存到随机命名的文件中。"
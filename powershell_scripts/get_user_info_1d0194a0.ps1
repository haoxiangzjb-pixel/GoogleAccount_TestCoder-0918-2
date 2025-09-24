# PowerShell脚本: 获取当前用户信息
Write-Host "获取当前用户信息..."

# 获取当前用户
$current_user = $env:USERNAME
Write-Host "当前用户: $current_user"

# 获取用户域 (如果适用)
$user_domain = $env:USERDOMAIN
Write-Host "用户域: $user_domain"

# 获取用户主目录
$user_home = $env:USERPROFILE
Write-Host "用户主目录: $user_home"

Write-Host "信息获取完成。"
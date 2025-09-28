# PowerShell脚本：获取当前用户信息
# 获取当前用户信息并输出到控制台
Write-Host "当前用户信息:"
$userInfo = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$userPrincipal = New-Object System.Security.Principal.WindowsPrincipal($userInfo)
Write-Host "用户名: $($userInfo.Name)"
Write-Host "是否为管理员: $($userPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))"
Write-Host "用户类型: $($userInfo.User)"
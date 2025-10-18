# 当前用户信息 - 生成于 $(Get-Date)
$userInfo = @{
    UserName = '$env:USERNAME'
    UserDomain = '$env:USERDOMAIN'
    ComputerName = '$env:COMPUTERNAME'
    UserProfile = '$env:USERPROFILE'
    HomePath = '$env:HOMEPATH'
    HomeDrive = '$env:HOMEDRIVE'
    LogonServer = '$env:LOGONSERVER'
}

# 显示用户信息
Write-Host "保存的用户信息：" -ForegroundColor Green
$userInfo.GetEnumerator() | ForEach-Object {
    Write-Host "$($_.Key): $($_.Value)"
}

# PowerShell脚本：获取当前用户信息并保存到随机命名的.ps1文件中

# 获取当前用户信息
# 检测操作系统并相应地获取用户信息
if ($IsWindows -or $env:OS -eq "Windows_NT") {
    # Windows系统
    $currentUserInfo = @{
        "UserName" = $env:USERNAME
        "UserDomain" = $env:USERDOMAIN
        "ComputerName" = $env:COMPUTERNAME
        "UserPrincipalName" = (Get-CimInstance -ClassName Win32_ComputerSystem).UserName
        "HomeDirectory" = $env:HOMEDRIVE + $env:HOMEPATH
        "UserProfile" = $env:USERPROFILE
    }
} else {
    # 非Windows系统（如Linux/macOS）
    $currentUserInfo = @{
        "UserName" = $env:USER
        "ComputerName" = hostname
        "HomeDirectory" = $env:HOME
        "Shell" = $env:SHELL
    }
}

# 创建随机命名的.ps1文件
$randomFileName = "UserInfo_" + (Get-Random -Maximum 10000).ToString() + ".ps1"

# 将用户信息保存到随机命名的文件中
if ($IsWindows -or $env:OS -eq "Windows_NT") {
    # Windows系统
    @"
# 当前用户信息
\$UserInfo = @{
    UserName = '$($currentUserInfo.UserName)'
    UserDomain = '$($currentUserInfo.UserDomain)'
    ComputerName = '$($currentUserInfo.ComputerName)'
    UserPrincipalName = '$($currentUserInfo.UserPrincipalName)'
    HomeDirectory = '$($currentUserInfo.HomeDirectory)'
    UserProfile = '$($currentUserInfo.UserProfile)'
}
"@ | Out-File -FilePath $randomFileName -Encoding UTF8

    Write-Host "用户信息已保存到文件: $randomFileName"
    Write-Host "用户名: $($currentUserInfo.UserName)"
    Write-Host "用户域: $($currentUserInfo.UserDomain)"
    Write-Host "计算机名: $($currentUserInfo.ComputerName)"
} else {
    # 非Windows系统
    @"
# 当前用户信息
\$UserInfo = @{
    UserName = '$($currentUserInfo.UserName)'
    ComputerName = '$($currentUserInfo.ComputerName)'
    HomeDirectory = '$($currentUserInfo.HomeDirectory)'
    Shell = '$($currentUserInfo.Shell)'
}
"@ | Out-File -FilePath $randomFileName -Encoding UTF8

    Write-Host "用户信息已保存到文件: $randomFileName"
    Write-Host "用户名: $($currentUserInfo.UserName)"
    Write-Host "计算机名: $($currentUserInfo.ComputerName)"
    Write-Host "主目录: $($currentUserInfo.HomeDirectory)"
    Write-Host "Shell: $($currentUserInfo.Shell)"
}
# PowerShell User Information Script

This repository contains a PowerShell script that gets current user information and saves it to a randomly named .ps1 file.

## Files

- `get-user-info.ps1` - The main PowerShell script that retrieves user information and saves it to a randomly named file
- `demo-user-info.ps1` - A demonstration script showing how the main script works

## How to Use

To run the script, you need a Windows system with PowerShell installed:

1. Open PowerShell
2. Navigate to the directory containing the script
3. Run: `.\get-user-info.ps1`

The script will:
- Get the current user information (username, domain, computer name)
- Generate a random filename in the format "UserInfo_XXXX.ps1" where XXXX is a random number
- Save the user information to the randomly named file
- Display a message confirming where the information was saved

## PowerShell Script Content

The script uses environment variables like `$env:USERNAME`, `$env:USERDOMAIN`, and `$env:COMPUTERNAME` to get user information, and `Get-Random` to generate the random filename.
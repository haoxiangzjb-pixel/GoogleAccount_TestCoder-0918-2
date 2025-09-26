# PowerShell script to get current user information
Write-Host "Getting current user information..."

# Get the username and domain
$username = $env:USERNAME
$domain = $env:USERDOMAIN

# Display the information
Write-Host "Current User: $username"
Write-Host "Domain: $domain"

# Optionally, you can also get the full User Principal Name (UPN)
# $userPrincipalName = $env:USERDNSDOMAIN
# if ($userPrincipalName) {
#     Write-Host "UPN: $username@$userPrincipalName"
# }
Clear-Host
Write-Host "MPG ZTA Attribute Editor" -ForegroundColor Yellow
$findUPN = Read-Host -Prompt "Enter the UPN to find"

Write-Host "The entered UPN is" $findUPN -ForegroundColor Green

Write-Host "Entered UPN: " $findUPN
Write-Host ""

if ($findUPN -eq "*") {
    Get-ADUser -Filter * | Format-Table UserPrincipalName,SamAccountName,DistinguishedName
}
else {
    Get-ADUser -Filter 'UserPrincipalName -eq $findUPN' | Format-Table
}

Get-ADUser -Filter 'UserPrincipalName -eq $findUPN' | Select-Object -ExpandProperty * | Format-Table



$Properties =
 @( 
 'DisplayName',
 'SamAccountName',
 'DepartmentNumber',
 'Enabled',
 'Created',
 'AccountExpirationDate',
 'LastLogonDate',
 'PasswordLastSet',
 'Mail'
 )

Get-ADUser -Filter 'UserPrincipalName -eq "ronc@jidcjto.com"' -SearchBase "OU=People,OU=_JTODEV,DC=jidcjto,DC=com" -Properties $Properties | select $Properties
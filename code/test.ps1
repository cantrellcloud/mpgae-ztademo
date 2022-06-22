$aduser = Get-ADUser -Filter 'UserPrincipalName -eq "charles.cantrell@cantrelloffice.cloud"' | ft
write-host $aduser

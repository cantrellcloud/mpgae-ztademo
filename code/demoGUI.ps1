#===========================================================================
# Initialize

Clear-Host
$xamlFile = 'D:\GitHub\mpgae-ztademo\code\demoGUI.xaml'
$inputXML = Get-Content -Path $xamlFile -Raw
$inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N' -replace '^<Win.*', '<Window'
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $inputXML

#Read XAML
$reader=(New-Object System.Xml.XmlNodeReader $xaml)
try{
    $Form=[Windows.Markup.XamlReader]::Load( $reader )
}
catch{
    Write-Warning "Unable to parse XML, with error: $($Error[0])`n Ensure that there are NO SelectionChanged or TextChanged properties in your textboxes (PowerShell cannot process them)"
    throw
}
 

#===========================================================================
# Load XAML
  
$xaml.SelectNodes("//*[@Name]") | ForEach-Object{"trying item $($_.Name)";
    try {Set-Variable -Name "form_$($_.Name)" -Value $Form.FindName($_.Name) -ErrorAction Stop}
    catch{throw}
    }
 
Function Get-FormVariables{
if ($global:ReadmeDisplay -ne $true){Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true}
write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
get-variable form_*
}
 
Get-FormVariables


#===========================================================================
# Main Code

#initialize global variables
$Global:UserPrincipalName = $null
$Global:SamAccountName    = $null
$Global:DepartmentNumber  = $null

#close the form
$form_btn_closeMainWindow.Add_Click({$form.Close()})

#find entity clicked
$form_box_findEntity.Text = "charles.cantrell@cantrelloffice.cloud"
$form_btn_findEntity.Add_Click({
    
    #find entity properties
    $entityProperties = @(
        'UserPrincipalName',
        'SamAccountName',
        'DepartmentNumber'
    )
    $entity = Get-ADUser -Filter 'UserPrincipalName -eq $form_box_findEntity.Text' -Properties $entityProperties | Select-Object $entityProperties

<#
    Write-Host "================================================"
    Write-Host "UPN_to_Update     = " $form_box_findEntity.Text
    Write-Host "userPrincipalName = " $entity.UserPrincipalName
    Write-Host "sAMMAccountName   = " $entity.SamAccountName
    Write-Host "departmentNumber  = " $entity.DepartmentNumber
#>

    $form_box_UserPrincipalName.Text = $entity.UserPrincipalName
    $form_box_SAMAccountName.Text    = $entity.SamAccountName

    if ($entity.DepartmentNumber -eq $Null) {
        $form_box_departmentNumber.Text = "None Found"
    }
    else {
        $form_box_departmentNumber.text = $entity.DepartmentNumber
    }

    #return variables
    $Global:UserPrincipalName = $entity.UserPrincipalName
    $Global:SamAccountName    = $entity.SamAccountName
    $Global:DepartmentNumber  = $entity.DepartmentNumber
})

#delete departmentnumber clicked
$form_btn_del_departmentNumber.Add_Click({
    Write-Host "departmentNumber  = " $Global:DepartmentNumber

    $Global:DepartmentNumber | Out-GridView -Title "Delete departmentNumber Attribute" -OutputMode Multiple

    #return variables
})

#===========================================================================
# Show the form
$Form.ShowDialog() | out-null

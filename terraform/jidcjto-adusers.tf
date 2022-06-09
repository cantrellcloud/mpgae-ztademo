#================================================================================
#
# Azure Users

data "azuread_users" "users" {
    for_each = {for user in local.users : user.UPN => user }
    return_all = true
}

# user01
/*module "jtodev_eastus2_dev_azaduser_jtodevadmin" {
	source = "github.com/cantrellcloud/tfaz-azaduser"
	#to_provision = local.provision_user01
    azaduser_user_principal_name = "jtodevadmin@mpgaejtodev.onmicrosoft.com"
    azaduser_display_name        = "JTODev Admin"
    azaduser_mail_nickname       = "jtodevadadmin"
    azaduser_password            = "Password#1Password#1"
    azaduser_country             = "US"
}
*/
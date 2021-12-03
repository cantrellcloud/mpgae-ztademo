#================================================================================
#
# ZTADEV
# KeyVault
#
#================================================================================
#
# KeyVaults, KeyAccess Policies, and Keys
#
# keyvault01
data "azurerm_client_config" "current" {}
module "ztadev_eastus2_dev_keyvault" {
	source = "github.com/cantrellcloud/tfaz-keyvault"
	#to_provision = local.provision_keyvault01
	rg_location = module.ztadev_eastus2_dev_rg.rg_location
	rg_name = module.ztadev_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	keyvault_name                            = "ztadev-dev-keyvault"
    keyvault_tenant_id                       = data.azurerm_client_config.current.tenant_id
    keyvault_enabled_for_disk_encryption     = true
    keyvault_enabled_for_deployment          = true
    keyvault_enabled_for_template_deployment = true
    keyvault_soft_delete_retention_days      = 7
    keyvault_purge_protection_enabled        = false
    keyvault_sku_name                        = "standard"

}

    # keyvault01_outputs
    output "ztadev_eastus2_dev_keyvault_id" {
        value = module.ztadev_eastus2_dev_keyvault.keyvault_id
    }
    output "ztadev_eastus2_dev_keyvault_name" {
        value = module.ztadev_eastus2_dev_keyvault.keyvault_name
    }
    output "ztadev_eastus2_dev_keyvault_vault_uri" {
        value = module.ztadev_eastus2_dev_keyvault.keyvault_vault_uri
    }

#--------------------------------------------------------------------------------
#
# KeyVault Access Policies
#
# keyvault01_access_policy01

#--------------------------------------------------------------------------------
#
# KeyVault Keys
#
# keyvault01_key01


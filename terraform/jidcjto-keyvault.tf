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
module "jtodev_eastus2_dev_keyvault" {
	source = "github.com/cantrellcloud/tfaz-keyvault"
	#to_provision = local.provision_keyvault01
	rg_location = module.jtodev_eastus2_dev_rg.rg_location
	rg_name = module.jtodev_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "JTODev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	keyvault_name                            = "jtodev-dev-keyvault"
    keyvault_tenant_id                       = data.azurerm_client_config.current.tenant_id
    keyvault_enabled_for_disk_encryption     = true
    keyvault_enabled_for_deployment          = true
    keyvault_enabled_for_template_deployment = true
    keyvault_soft_delete_retention_days      = 7
    keyvault_purge_protection_enabled        = false
    keyvault_sku_name                        = "standard"

}

    # keyvault01_outputs
    output "jtodev_eastus2_dev_keyvault_id" {
        value = module.jtodev_eastus2_dev_keyvault.keyvault_id
    }
    output "jtodev_eastus2_dev_keyvault_name" {
        value = module.jtodev_eastus2_dev_keyvault.keyvault_name
    }
    output "jtodev_eastus2_dev_keyvault_vault_uri" {
        value = module.jtodev_eastus2_dev_keyvault.keyvault_vault_uri
    }

#--------------------------------------------------------------------------------
#
# KeyVault Access Policies
#
# keyvault01_accecsspolicy01
module "jtodev_eastus2_dev_terraformsp_keyvaultaccesspolicy" {
	source = "github.com/cantrellcloud/tfaz-keyvaultaccesspolicy"
	#to_provision = local.provision_keyvaultaccesspolicy01
    key_vault_access_policy_key_vault_id            = module.jtodev_eastus2_dev_keyvault.keyvault_id
    #key_vault_access_policy_tenant_id               = data.azurerm_client_config.current.tenant_id
    key_vault_access_policy_object_id               = "b691d6a7-bfa1-4b60-97ec-09b8dd1e1a22" # Terraform_SP

    key_vault_access_policy_key_permissions         = [
        "Backup",
        "Create",
        "Decrypt",
        "Delete",
        "Encrypt",
        "Get",
        "Import",
        "List",
        "Purge",
        "Recover",
        "Restore",
        "Sign",
        "UnwrapKey",
        "Update",
        "Verify",
        "WrapKey"
    ]

    key_vault_access_policy_secret_permissions      = [
        "Backup",
        "Delete",
        "Get",
        "List",
        "Purge",
        "Recover",
        "Restore",
        "Set"
    ]

    key_vault_access_policy_storage_permissions     = [
        "Backup",
        "Delete",
        "DeleteSAS",
        "Get",
        "GetSAS",
        "List",
        "ListSAS",
        "Purge",
        "Recover",
        "RegenerateKey",
        "Restore",
        "Set",
        "SetSAS",
        "Update"
    ]

    key_vault_access_policy_certificate_permissions = [
        "Backup",
        "Create",
        "Delete",
        "DeleteIssuers",
        "Get",
        "GetIssuers",
        "Import",
        "List",
        "ListIssuers",
        "ManageContacts",
        "ManageIssuers",
        "Purge",
        "Recover",
        "Restore",
        "SetIssuers",
        "Update"
    ]
}

# keyvault01_accecsspolicy01
module "jtodev_eastus2_dev_ztademokeyadmins_keyvaultaccesspolicy" {
	source = "github.com/cantrellcloud/tfaz-keyvaultaccesspolicy"
	#to_provision = local.provision_keyvaultaccesspolicy01
    key_vault_access_policy_key_vault_id            = module.jtodev_eastus2_dev_keyvault.keyvault_id
    #key_vault_access_policy_tenant_id               = data.azurerm_client_config.current.tenant_id
    key_vault_access_policy_object_id               = "ec862570-1de6-4c20-9b60-9d686a9a01e8" # ZTA Demo Key Administrators

    key_vault_access_policy_key_permissions         = [
        "Backup",
        "Create",
        "Decrypt",
        "Delete",
        "Encrypt",
        "Get",
        "Import",
        "List",
        "Purge",
        "Recover",
        "Restore",
        "Sign",
        "UnwrapKey",
        "Update",
        "Verify",
        "WrapKey"
    ]

    key_vault_access_policy_secret_permissions      = [
        "Backup",
        "Delete",
        "Get",
        "List",
        "Purge",
        "Recover",
        "Restore",
        "Set"
    ]

    key_vault_access_policy_storage_permissions     = [
        "Backup",
        "Delete",
        "DeleteSAS",
        "Get",
        "GetSAS",
        "List",
        "ListSAS",
        "Purge",
        "Recover",
        "RegenerateKey",
        "Restore",
        "Set",
        "SetSAS",
        "Update"
    ]

    key_vault_access_policy_certificate_permissions = [
        "Backup",
        "Create",
        "Delete",
        "DeleteIssuers",
        "Get",
        "GetIssuers",
        "Import",
        "List",
        "ListIssuers",
        "ManageContacts",
        "ManageIssuers",
        "Purge",
        "Recover",
        "Restore",
        "SetIssuers",
        "Update"
    ]
}

#--------------------------------------------------------------------------------
#
# KeyVault Keys
#
# keyvault01_key01
module "jtodev_eastus2_dev_vmnix_keyvaultkey" {
	source = "github.com/cantrellcloud/tfaz-keyvaultkey"
	#to_provision = local.provision_keyvaultkey01
    keyvaultkey_name         = "vmnixkeyvaultkey"
    keyvaultkey_key_vault_id = module.jtodev_eastus2_dev_keyvault.keyvault_id
    keyvaultkey_key_type     = "RSA"
    keyvaultkey_key_size     = 4096
    keyvaultkey_key_opts     = [
        "decrypt",
        "encrypt",
        "sign",
        "unwrapKey",
        "verify",
        "wrapKey",
    ]
}
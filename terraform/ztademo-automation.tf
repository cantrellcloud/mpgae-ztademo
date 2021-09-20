#================================================================================
#
# ZTADEMO
# Automation
#

# autoaccount
module "ztademo_eastus_dev_autoaccount" {
	source = "github.com/cantrellcloud/tfAzureModules/autoaccount"
	#to_provision = local.provision_autoaccount
	rg_location = module.ztademo_eastus_dev_rg.rg_location
	rg_name = module.ztademo_eastus_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "A&E 700 R&D",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	autoaccount_name = "ztademo-eastus-dev-autoaccount"
	autoaccount_sku_name = "Basic"
}

#autoaccount_outputs
output "ztademo_eastus_dev_autoaccount_id" {
	value = module.ztademo_eastus_dev_autoaccount.autoaccount_id
}
output "ztademo_eastus_dev_autoaccount_name" {
	value = module.ztademo_eastus_dev_autoaccount.autoaccount_name
}
output "ztademo_eastus_dev_autoaccount_sku_name" {
    value = module.ztademo_eastus_dev_autoaccount.autoaccount_sku_name
}
output "ztademo_eastus_dev_autoaccount_dsc_server_endpoint" {
    value = module.ztademo_eastus_dev_autoaccount.autoaccount_dsc_server_endpoint
}
output "ztademo_eastus_dev_autoaccount_dsc_primary_access_key" {
    value = module.ztademo_eastus_dev_autoaccount.autoaccount_dsc_primary_access_key
}
output "ztademo_eastus_dev_autoaccount_dsc_secondary_access_key" {
    value = module.ztademo_eastus_dev_autoaccount.autoaccount_dsc_secondary_access_key
}

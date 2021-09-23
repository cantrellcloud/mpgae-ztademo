#================================================================================
#
# ZTADEMO
# Virtual Networks
#

# vnet01
module "ztademo_eastus2_dev_vnet" {
	source = "github.com/cantrellcloud/tfAzureModules/vnet"
	#to_provision = local.provision_vnet01
	rg_location = module.ztademo_eastus2_dev_rg.rg_location
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vnet_name = "ztademo_eastus2_dev_vnet"
	vnet_address_space = [
		"172.16.200.0/27",
		"172.16.200.32/27",
		"172.16.200.64/27",
		"172.16.200.96/27",
		"172.16.200.128/27",
		"172.16.200.160/27",
		"172.16.200.192/27",
		"172.16.200.224/28",
		"172.16.200.248/29"
	]
	vnet_dns_servers = [
		"172.16.200.11",
		"172.16.200.12"
	]
}

#vnet01_outputs
output "ztademo_eastus2_dev_vnet_id" {
	value = module.ztademo_eastus2_dev_vnet.vnet_id
}
output "ztademo_eastus2_dev_vnet_name" {
	value = module.ztademo_eastus2_dev_vnet.vnet_name
}

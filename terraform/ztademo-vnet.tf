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

# vnet02
module "ztademo_eastus_dev_vnet" {
	source = "github.com/cantrellcloud/tfAzureModules/vnet"
	#to_provision = local.provision_vnet02
	rg_location = module.ztademo_eastus_dev_rg.rg_location
	rg_name = module.ztademo_eastus_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vnet_name = "ztademo_eastus_dev_vnet"
	vnet_address_space = [
		"172.16.204.0/27",
		"172.16.204.32/27",
		"172.16.204.64/27",
		"172.16.204.96/27",
		"172.16.204.128/27",
		"172.16.204.160/27",
		"172.16.204.192/27",
		"172.16.204.224/28",
		"172.16.204.248/29"
	]
	vnet_dns_servers = [
		"172.16.200.11",
		"172.16.200.12"
	]
}

#vnet02_outputs
output "ztademo_eastus_dev_vnet_id" {
	value = module.ztademo_eastus_dev_vnet.vnet_id
}
output "ztademo_eastus_dev_vnet_name" {
	value = module.ztademo_eastus_dev_vnet.vnet_name
}

# vnet03
module "ztademo_eastus2_dev_02_vnet" {
	source = "github.com/cantrellcloud/tfAzureModules/vnet"
	#to_provision = local.provision_vnet02
	rg_location = module.ztademo_eastus2_dev_rg.rg_location
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E eastus2",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vnet_name = "ztademo_eastus2_dev_02_vnet"
	vnet_address_space = [
		"172.16.208.0/27",
		"172.16.208.32/27",
		"172.16.208.64/27",
		"172.16.208.96/27",
		"172.16.208.128/27",
		"172.16.208.160/27",
		"172.16.208.192/27",
		"172.16.208.224/28",
		"172.16.208.248/29"
	]
	vnet_dns_servers = [
		"172.16.200.11",
		"172.16.200.12"
	]
}

#vnet03_outputs
output "ztademo_eastus2_dev_02_vnet_id" {
	value = module.ztademo_eastus2_dev_02_vnet.vnet_id
}
output "ztademo_eastus2_dev_02_vnet_name" {
	value = module.ztademo_eastus2_dev_02_vnet.vnet_name
}

#peer01a
module "ztademo_eastus2_dev2dev20_vnet_peer" {
	source = "github.com/cantrellcloud/tfAzureModules/peer"
	#to_provision = local.provision_peer01
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	peer_name = "dev2dev02_vnet_peer"
	from_vnet_name = module.ztademo_eastus2_dev_vnet.vnet_name
	to_vnet_id = module.ztademo_eastus2_dev_02_vnet.vnet_id
	peer_allow_virtual_network_access = true
	peer_allow_forwarded_traffic = true
	peer_allow_gateway_transit = false
}

#peer01b
module "ztademo_eastus2_dev022dev_vnet_peer" {
	source = "github.com/cantrellcloud/tfAzureModules/peer"
	#to_provision = local.provision_peer01
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	peer_name = "dev022dev_vnet_peer"
	from_vnet_name =  module.ztademo_eastus2_dev_02_vnet.vnet_name
	to_vnet_id = module.ztademo_eastus2_dev_vnet.vnet_id
	peer_allow_virtual_network_access = true
	peer_allow_forwarded_traffic = true
	peer_allow_gateway_transit = false
}

#peer2a
module "ztademo_eastus2_dev2eastusdev_vnet_peer" {
	source = "github.com/cantrellcloud/tfAzureModules/peer"
	#to_provision = local.provision_peer02
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	peer_name = "dev2eastusdev_vnet_peer"
	from_vnet_name = module.ztademo_eastus2_dev_vnet.vnet_name
	to_vnet_id = module.ztademo_eastus_dev_vnet.vnet_id
	peer_allow_virtual_network_access = true
	peer_allow_forwarded_traffic = true
	peer_allow_gateway_transit = false
}

#peer2b
module "ztademo_eastus2_eastusdev2dev_vnet_peer" {
	source = "github.com/cantrellcloud/tfAzureModules/peer"
	#to_provision = local.provision_peer02
	rg_name = module.ztademo_eastus_dev_rg.rg_name
	peer_name = "eastusdev2dev_vnet_peer"
	from_vnet_name =  module.ztademo_eastus_dev_vnet.vnet_name
	to_vnet_id = module.ztademo_eastus2_dev_vnet.vnet_id
	peer_allow_virtual_network_access = true
	peer_allow_forwarded_traffic = true
	peer_allow_gateway_transit = false
}

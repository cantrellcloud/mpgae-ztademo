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
		"172.16.202.0/27",
		"172.16.202.32/27",
		"172.16.202.64/27",
		"172.16.202.96/27",
		"172.16.202.128/27",
		"172.16.202.160/27",
		"172.16.202.192/27",
		"172.16.202.224/28",
		"172.16.202.248/29"
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
module "ztademo_westus_dev_vnet" {
	source = "github.com/cantrellcloud/tfAzureModules/vnet"
	#to_provision = local.provision_vnet02
	rg_location = module.ztademo_westus_dev_rg.rg_location
	rg_name = module.ztademo_westus_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E WestUS",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vnet_name = "ztademo_westus_dev_vnet"
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

#vnet03_outputs
output "ztademo_westus_dev_vnet_id" {
	value = module.ztademo_westus_dev_vnet.vnet_id
}
output "ztademo_westus_dev_vnet_name" {
	value = module.ztademo_westus_dev_vnet.vnet_name
}

# vnet04
module "ztademo_westus2_dev_vnet" {
	source = "github.com/cantrellcloud/tfAzureModules/vnet"
	#to_provision = local.provision_vnet02
	rg_location = module.ztademo_westus2_dev_rg.rg_location
	rg_name = module.ztademo_westus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E WestUS2",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vnet_name = "ztademo_westus2_dev_vnet"
	vnet_address_space = [
		"172.16.206.0/27",
		"172.16.206.32/27",
		"172.16.206.64/27",
		"172.16.206.96/27",
		"172.16.206.128/27",
		"172.16.206.160/27",
		"172.16.206.192/27",
		"172.16.206.224/28",
		"172.16.206.248/29"
	]
	vnet_dns_servers = [
		"172.16.200.11",
		"172.16.200.12"
	]
}

#vnet03_outputs
output "ztademo_westus2_dev_vnet_id" {
	value = module.ztademo_westus2_dev_vnet.vnet_id
}
output "ztademo_westus2_dev_vnet_name" {
	value = module.ztademo_westus2_dev_vnet.vnet_name
}

#peer01a
module "ztademo_eastus2_dev2eastus_dev_vnet_peer" {
	source = "github.com/cantrellcloud/tfAzureModules/peer"
	#to_provision = local.provision_peer01
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	peer_name = "eastus2_dev2eastus_dev_peer"
	from_vnet_name = module.ztademo_eastus2_dev_vnet.vnet_name
	to_vnet_id = module.ztademo_eastus_dev_vnet.vnet_id
	peer_allow_virtual_network_access = true
	peer_allow_forwarded_traffic = true
	peer_allow_gateway_transit = false
}

#peer01b
module "ztademo_eastus_dev2eastus2_dev_vnet_peer" {
	source = "github.com/cantrellcloud/tfAzureModules/peer"
	#to_provision = local.provision_peer01
	rg_name = module.ztademo_eastus_dev_rg.rg_name
	peer_name = "eastus_dev2eastus2_dev_peer"
	from_vnet_name =  module.ztademo_eastus_dev_vnet.vnet_name
	to_vnet_id = module.ztademo_eastus2_dev_vnet.vnet_id
	peer_allow_virtual_network_access = true
	peer_allow_forwarded_traffic = true
	peer_allow_gateway_transit = false
}

#peer2a
module "ztademo_eastus2_dev2westus_dev_vnet_peer" {
	source = "github.com/cantrellcloud/tfAzureModules/peer"
	#to_provision = local.provision_peer02
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	peer_name = "eastus2_dev2westus_dev_peer"
	from_vnet_name = module.ztademo_eastus2_dev_vnet.vnet_name
	to_vnet_id = module.ztademo_westus_dev_vnet.vnet_id
	peer_allow_virtual_network_access = true
	peer_allow_forwarded_traffic = true
	peer_allow_gateway_transit = false
}

#peer2b
module "ztademo_westus_dev2eastus2_dev_vnet_peer" {
	source = "github.com/cantrellcloud/tfAzureModules/peer"
	#to_provision = local.provision_peer02
	rg_name = module.ztademo_westus_dev_rg.rg_name
	peer_name = "westus_dev2eastus2_dev_peer"
	from_vnet_name =  module.ztademo_westus_dev_vnet.vnet_name
	to_vnet_id = module.ztademo_eastus2_dev_vnet.vnet_id
	peer_allow_virtual_network_access = true
	peer_allow_forwarded_traffic = true
	peer_allow_gateway_transit = false
}

#peer3a
module "ztademo_eastus2_dev2westus2_dev_vnet_peer" {
	source = "github.com/cantrellcloud/tfAzureModules/peer"
	#to_provision = local.provision_peer02
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	peer_name = "eastus2_dev2westus2_dev_peer"
	from_vnet_name = module.ztademo_eastus2_dev_vnet.vnet_name
	to_vnet_id = module.ztademo_westus2_dev_vnet.vnet_id
	peer_allow_virtual_network_access = true
	peer_allow_forwarded_traffic = true
	peer_allow_gateway_transit = false
}

#peer3b
module "ztademo_westus2_dev2eastus2_dev_vnet_peer" {
	source = "github.com/cantrellcloud/tfAzureModules/peer"
	#to_provision = local.provision_peer02
	rg_name = module.ztademo_westus2_dev_rg.rg_name
	peer_name = "westus2_dev2eastus2_dev_peer"
	from_vnet_name =  module.ztademo_westus2_dev_vnet.vnet_name
	to_vnet_id = module.ztademo_eastus2_dev_vnet.vnet_id
	peer_allow_virtual_network_access = true
	peer_allow_forwarded_traffic = true
	peer_allow_gateway_transit = false
}

#================================================================================
#
# Appgate Resources
#
#================================================================================
#
# Resource Groups
#
# appgate_rg01
module "ztadev_eastus2_dev_appgate_rg" {
    source = "github.com/cantrellcloud/tfaz-rg/"
	rg_name = "ztadev_eastus2_dev_appgate_rg"
	rg_location = "eastus2"
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# appgate_rg01_outputs
	output "ztadev_eastus2_dev_appgate_rg_name" {
		value = module.ztadev_eastus2_dev_appgate_rg.rg_name
	}
	output "ztadev_eastus2_dev_appgate_rg_location" {
		value = module.ztadev_eastus2_dev_appgate_rg.rg_location
	}

#--------------------------------------------------------------------------------
#
# Virtual Networks
#
# appgate_vnet01
module "ztadev_eastus2_dev_appgate_vnet" {
	source = "github.com/cantrellcloud/tfaz-vnet"
	#to_provision = local.provision_vnet01
	rg_location = module.ztadev_eastus2_dev_appgate_rg.rg_location
	rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vnet_name = "ztadev_eastus2_dev_appgate_vnet"
	vnet_address_space = [
		"172.16.201.0/27",
		"172.16.201.32/27",
		"172.16.201.64/27",
		"172.16.201.96/27",
		"172.16.201.128/27",
		"172.16.201.160/27",
		"172.16.201.192/27",
		"172.16.201.224/28",
		"172.16.201.248/29"
	]
	vnet_dns_servers = [
		"172.16.200.11",
		"172.16.200.12"
	]
}

#appgate_vnet01_outputs
output "ztadev_eastus2_dev_appgate_vnet_id" {
	value = module.ztadev_eastus2_dev_appgate_vnet.vnet_id
}
output "ztadev_eastus2_dev_appgate_vnet_name" {
	value = module.ztadev_eastus2_dev_appgate_vnet.vnet_name
}

#--------------------------------------------------------------------------------
#
# Network Subnets
#
# subnet01
module "ztadev_eastus2_dev_appgate_prod_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet01
	rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
	subnet_name = "ztadev_eastus2_dev_appgate_prod_subnet"
	vnet_name = module.ztadev_eastus2_dev_appgate_vnet.vnet_name
	subnet_prefixes = ["172.16.201.0/27"]
}
	#subnet01
		output "ztadev_eastus2_dev_appgate_prod_subnet_id" {
			value = module.ztadev_eastus2_dev_appgate_prod_subnet.subnet_id
		}
		output "ztadev_eastus2_dev_appgate_prod_subnet_name" {
			value = module.ztadev_eastus2_dev_appgate_prod_subnet.subnet_name
		}

#--------------------------------------------------------------------------------
#
# subnet02
module "ztadev_eastus2_dev_appgate_subnetgw_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet02
	rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
	subnet_name = "GatewaySubnet"
	vnet_name = module.ztadev_eastus2_dev_appgate_vnet.vnet_name
	subnet_prefixes = ["172.16.201.248/29"]
}

		#subnet02
		output "ztadev_eastus2_dev_appgate_subnetgw_subnet_id" {
			value = module.ztadev_eastus2_dev_appgate_subnetgw_subnet.subnet_id
		}
		output "ztadev_eastus2_dev_appgate_subnetgw_subnet_name" {
			value = module.ztadev_eastus2_dev_appgate_subnetgw_subnet.subnet_name
		}

#--------------------------------------------------------------------------------
#
# subnet03
module "ztadev_eastus2_dev_appgate_edge_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet03
	rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
	subnet_name = "ztadev_eastus2_dev_appgate_edge_subnet"
	vnet_name = module.ztadev_eastus2_dev_appgate_vnet.vnet_name
	subnet_prefixes = ["172.16.201.64/27"]
}

		#subnet03
		output "ztadev_eastus2_dev_appgate_edge_subnet_id" {
			value = module.ztadev_eastus2_dev_appgate_edge_subnet.subnet_id
		}
		output "ztadev_eastus2_dev_appgate_edge_subnet_name" {
			value = module.ztadev_eastus2_dev_appgate_edge_subnet.subnet_name
		}

#--------------------------------------------------------------------------------
#
# subnet04
module "ztadev_eastus2_dev_appgate_web_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet04
	rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
	subnet_name = "ztadev_eastus2_dev_appgate_web_subnet"
	vnet_name = module.ztadev_eastus2_dev_appgate_vnet.vnet_name
	subnet_prefixes = ["172.16.201.32/27"]
}

		#subnet04
		output "ztadev_eastus2_dev_appgate_web_subnet_id" {
			value = module.ztadev_eastus2_dev_appgate_web_subnet.subnet_id
		}
		output "ztadev_eastus2_dev_appgate_web_subnet_name" {
			value = module.ztadev_eastus2_dev_appgate_web_subnet.subnet_name
		}

#================================================================================
#
# Network Security
#
#--------------------------------------------------------------------------------
#
# NETWORK SECURITY GROUPS, RULES, and ASSOCIATIONS
#
# appgate_nsg01
module "ztadev_eastus2_dev_appgate_prod_subnet_nsg" {
	source            = "github.com/cantrellcloud/tfaz-nsg"
	#to_provision     = local.provision_appgate_nsg01
	rg_location       = module.ztadev_eastus2_dev_appgate_rg.rg_location
	rg_name           = module.ztadev_eastus2_dev_appgate_rg.rg_name
	nsg_name          = "ztadev_eastus2_dev_appgate_prod_subnet_nsg"

}

	# appgate_nsg01_outputs
	output "ztadev_eastus2_dev_appgate_prod_subnet_nsg_id" {
		value = module.ztadev_eastus2_dev_appgate_prod_subnet_nsg.nsg_id
	}
	output "ztadev_eastus2_dev_appgate_prod_subnet_nsg_name" {
		value = module.ztadev_eastus2_dev_appgate_prod_subnet_nsg.nsg_name
	}

	# nsgassoc01
	resource "azurerm_subnet_network_security_group_association" "ztadev_eastus2_dev_appgate_prod_subnet_nsgassoc" {
		subnet_id = module.ztadev_eastus2_dev_appgate_prod_subnet.subnet_id
		network_security_group_id = module.ztadev_eastus2_dev_appgate_prod_subnet_nsg.nsg_id
	}

	# nsr01-00
	module "ztadev_eastus2_dev_appgate_prod_subnet_nsg_nsr_allow_icmp" {
		source            = "github.com/cantrellcloud/tfaz-nsr"
		#to_provision     = local.provision_nsr01-00
		nsr_name = "Allow_ICMP"
		rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
		network_security_group_name = module.ztadev_eastus2_dev_appgate_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow ICMP"
		security_rule_destination_address_prefix = "*"
		#security_rule_destination_address_prefixes = []
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "*"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 100
		security_rule_protocol = "ICMP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"144.129.196.130"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-00_outputs
		output "ztadev_eastus2_dev_appgate_prod_subnet_nsg_nsr_allow_icmp_id" {
			value = module.ztadev_eastus2_dev_appgate_prod_subnet_nsg_nsr_allow_icmp.nsr_id
		}

	# nsr01-01
	module "ztadev_eastus2_dev_appgate_prod_subnet_nsg_nsr_port_3389" {
		source            = "github.com/cantrellcloud/tfaz-nsr"
		#to_provision     = local.provision_nsr01-01
		nsr_name = "Port_3389"
		rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
		network_security_group_name = module.ztadev_eastus2_dev_appgate_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP3389"
		security_rule_destination_address_prefix = "*"
		#security_rule_destination_address_prefixes = []
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "3389"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 101
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"144.129.196.130"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-01_outputs
		output "ztadev_eastus2_dev_appgate_prod_subnet_nsg_nsr_port_3389_id" {
			value = module.ztadev_eastus2_dev_appgate_prod_subnet_nsg_nsr_port_3389.nsr_id
		}

	# nsr01-02
	module "ztadev_eastus2_dev_appgate_prod_subnet_nsg_nsr_port_443" {
		source            = "github.com/cantrellcloud/tfaz-nsr"
		#to_provision     = local.provision_nsr01-02
		nsr_name = "Port_443"
		rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
		network_security_group_name = module.ztadev_eastus2_dev_appgate_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP443"
		security_rule_destination_address_prefix = "*"
		/*security_rule_destination_address_prefixes = [
			"172.16.200.20",
			"172.16.200.23",
			"172.16.200.24"
		]*/
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "443"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 102
		security_rule_protocol = "TCP"
		security_rule_source_address_prefix = "*"
		/*security_rule_source_address_prefixes = [
			"144.129.196.130"
		]*/
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-02_outputs
		output "ztadev_eastus2_dev_appgate_prod_subnet_nsg_nsr_port_443_id" {
			value = module.ztadev_eastus2_dev_appgate_prod_subnet_nsg_nsr_port_443.nsr_id
		}

	# nsr01-03
	module "ztadev_eastus2_dev_appgate_prod_subnet_nsg_nsr_port_22" {
		source            = "github.com/cantrellcloud/tfaz-nsr"
		#to_provision     = local.provision_nsr01-03
		nsr_name = "Port_22"
		rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
		network_security_group_name = module.ztadev_eastus2_dev_appgate_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP22"
		security_rule_destination_address_prefix = "*"
		/*security_rule_destination_address_prefixes = [
			"172.16.200.6",
			"172.16.200.7",
			"172.16.200.25",
			"172.16.200.30",
			"172.16.200.40",
			"172.16.200.41",
			"172.16.200.42",
			"172.16.200.43"
		]*/
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "22"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 103
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"144.129.196.130"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-03_outputs
		output "ztadev_eastus2_dev_appgate_prod_subnet_nsg_nsr_port_22_id" {
			value = module.ztadev_eastus2_dev_appgate_prod_subnet_nsg_nsr_port_22.nsr_id
		}

# appgate_nsg02
module "ztadev_eastus2_dev_appgate_web_subnet_nsg" {
	source            = "github.com/cantrellcloud/tfaz-nsg"
	#to_provision     = local.provision_appgate_nsg02
	rg_location       = module.ztadev_eastus2_dev_appgate_rg.rg_location
	rg_name           = module.ztadev_eastus2_dev_appgate_rg.rg_name
	nsg_name          = "ztadev_eastus2_dev_appgate_web_subnet_nsg"

}

	# appgate_nsg02_outputs
	output "ztadev_eastus2_dev_appgate_web_subnet_nsg_id" {
		value = module.ztadev_eastus2_dev_appgate_web_subnet_nsg.nsg_id
	}
	output "ztadev_eastus2_dev_appgate_web_subnet_nsg_name" {
		value = module.ztadev_eastus2_dev_appgate_web_subnet_nsg.nsg_name
	}

	# nsgassoc02
	resource "azurerm_subnet_network_security_group_association" "ztadev_eastus2_dev_appgate_web_subnet_nsgassoc" {
		subnet_id = module.ztadev_eastus2_dev_appgate_web_subnet.subnet_id
		network_security_group_id = module.ztadev_eastus2_dev_appgate_web_subnet_nsg.nsg_id
	}

	# nsr02-00
	module "ztadev_eastus2_dev_appgate_web_subnet_nsg_nsr_allow_icmp" {
		source            = "github.com/cantrellcloud/tfaz-nsr"
		#to_provision     = local.provision_nsr02-00
		nsr_name = "Allow_ICMP"
		rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
		network_security_group_name = module.ztadev_eastus2_dev_appgate_web_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow ICMP"
		security_rule_destination_address_prefix = "*"
		#security_rule_destination_address_prefixes = []
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "*"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 100
		security_rule_protocol = "ICMP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"144.129.196.130"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-00_outputs
		output "ztadev_eastus2_dev_appgate_web_subnet_nsg_nsr_allow_icmp_id" {
			value = module.ztadev_eastus2_dev_appgate_web_subnet_nsg_nsr_allow_icmp.nsr_id
		}

	# nsr02-01
	module "ztadev_eastus2_dev_appgate_web_subnet_nsg_nsr_port_3389" {
		source            = "github.com/cantrellcloud/tfaz-nsr"
		#to_provision     = local.provision_nsr02-01
		nsr_name = "Port_3389"
		rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
		network_security_group_name = module.ztadev_eastus2_dev_appgate_web_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP3389"
		security_rule_destination_address_prefix = "*"
		#security_rule_destination_address_prefixes = []
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "3389"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 101
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"144.129.196.130"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-01_outputs
		output "ztadev_eastus2_dev_appgate_web_subnet_nsg_nsr_port_3389_id" {
			value = module.ztadev_eastus2_dev_appgate_web_subnet_nsg_nsr_port_3389.nsr_id
		}

	# nsr02-02
	module "ztadev_eastus2_dev_appgate_web_subnet_nsg_nsr_port_443" {
		source            = "github.com/cantrellcloud/tfaz-nsr"
		#to_provision     = local.provision_nsr02-02
		nsr_name = "Port_443"
		rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
		network_security_group_name = module.ztadev_eastus2_dev_appgate_web_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP443"
		security_rule_destination_address_prefix = "*"
		/*security_rule_destination_address_prefixes = [
			"172.16.200.20",
			"172.16.200.23",
			"172.16.200.24"
		]*/
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "443"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 102
		security_rule_protocol = "TCP"
		security_rule_source_address_prefix = "*"
		/*security_rule_source_address_prefixes = [
			"144.129.196.130"
		]*/
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-02_outputs
		output "ztadev_eastus2_dev_appgate_web_subnet_nsg_nsr_port_443_id" {
			value = module.ztadev_eastus2_dev_appgate_web_subnet_nsg_nsr_port_443.nsr_id
		}

	# nsr02-03
	module "ztadev_eastus2_dev_appgate_web_subnet_nsg_nsr_port_22" {
		source            = "github.com/cantrellcloud/tfaz-nsr"
		#to_provision     = local.provision_nsr02-03
		nsr_name = "Port_22"
		rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
		network_security_group_name = module.ztadev_eastus2_dev_appgate_web_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP22"
		security_rule_destination_address_prefix = "*"
		/*security_rule_destination_address_prefixes = [
			"172.16.200.6",
			"172.16.200.7",
			"172.16.200.25",
			"172.16.200.30",
			"172.16.200.40",
			"172.16.200.41",
			"172.16.200.42",
			"172.16.200.43"
		]*/
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "22"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 103
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"144.129.196.130"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-03_outputs
		output "ztadev_eastus2_dev_appgate_web_subnet_nsg_nsr_port_22_id" {
			value = module.ztadev_eastus2_dev_appgate_web_subnet_nsg_nsr_port_22.nsr_id
		}

# appgate_nsg03
module "ztadev_eastus2_dev_appgate_edge_subnet_nsg" {
	source            = "github.com/cantrellcloud/tfaz-nsg"
	#to_provision     = local.provision_appgate_nsg03
	rg_location       = module.ztadev_eastus2_dev_appgate_rg.rg_location
	rg_name           = module.ztadev_eastus2_dev_appgate_rg.rg_name
	nsg_name          = "ztadev_eastus2_dev_appgate_edge_subnet_nsg"

}

	# appgate_nsg03_outputs
	output "ztadev_eastus2_dev_appgate_edge_subnet_nsg_id" {
		value = module.ztadev_eastus2_dev_appgate_edge_subnet_nsg.nsg_id
	}
	output "ztadev_eastus2_dev_appgate_edge_subnet_nsg_name" {
		value = module.ztadev_eastus2_dev_appgate_edge_subnet_nsg.nsg_name
	}

	# nsgassoc03
	resource "azurerm_subnet_network_security_group_association" "ztadev_eastus2_dev_appgate_edge_subnet_nsgassoc" {
		subnet_id = module.ztadev_eastus2_dev_appgate_edge_subnet.subnet_id
		network_security_group_id = module.ztadev_eastus2_dev_appgate_edge_subnet_nsg.nsg_id
	}

	# nsr03-00
	module "ztadev_eastus2_dev_appgate_edge_subnet_nsg_nsr_allow_icmp" {
		source            = "github.com/cantrellcloud/tfaz-nsr"
		#to_provision     = local.provision_nsr03-00
		nsr_name = "Allow_ICMP"
		rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
		network_security_group_name = module.ztadev_eastus2_dev_appgate_edge_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow ICMP"
		security_rule_destination_address_prefix = "*"
		#security_rule_destination_address_prefixes = []
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "*"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 100
		security_rule_protocol = "ICMP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"144.129.196.130"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr03-00_outputs
		output "ztadev_eastus2_dev_appgate_edge_subnet_nsg_nsr_allow_icmp_id" {
			value = module.ztadev_eastus2_dev_appgate_edge_subnet_nsg_nsr_allow_icmp.nsr_id
		}

	# nsr03-01
	module "ztadev_eastus2_dev_appgate_edge_subnet_nsg_nsr_port_3389" {
		source            = "github.com/cantrellcloud/tfaz-nsr"
		#to_provision     = local.provision_nsr03-01
		nsr_name = "Port_3389"
		rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
		network_security_group_name = module.ztadev_eastus2_dev_appgate_edge_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP3389"
		security_rule_destination_address_prefix = "*"
		#security_rule_destination_address_prefixes = []
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "3389"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 101
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"144.129.196.130"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr03-01_outputs
		output "ztadev_eastus2_dev_appgate_edge_subnet_nsg_nsr_port_3389_id" {
			value = module.ztadev_eastus2_dev_appgate_edge_subnet_nsg_nsr_port_3389.nsr_id
		}

	# nsr03-02
	module "ztadev_eastus2_dev_appgate_edge_subnet_nsg_nsr_port_443" {
		source            = "github.com/cantrellcloud/tfaz-nsr"
		#to_provision     = local.provision_nsr03-02
		nsr_name = "Port_443"
		rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
		network_security_group_name = module.ztadev_eastus2_dev_appgate_edge_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP443"
		security_rule_destination_address_prefix = "*"
		/*security_rule_destination_address_prefixes = [
			"172.16.200.20",
			"172.16.200.23",
			"172.16.200.24"
		]*/
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "443"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 102
		security_rule_protocol = "TCP"
		security_rule_source_address_prefix = "*"
		/*security_rule_source_address_prefixes = [
			"144.129.196.130"
		]*/
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr03-02_outputs
		output "ztadev_eastus2_dev_appgate_edge_subnet_nsg_nsr_port_443_id" {
			value = module.ztadev_eastus2_dev_appgate_edge_subnet_nsg_nsr_port_443.nsr_id
		}

	# nsr03-03
	module "ztadev_eastus2_dev_appgate_edge_subnet_nsg_nsr_port_22" {
		source            = "github.com/cantrellcloud/tfaz-nsr"
		#to_provision     = local.provision_nsr03-03
		nsr_name = "Port_22"
		rg_name = module.ztadev_eastus2_dev_appgate_rg.rg_name
		network_security_group_name = module.ztadev_eastus2_dev_appgate_edge_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP22"
		security_rule_destination_address_prefix = "*"
		/*security_rule_destination_address_prefixes = [
			"172.16.200.6",
			"172.16.200.7",
			"172.16.200.25",
			"172.16.200.30",
			"172.16.200.40",
			"172.16.200.41",
			"172.16.200.42",
			"172.16.200.43"
		]*/
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "22"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 103
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"144.129.196.130"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr03-03_outputs
		output "ztadev_eastus2_dev_appgate_edge_subnet_nsg_nsr_port_22_id" {
			value = module.ztadev_eastus2_dev_appgate_edge_subnet_nsg_nsr_port_22.nsr_id
		}

#--------------------------------------------------------------------------------
#
# Public IPs
#
# appgate_prod_publicip
module "ztadev_eastus2_dev_appgate_prod_publicip" {
    source            = "github.com/cantrellcloud/tfaz-publicip"
    #to_provision     = local.provision_ztadevdc01_publicip
    rg_location       = module.ztadev_eastus2_dev_appgate_rg.rg_location
    rg_name           = module.ztadev_eastus2_dev_appgate_rg.rg_name
	rg_tags               = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment"     = "Dev",
		"AutomatedBy"     = "Terraform",
		"Note1"           = "Do not manually change",
		"POCName"         = "ronc@mindpointgroup.com",
		"POCPhone"        = "843.330.6769",
		"Project"         = "Zero Trust Demo"
	}

    publicip_name              = "ztadev_eastus2_dev_appgate_prod_publicip"
    publicip_allocation_method = "Static"
    publicip_sku               = "Basic"
    publicip_domain_name_label = "ztadev-appgate-prod"
}

#appgate_prod_publicip_outputs
    output "ztadev_eastus2_dev_appgate_prod_publicip_id" {
        value = module.ztadev_eastus2_dev_appgate_prod_publicip.publicip_id
    }
    output "ztadev_eastus2_dev_appgate_prod_publicip_name" {
        value = module.ztadev_eastus2_dev_appgate_prod_publicip.publicip_name
    }
    output "ztadev_eastus2_dev_appgate_prod_publicip_domain_name_label" {
        value = module.ztadev_eastus2_dev_appgate_prod_publicip.publicip_domain_name_label
    }


#--------------------------------------------------------------------------------

# appgate_edge_publicip
module "ztadev_eastus2_dev_appgate_edge_publicip" {
    source            = "github.com/cantrellcloud/tfaz-publicip"
    #to_provision     = local.provision_ztadevdc01_publicip
    rg_location       = module.ztadev_eastus2_dev_appgate_rg.rg_location
    rg_name           = module.ztadev_eastus2_dev_appgate_rg.rg_name
	rg_tags               = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment"     = "Dev",
		"AutomatedBy"     = "Terraform",
		"Note1"           = "Do not manually change",
		"POCName"         = "ronc@mindpointgroup.com",
		"POCPhone"        = "843.330.6769",
		"Project"         = "Zero Trust Demo"
	}

    publicip_name              = "ztadev_eastus2_dev_appgate_edge_publicip"
    publicip_allocation_method = "Static"
    publicip_sku               = "Basic"
    publicip_domain_name_label = "ztadev-appgate-edge"
}

#appgate_edge_publicip_outputs
    output "ztadev_eastus2_dev_appgate_edge_publicip_id" {
        value = module.ztadev_eastus2_dev_appgate_edge_publicip.publicip_id
    }
    output "ztadev_eastus2_dev_appgate_edge_publicip_name" {
        value = module.ztadev_eastus2_dev_appgate_edge_publicip.publicip_name
    }
    output "ztadev_eastus2_dev_appgate_edge_publicip_domain_name_label" {
        value = module.ztadev_eastus2_dev_appgate_edge_publicip.publicip_domain_name_label
    }

#--------------------------------------------------------------------------------

# appgate_web_publicip
module "ztadev_eastus2_dev_appgate_web_publicip" {
    source            = "github.com/cantrellcloud/tfaz-publicip"
    #to_provision     = local.provision_ztadevdc01_publicip
    rg_location       = module.ztadev_eastus2_dev_appgate_rg.rg_location
    rg_name           = module.ztadev_eastus2_dev_appgate_rg.rg_name
	rg_tags               = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment"     = "Dev",
		"AutomatedBy"     = "Terraform",
		"Note1"           = "Do not manually change",
		"POCName"         = "ronc@mindpointgroup.com",
		"POCPhone"        = "843.330.6769",
		"Project"         = "Zero Trust Demo"
	}

    publicip_name              = "ztadev_eastus2_dev_appgate_web_publicip"
    publicip_allocation_method = "Static"
    publicip_sku               = "Basic"
    publicip_domain_name_label = "ztadev-appgate-web"
}

#appgate_web_publicip_outputs
    output "ztadev_eastus2_dev_appgate_web_publicip_id" {
        value = module.ztadev_eastus2_dev_appgate_web_publicip.publicip_id
    }
    output "ztadev_eastus2_dev_appgate_web_publicip_name" {
        value = module.ztadev_eastus2_dev_appgate_web_publicip.publicip_name
    }
    output "ztadev_eastus2_dev_appgate_web_publicip_domain_name_label" {
        value = module.ztadev_eastus2_dev_appgate_web_publicip.publicip_domain_name_label
    }

#--------------------------------------------------------------------------------
#
# Virtual Machines
#
# appgate_vmnix01
/*module "ztadev_eastus2_dev_appgate01_vmnix" {
	source = "github.com/cantrellcloud/tfaz-vmnix"
	#to_provision = local.provision_vmnix01
    rg_location       = module.ztadev_eastus2_dev_appgate_rg.rg_location
    rg_name           = module.ztadev_eastus2_dev_appgate_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vmnix_name = "ztadev-appgate01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-appgate01"
    network_interface_ids = [
        module.ztadev_eastus2_dev_appgate01_netinf01.netinf_id,
        module.ztadev_eastus2_dev_appgate01_netinf02.netinf_id
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "cyxtera"
    source_image_reference_offer     = "appgatesdp-vm"
    source_image_reference_sku       = "v5_5_vm"
    #version   = "latest"

	vmnix_plan_name = "appgatesdp-vm"
	vmnix_plan_product = "v5_5_vm"
	vmnix_plan_publisher = "cyxtera"
}

    # appgate01_publicip
    module "ztadev_eastus2_dev_appgate01_publicip" {
        source                     = "github.com/cantrellcloud/tfaz-publicip"
        #to_provision              = local.provision_appgate01_publicip
	    rg_location                = module.ztadev_eastus2_dev_appgate_rg.rg_location
    	rg_name                    = module.ztadev_eastus2_dev_appgate_rg.rg_name
		rg_tags               = {
			"ManagementGroup" = "MPG A&E EastUS2",
			"Environment"     = "Dev",
			"AutomatedBy"     = "Terraform",
			"Note1"           = "Do not manually change",
			"POCName"         = "ronc@mindpointgroup.com",
			"POCPhone"        = "843.330.6769",
			"Project"         = "Zero Trust Demo"
		}

        publicip_name              = "ztadev_eastus2_dev_appgate01_publicip"
        publicip_allocation_method = "Static"
        publicip_sku               = "Standard"
        publicip_domain_name_label = "ztadev-appgate01"
    }

    # appgate01_netinf01
    module "ztadev_eastus2_dev_appgate01_netinf01" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_appgate01_netinf01
        rg_location       = module.ztadev_eastus2_dev_appgate_rg.rg_location
	    rg_name           = module.ztadev_eastus2_dev_appgate_rg.rg_name
		rg_tags = {
	    	"ManagementGroup" = "MPG A&E EastUS2",
		    "Environment" = "Dev",
    		"AutomatedBy" = "Terraform",
	    	"Note1" = "Do not manually change",
		    "POCName" = "ronc@mindpointgroup.com",
    		"POCPhone" = "843.330.6769",
		    "Project" = "Zero Trust Demo"
	    }

        netinf_name = "appgate01_netinf01"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztadev_eastus2_dev_appgate_edge_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.201.68"
        ip_configuration_public_ip_address_id          = module.ztadev_eastus2_dev_appgate01_publicip.publicip_id
}

    # appgate01_netinf02
    module "ztadev_eastus2_dev_appgate01_netinf02" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_appgate01_netinf02
	    rg_location       = module.ztadev_eastus2_dev_appgate_rg.rg_location
    	rg_name           = module.ztadev_eastus2_dev_appgate_rg.rg_name
		rg_tags = {
	    	"ManagementGroup" = "MPG A&E EastUS2",
		    "Environment" = "Dev",
    		"AutomatedBy" = "Terraform",
	    	"Note1" = "Do not manually change",
		    "POCName" = "ronc@mindpointgroup.com",
    		"POCPhone" = "843.330.6769",
		    "Project" = "Zero Trust Demo"
	    }

        netinf_name = "appgate01_netinf02"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztadev_eastus2_dev_appgate_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.201.28"
        ip_configuration_public_ip_address_id          = null # module.ztadev_eastus2_dev_appgate01_publicip.publicip_id
}

    # appgate01_outputs
    output "ztadev_eastus2_dev_appgate01_vmnix_id" {
        value = module.ztadev_eastus2_dev_appgate01_vmnix.vmnix_id
    }
    output "ztadev_eastus2_dev_appgate01_vmnix_name" {
        value = module.ztadev_eastus2_dev_appgate01_vmnix.vmnix_name
    }
    output "ztadev_eastus2_dev_appgate01_vmnix_computer_name" {
        value = module.ztadev_eastus2_dev_appgate01_vmnix.vmnix_computer_name
    }
    output "ztadev_eastus2_dev_appgate01_vmnix_private_ip_address" {
        value = module.ztadev_eastus2_dev_appgate01_vmnix.vmnix_private_ip_address
    }
    output "ztadev_eastus2_dev_appgate01_vmnix_virtual_machine_id" {
        value = module.ztadev_eastus2_dev_appgate01_vmnix.vmnix_virtual_machine_id
    }
    output "ztadev_eastus2_dev_appgate01_vmnix_public_ip_address" {
        value = module.ztadev_eastus2_dev_appgate01_vmnix.vmnix_public_ip_address
    }
*/
    #appgate01_publicip
/*    output "ztadev_eastus2_dev_appgate01_publicip_id" {
        value = module.ztadev_eastus2_dev_appgate01_publicip.publicip_id
    }
    output "ztadev_eastus2_dev_appgate01_publicip_name" {
        value = module.ztadev_eastus2_dev_appgate01_publicip.publicip_name
    }
    output "ztadev_eastus2_dev_appgate01_publicip_domain_name_label" {
        value = module.ztadev_eastus2_dev_appgate01_publicip.publicip_domain_name_label
    }
*/
	# appgate01_netinf01_outputs
/*	output "ztadev_eastus2_dev_appgate01_netinf01_id" {
		value = module.ztadev_eastus2_dev_appgate01_netinf01.netinf_id
	}
	output "ztadev_eastus2_dev_appgate01_netinf01_name" {
		value = module.ztadev_eastus2_dev_appgate01_netinf01.netinf_name
	}
	output "ztadev_eastus2_dev_appgate01_netinf01_private_ip_address" {
		value = module.ztadev_eastus2_dev_appgate01_netinf01.netinf_private_ip_address
	}
	output "ztadev_eastus2_dev_appgate01_netinf01_virtual_machine_id" {
		value = module.ztadev_eastus2_dev_appgate01_netinf01.netinf_virtual_machine_id
	}

	# appgate01_netinf02_outputs
	output "ztadev_eastus2_dev_appgate01_netinf02_id" {
		value = module.ztadev_eastus2_dev_appgate01_netinf02.netinf_id
	}
	output "ztadev_eastus2_dev_appgate01_netinf02_name" {
		value = module.ztadev_eastus2_dev_appgate01_netinf02.netinf_name
	}
	output "ztadev_eastus2_dev_appgate01_netinf02_private_ip_address" {
		value = module.ztadev_eastus2_dev_appgate01_netinf02.netinf_private_ip_address
	}
	output "ztadev_eastus2_dev_appgate01_netinf02_virtual_machine_id" {
		value = module.ztadev_eastus2_dev_appgate01_netinf02.netinf_virtual_machine_id
	}
*/
#================================================================================
#
# DCEDEMO
# NETWORK.TF
#
#================================================================================
#
# VIRTUAL NETWORKS and SUBNETS

# vnet01
module "kea_dcedemo_eastus_prod_vnet" {
	source = "github.com/cantrellcloud/tfAzureModules/vnet"
	#to_provision = local.provision_vnet01
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vnet_name = "kea_dcedemo_eastus_prod_vnet"
	address_space = [
		"10.0.200.0/27",
		"10.0.200.32/27",
		"10.0.200.64/27",
		"10.0.200.96/27",
		"10.0.200.128/27",
		"10.0.200.160/27",
		"10.0.200.192/27",
		"10.0.200.224/28",
		"10.0.200.248/29"
	]
	dns_servers = [
		"10.0.200.11"
	]
}
	# subnet01
	module "kea_dcedemo_eastus_prod_subnet" {
		source = "github.com/cantrellcloud/tfAzureModules/subnet"
		#to_provision = local.provision_subnet01
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		subnet_name = "kea_dcedemo_eastus_prod_subnet"
		subnet_prefixes = ["10.0.200.0/27"]
		vnet_name = module.kea_dcedemo_eastus_prod_vnet.vnet_name

	}
	# subnet02
	module "kea_dcedemo_eastus_subnetgw_subnet" {
		source = "github.com/cantrellcloud/tfAzureModules/subnet"
		#to_provision = local.provision_subnet02
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		subnet_name = "GatewaySubnet"
		subnet_prefixes = ["10.0.200.248/29"]
		vnet_name = module.kea_dcedemo_eastus_prod_vnet.vnet_name
	}

	# subnet03
	module "kea_dcedemo_eastus_ztcontroller_subnet" {
		source = "github.com/cantrellcloud/tfAzureModules/subnet"
		#to_provision = local.provision_subnet03
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		subnet_name = "kea_dcedemo_eastus_ztcontroller_subnet"
		subnet_prefixes = ["10.0.200.32/27"]
		vnet_name = module.kea_dcedemo_eastus_prod_vnet.vnet_name
	}

	# subnet04
	module "kea_dcedemo_eastus_zerotrust_subnet" {
		source = "github.com/cantrellcloud/tfAzureModules/subnet"
		#to_provision = local.provision_subnet04
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		subnet_name = "kea_dcedemo_eastus_zerotrust_subnet"
		subnet_prefixes = ["10.0.200.64/27"]
		vnet_name = module.kea_dcedemo_eastus_prod_vnet.vnet_name
	}

	#vnet01_outputs
	output "kea_dcedemo_eastus_prod_vnet_id" {
		value = module.kea_dcedemo_eastus_prod_vnet.vnet_id
	}
	output "kea_dcedemo_eastus_prod_vnet_name" {
		value = module.kea_dcedemo_eastus_prod_vnet.vnet_name
	}
		#subnet01
		output "kea_dcedemo_eastus_prod_subnet_id" {
			value = module.kea_dcedemo_eastus_prod_subnet.subnet_id
		}
		output "kea_dcedemo_eastus_prod_subnet_name" {
			value = module.kea_dcedemo_eastus_prod_subnet.subnet_name
		}

		#subnet02
		output "kea_dcedemo_eastus_subnetgw_subnet_id" {
			value = module.kea_dcedemo_eastus_subnetgw_subnet.subnet_id
		}
		output "kea_dcedemo_eastus_subnetgw_subnet_name" {
			value = module.kea_dcedemo_eastus_subnetgw_subnet.subnet_name
		}

		#subnet03
		output "kea_dcedemo_eastus_ztcontroller_subnet_id" {
			value = module.kea_dcedemo_eastus_ztcontroller_subnet.subnet_id
		}
		output "kea_dcedemo_eastus_ztcontroller_subnet_name" {
			value = module.kea_dcedemo_eastus_ztcontroller_subnet.subnet_name
		}

		#subnet04
		output "kea_dcedemo_eastus_zerotrust_subnet_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet.subnet_id
		}
		output "kea_dcedemo_eastus_zerotrust_subnet_name" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet.subnet_name
		}

#================================================================================
#
# VIRTUALL NETWORK GATEWAYS

# vnetgw01
/*module "kea_dcedemo_eastus_prod_vnetgw" {
	source = "github.com/cantrellcloud/tfAzureModules/vnetgw"
	#to_provision = local.provision_vnetgw01
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name
	vnetgw_name = "kea_dcedemo_eastus_prod_vnetgw"

	type = "Vpn"
	vpn_type = "RouteBased"
	active_active = false
	enable_bgp = false
	sku = "Basic"
	ip_config_name = "default"
	public_ip_address_id = module.kea_dcedemo_eastus_prod_vnetgw_publicip.publicip_id
	private_ip_address_allocation = "Dynamic"
	subnet_id = module.kea_dcedemo_eastus_subnetgw_subnet.subnet_id
	address_space = [
		"10.0.200.240/29"
	]
	vpn_client_protocols = [
		"SSTP"
	]

	depends_on = [
		module.kea_dcedemo_eastus_prod_vnetgw_publicip
	]
}*/

	#vnetgw01_outputs
	/*output "kea_dcedemo_eastus_prod_vnetgw_id" {
		value = module.kea_dcedemo_eastus_prod_vnetgw.vnetgw_id
	}
	output "kea_dcedemo_eastus_prod_vnetgw_name" {
		value = module.kea_dcedemo_eastus_prod_vnetgw.vnetgw_name
	}*/

#================================================================================
#
# PUBLIC IPS
#
# 	Note: Virtual machine PublicIPs configuration
#	      blocks are located in the compute.tf file.

/*
    Below resources are not currently being used
*/

/*
# publicip03
module "kea_dcedemo_eastus_jidcjtochat01_publicip" {
	source            = "github.com/cantrellcloud/tfAzureModules/publicip"
	#to_provision     = local.provision_publicip03
	rg_location       = module.kea_dcedemo_eastus_rg.rg_location
	rg_name           = module.kea_dcedemo_eastus_rg.rg_name
	publicip_name     = "kea_dcedemo_eastus_jidcjtochat01_publicip"
	allocation_method = "Static"
	sku               = "Standard"
	domain_name_label = "demo-app01"
}

# publicip04
module "kea_dcedemo_eastus_demojpc01_publicip" {
	source            = "github.com/cantrellcloud/tfAzureModules/publicip"
	#to_provision     = local.provision_publicip04
	rg_location       = module.kea_dcedemo_eastus_rg.rg_location
	rg_name           = module.kea_dcedemo_eastus_rg.rg_name
	publicip_name     = "kea_dcedemo_eastus_demojpc01_publicip"
	allocation_method = "Static"
	sku               = "Standard"
	domain_name_label = "demo-jpc01"
}
*/

#================================================================================
#
# NETWORK SECURITY GROUPS, RULES, and ASSOCIATIONS

# nsg01
module "kea_dcedemo_eastus_prod_subnet_nsg" {
	source            = "github.com/cantrellcloud/tfAzureModules/nsg"
	#to_provision     = local.provision_nsg01
	rg_location       = module.kea_dcedemo_eastus_rg.rg_location
	rg_name           = module.kea_dcedemo_eastus_rg.rg_name
	nsg_name          = "kea_dcedemo_eastus_prod_subnet_nsg"

}

	# nsg01_outputs
	output "kea_dcedemo_eastus_prod_subnet_nsg_id" {
		value = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_id
	}
	output "kea_dcedemo_eastus_prod_subnet_nsg_name" {
		value = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name
	}

	# nsgassoc
	resource "azurerm_subnet_network_security_group_association" "kea_dcedemo_eastus_prod_subnet_nsgassoc" {
		subnet_id = module.kea_dcedemo_eastus_prod_subnet.subnet_id
		network_security_group_id = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_id
	}

	# nsgassoc
	resource "azurerm_subnet_network_security_group_association" "kea_dcedemo_eastus_ztcontroller_subnet_nsgassoc" {
		subnet_id = module.kea_dcedemo_eastus_ztcontroller_subnet.subnet_id
		network_security_group_id = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_id
	}

	# nsr01-00
	module "kea_dcedemo_eastus_prod_subnet_nsg_nsr_allow_icmp" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-00
		nsr_name = "Allow_ICMP"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name

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
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-00_outputs
		output "kea_dcedemo_eastus_prod_subnet_nsg_nsr_allow_icmp_id" {
			value = module.kea_dcedemo_eastus_prod_subnet_nsg_nsr_allow_icmp.nsr_id
		}

	# nsr01-01
	module "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_3389" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-01
		nsr_name = "Port_3389"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name

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
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-01_outputs
		output "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_3389_id" {
			value = module.kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_3389.nsr_id
		}

	# nsr01-02
	module "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_443" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-02
		nsr_name = "Port_443"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP443"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.20",
			"10.0.200.23",
			"10.0.200.24"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "443"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 102
		security_rule_protocol = "TCP"
		security_rule_source_address_prefix = "*"
		#security_rule_source_address_prefixes = [
		#	"97.76.159.66",
		#	"24.107.214.116"
		#]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-02_outputs
		output "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_443_id" {
			value = module.kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_443.nsr_id
		}

	# nsr01-03
	module "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_80" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-03
		nsr_name = "Port_80"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP80"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.25"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "80"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 103
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-03_outputs
		output "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_80_id" {
			value = module.kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_80.nsr_id
		}

	# nsr01-04
	module "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_58080" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-04
		nsr_name = "Port_58080"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP58080"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.22",
			"10.0.200.40",
			"10.0.200.41",
			"10.0.200.42",
			"10.0.200.43"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "58080"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 104
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-04_outputs
		output "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_58080_id" {
			value = module.kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_58080.nsr_id
		}

	# nsr01-05
	module "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_1433" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-05
		nsr_name = "Port_1433"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP1433"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.20"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "1433"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 105
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-05_outputs
		output "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_1433_id" {
			value = module.kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_1433.nsr_id
		}

	# nsr01-06
	module "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_22" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-06
		nsr_name = "Port_22"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP22"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.6",
			"10.0.200.25",
			"10.0.200.30",
			"10.0.200.40",
			"10.0.200.41",
			"10.0.200.42",
			"10.0.200.43"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "22"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 106
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-06_outputs
		output "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_22_id" {
			value = module.kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_22.nsr_id
		}

	# nsr01-07
	module "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_3306" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-07
		nsr_name = "Port_3306"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP3306"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.25"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "3306"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 107
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-07_outputs
		output "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_3306_id" {
			value = module.kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_3306.nsr_id
		}

	# nsr01-08
	module "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_8080" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-08
		nsr_name = "Port_8080"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP8080"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.22",
			"10.0.200.25",
			"10.0.200.30",
			"10.0.200.40",
			"10.0.200.41",
			"10.0.200.42",
			"10.0.200.43"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "8080"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 108
		security_rule_protocol = "TCP"
		security_rule_source_address_prefix = "*"
		/*security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]*/
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-08_outputs
		output "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_8080_id" {
			value = module.kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_8080.nsr_id
		}

# nsr01-09
	module "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_8081" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-09
		nsr_name = "Port_8081"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP8081"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.22",
			"10.0.200.25"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "8081"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 109
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = "*"
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-09_outputs
		output "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_8081_id" {
			value = module.kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_8081.nsr_id
		}

	# nsr01-10
	module "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_8443" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-10
		nsr_name = "Port_8443"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP8443"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.20"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "8443"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 110
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = "*"
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116",
			"52.167.251.99"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-10_outputs
		output "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_8443_id" {
			value = module.kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_8443.nsr_id
		}

	# nsr01-11
	module "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_389" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-11
		nsr_name = "Port_389"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP389"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.11"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "389"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 111
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = "*"
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116",
			"52.167.251.99"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-11_outputs
		output "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_389_id" {
			value = module.kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_389.nsr_id
		}

	# nsr01-12
	module "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_25" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-12
		nsr_name = "Port_25"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_prod_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP25"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.24"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "25"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 112
		security_rule_protocol = "TCP"
		security_rule_source_address_prefix = "*"
		#security_rule_source_address_prefixes = [
		#	"97.76.159.66",
		#	"24.107.214.116",
		#	"52.167.251.99"
		#]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr01-12_outputs
		output "kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_25_id" {
			value = module.kea_dcedemo_eastus_prod_subnet_nsg_nsr_port_25.nsr_id
		}

# nsg02
module "kea_dcedemo_eastus_zerotrust_subnet_nsg" {
	source            = "github.com/cantrellcloud/tfAzureModules/nsg"
	#to_provision     = local.provision_nsg02
	rg_location       = module.kea_dcedemo_eastus_rg.rg_location
	rg_name           = module.kea_dcedemo_eastus_rg.rg_name
	nsg_name          = "kea_dcedemo_eastus_zerotrust_subnet_nsg"

}

	# nsg02_outputs
	output "kea_dcedemo_eastus_zerotrust_subnet_nsg_id" {
		value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_id
	}
	output "kea_dcedemo_eastus_zerotrust_subnet_nsg_name" {
		value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name
	}

	# nsgassoc
	resource "azurerm_subnet_network_security_group_association" "kea_dcedemo_eastus_zerotrust_subnet_nsgassoc" {
		subnet_id = module.kea_dcedemo_eastus_zerotrust_subnet.subnet_id
		network_security_group_id = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_id
	}

	# nsr02-00
	module "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_allow_icmp" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr01-00
		nsr_name = "Allow_ICMP"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name

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
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-00_outputs
		output "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_allow_icmp_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_allow_icmp.nsr_id
		}
/*
	# nsr02-01
	module "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_3389" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr02-01
		nsr_name = "Port_3389"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name

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
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-01_outputs
		output "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_3389_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_3389.nsr_id
		}
*/
	# nsr02-02
	module "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_443" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr02-02
		nsr_name = "Port_443"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP443"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.70",
			"10.0.200.71",
			"10.0.200.72"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "443"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 102
		security_rule_protocol = "TCP"
		security_rule_source_address_prefix = "*"
		#security_rule_source_address_prefixes = [
		#	"97.76.159.66",
		#	"24.107.214.116"
		#]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-02_outputs
		output "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_443_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_443.nsr_id
		}

	# nsr02-03
	module "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_80" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr02-03
		nsr_name = "Port_80"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP80"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.70",
			"10.0.200.71",
			"10.0.200.72"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "80"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 103
		security_rule_protocol = "TCP"
		security_rule_source_address_prefix = "*"
		#security_rule_source_address_prefixes = [
		#	"97.76.159.66",
		#	"24.107.214.116"
		#]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-03_outputs
		output "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_80_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_80.nsr_id
		}

	# nsr02-04
/*	module "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_58080" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr02-04
		nsr_name = "Port_58080"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP58080"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.22",
			"10.0.200.40",
			"10.0.200.41",
			"10.0.200.42",
			"10.0.200.43"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "58080"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 104
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-04_outputs
		output "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_58080_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_58080.nsr_id
		}

	# nsr02-05
	module "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_1433" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr02-05
		nsr_name = "Port_1433"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP1433"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.20"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "1433"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 105
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-05_outputs
		output "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_1433_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_1433.nsr_id
		}
*/
	# nsr02-06
	module "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_22" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr02-06
		nsr_name = "Port_22"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP22"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.70",
			"10.0.200.71",
			"10.0.200.72"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "22"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 106
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-06_outputs
		output "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_22_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_22.nsr_id
		}
/*
	# nsr02-07
	module "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_3306" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr02-07
		nsr_name = "Port_3306"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP3306"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.25"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "3306"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 107
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = ""
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-07_outputs
		output "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_3306_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_3306.nsr_id
		}

	# nsr02-08
	module "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_8080" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr02-08
		nsr_name = "Port_8080"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP8080"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.22",
			"10.0.200.25",
			"10.0.200.30",
			"10.0.200.40",
			"10.0.200.41",
			"10.0.200.42",
			"10.0.200.43"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "8080"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 108
		security_rule_protocol = "TCP"
		security_rule_source_address_prefix = "*"
		/*security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]*/
/*		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-08_outputs
		output "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_8080_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_8080.nsr_id
		}

# nsr02-09
	module "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_8081" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr02-09
		nsr_name = "Port_8081"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP8081"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.22",
			"10.0.200.25"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "8081"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 109
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = "*"
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-09_outputs
		output "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_8081_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_8081.nsr_id
		}
*/
	# nsr02-10
	module "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_8443" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr02-10
		nsr_name = "Port_8443"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP8443"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.70",
			"10.0.200.71",
			"10.0.200.72"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "8443"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 110
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = "*"
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-10_outputs
		output "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_8443_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_8443.nsr_id
		}
/*
	# nsr02-11
	module "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_389" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr02-11
		nsr_name = "Port_389"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP389"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.11"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "389"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 111
		security_rule_protocol = "TCP"
		#security_rule_source_address_prefix = "*"
		security_rule_source_address_prefixes = [
			"97.76.159.66",
			"24.107.214.116",
			"52.167.251.99"
		]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-11_outputs
		output "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_389_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_389.nsr_id
		}

	# nsr02-12
	module "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_25" {
		source            = "github.com/cantrellcloud/tfAzureModules/nsr"
		#to_provision     = local.provision_nsr02-12
		nsr_name = "Port_25"
		rg_name = module.kea_dcedemo_eastus_rg.rg_name
		network_security_group_name = module.kea_dcedemo_eastus_zerotrust_subnet_nsg.nsg_name

		# security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow TCP25"
		#security_rule_destination_address_prefix = ""
		security_rule_destination_address_prefixes = [
			"10.0.200.24"
		]
		security_rule_destination_application_security_group_ids = []
		security_rule_destination_port_range = "25"
		#security_rule_destination_port_ranges = []
		security_rule_direction = "Inbound"
		security_rule_priority = 112
		security_rule_protocol = "TCP"
		security_rule_source_address_prefix = "*"
		#security_rule_source_address_prefixes = [
		#	"97.76.159.66",
		#	"24.107.214.116",
		#	"52.167.251.99"
		#]
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# nsr02-12_outputs
		output "kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_25_id" {
			value = module.kea_dcedemo_eastus_zerotrust_subnet_nsg_nsr_port_25.nsr_id
		}
*/
#================================================================================
#
# LOCAL NETWORK GATEWAYS

# localgw01
module "kea_dcedemo_cces_cotpa_localgw" {
	source = "github.com/cantrellcloud/tfAzureModules/localgw"
	#to_provision = local.provision_localgw01
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name
	localgw_name = "kea_dcedemo_cces_cotpa_localgw"
	gateway_address = local.localgw01_gateway_address

	# ENTER NETWORK IDs OF LOCAL NET FOR ROUTING 
	address_space = [
		"10.0.2.0/30",
		"10.0.60.0/30",
		"10.0.1.0/30",
		"172.16.0.0/21",
		"172.16.8.0/21",
		"172.16.60.0/23",
		"172.16.62.0/23",
		"172.16.64.0/23",
		"172.16.66.0/23",
		"172.16.68.0/24",
		"172.16.69.0/24",
		"10.0.254.0/24",
		"10.0.255.0/24"
	]
}

#================================================================================
#
# VPN CONNECTIONS

# vpncon01
/*module "kea_dcedemo_eastus_cces_cotpa_vpncon" {
	source = "github.com/cantrellcloud/tfAzureModules/vpncon"
	#to_provision = local.provision_vpncon01
	vpncon_name = "kea_dcedemo_eastus_cces_cotpa_vpncon"
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vpncon_localgw_id = module.kea_dcedemo_cces_cotpa_localgw.localgw_id
	vpncon_shared_key = "RD#v\u002696f7@\u0026FA^vBouxG"
	vpncon_vnetgw_id = module.kea_dcedemo_eastus_prod_vnetgw.vnetgw_id
}*/
#================================================================================
#
# Appgate Resources - Portal Appliances Configuration
#
#================================================================================
#
# Network Subnets
#
# appgate_portal_subnet01
module "jtodev_eastus2_dev_appgate_portal_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet01
	rg_name = module.jtodev_eastus2_dev_appgate_rg.rg_name
	subnet_name = "jtodev_eastus2_dev_appgate_portal_subnet"
	vnet_name = module.jtodev_eastus2_dev_appgate_vnet.vnet_name
	subnet_prefixes = ["172.16.201.64/27"]
}
	#appgate_portal_subnet01_output
		output "jtodev_eastus2_dev_appgate_portal_subnet_id" {
			value = module.jtodev_eastus2_dev_appgate_portal_subnet.subnet_id
		}
		output "jtodev_eastus2_dev_appgate_portal_subnet_name" {
			value = module.jtodev_eastus2_dev_appgate_portal_subnet.subnet_name
		}

#================================================================================
#
# Network Security
#
#--------------------------------------------------------------------------------
#
# NETWORK SECURITY GROUPS, RULES, and ASSOCIATIONS
#
# appgate_portal_nsg01
module "jtodev_eastus2_dev_appgate_portal_subnet_nsg" {
	source            = "github.com/cantrellcloud/tfaz-nsg"
	#to_provision     = local.provision_appgate_nsg01
	rg_location       = module.jtodev_eastus2_dev_appgate_rg.rg_location
	rg_name           = module.jtodev_eastus2_dev_appgate_rg.rg_name
	nsg_name          = "jtodev_eastus2_dev_appgate_portal_subnet_nsg"

}

	# appgate_portal_nsg01_outputs
	output "jtodev_eastus2_dev_appgate_portal_subnet_nsg_id" {
		value = module.jtodev_eastus2_dev_appgate_portal_subnet_nsg.nsg_id
	}
	output "jtodev_eastus2_dev_appgate_portal_subnet_nsg_name" {
		value = module.jtodev_eastus2_dev_appgate_portal_subnet_nsg.nsg_name
	}

	# appgate_portal_nsgassoc01
	resource "azurerm_subnet_network_security_group_association" "jtodev_eastus2_dev_appgate_portal_subnet_nsgassoc" {
		subnet_id = module.jtodev_eastus2_dev_appgate_portal_subnet.subnet_id
		network_security_group_id = module.jtodev_eastus2_dev_appgate_portal_subnet_nsg.nsg_id
	}

	# appgate_portal_nsr01-02
	module "jtodev_eastus2_dev_appgate_portal_subnet_nsg_nsr_port_443" {
		source            = "github.com/cantrellcloud/tfaz-nsr"
		#to_provision     = local.provision_nsr01-02
		nsr_name = "Port_443"
		rg_name = module.jtodev_eastus2_dev_appgate_rg.rg_name
		network_security_group_name = module.jtodev_eastus2_dev_appgate_portal_subnet_nsg.nsg_name

		# appgate_portal_security rule
		security_rule_access = "Allow"
		security_rule_description = "Allow Tcp443"
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
		security_rule_protocol = "Tcp"
		security_rule_source_address_prefix = "*"
		/*security_rule_source_address_prefixes = [
			"144.129.196.130"
		]*/
		security_rule_source_application_security_group_ids = []
		security_rule_source_port_range = "*"
		#security_rule_source_port_ranges = []
	}

		# appgate_portal_nsr01-02_outputs
		output "jtodev_eastus2_dev_appgate_portal_subnet_nsg_nsr_port_443_id" {
			value = module.jtodev_eastus2_dev_appgate_portal_subnet_nsg_nsr_port_443.nsr_id
		}

#--------------------------------------------------------------------------------
#
# Public IPs
#
# appgate_portal_publicip
module "jtodev_eastus2_dev_appgate_portal_publicip" {
    source            = "github.com/cantrellcloud/tfaz-publicip"
    #to_provision     = local.provision_jtodevdc01_publicip
    rg_location       = module.jtodev_eastus2_dev_appgate_rg.rg_location
    rg_name           = module.jtodev_eastus2_dev_appgate_rg.rg_name
	rg_tags               = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment"     = "Dev",
		"AutomatedBy"     = "Terraform",
		"Note1"           = "Do not manually change",
		"POCName"         = "ronc@mindpointgroup.com",
		"POCPhone"        = "843.330.6769",
		"Project"         = "Zero Trust Demo"
	}

    publicip_name              = "jtodev_eastus2_dev_appgate_portal_publicip"
    publicip_allocation_method = "Static"
    publicip_sku               = "Basic"
    publicip_domain_name_label = "sdpdevportal"
}

#appgate_portal_publicip_outputs
    output "jtodev_eastus2_dev_appgate_portal_publicip_id" {
        value = module.jtodev_eastus2_dev_appgate_portal_publicip.publicip_id
    }
    output "jtodev_eastus2_dev_appgate_portal_publicip_name" {
        value = module.jtodev_eastus2_dev_appgate_portal_publicip.publicip_name
    }
    output "jtodev_eastus2_dev_appgate_portal_publicip_domain_name_label" {
        value = module.jtodev_eastus2_dev_appgate_portal_publicip.publicip_domain_name_label
    }

#--------------------------------------------------------------------------------
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
# Public IPs
#
# appgate_publicip
module "ztadev_eastus2_dev_appgate_publicip" {
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

    publicip_name              = "ztadev_eastus2_dev_appgate_publicip"
    publicip_allocation_method = "Dynamic"
    publicip_sku               = "Basic"
    publicip_domain_name_label = "ztadev-appgate"
}

#appgate_publicip_outputs
    output "ztadev_eastus2_dev_appgate_publicip_id" {
        value = module.ztadev_eastus2_dev_appgate_publicip.publicip_id
    }
    output "ztadev_eastus2_dev_appgate_publicip_name" {
        value = module.ztadev_eastus2_dev_appgate_publicip.publicip_name
    }
    output "ztadev_eastus2_dev_appgate_publicip_domain_name_label" {
        value = module.ztadev_eastus2_dev_appgate_publicip.publicip_domain_name_label
    }

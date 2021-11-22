#================================================================================
#
# ZTADEV
# Network Subnets
#
#================================================================================
#
#
# subnet01
module "ztadev_eastus2_dev_prod_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet01
	rg_name = module.ztadev_eastus2_dev_rg.rg_name
	subnet_name = "ztadev_eastus2_dev_prod_subnet"
	vnet_name = module.ztadev_eastus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.200.0/27"]
}
	#subnet01
		output "ztadev_eastus2_dev_prod_subnet_id" {
			value = module.ztadev_eastus2_dev_prod_subnet.subnet_id
		}
		output "ztadev_eastus2_dev_prod_subnet_name" {
			value = module.ztadev_eastus2_dev_prod_subnet.subnet_name
		}

# subnet02
module "ztadev_eastus2_dev_subnetgw_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet02
	rg_name = module.ztadev_eastus2_dev_rg.rg_name
	subnet_name = "GatewaySubnet"
	vnet_name = module.ztadev_eastus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.200.248/29"]
}

		#subnet02
		output "ztadev_eastus2_dev_subnetgw_subnet_id" {
			value = module.ztadev_eastus2_dev_subnetgw_subnet.subnet_id
		}
		output "ztadev_eastus2_dev_subnetgw_subnet_name" {
			value = module.ztadev_eastus2_dev_subnetgw_subnet.subnet_name
		}

# subnet03
module "ztadev_eastus2_dev_ztcontroller_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet03
	rg_name = module.ztadev_eastus2_dev_rg.rg_name
	subnet_name = "ztadev_eastus2_dev_ztcontroller_subnet"
	vnet_name = module.ztadev_eastus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.200.32/27"]
}

		#subnet03
		output "ztadev_eastus2_dev_ztcontroller_subnet_id" {
			value = module.ztadev_eastus2_dev_ztcontroller_subnet.subnet_id
		}
		output "ztadev_eastus2_dev_ztcontroller_subnet_name" {
			value = module.ztadev_eastus2_dev_ztcontroller_subnet.subnet_name
		}

# subnet04
module "ztadev_eastus2_dev_edge_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet04
	rg_name = module.ztadev_eastus2_dev_rg.rg_name
	subnet_name = "ztadev_eastus2_dev_edge_subnet"
	vnet_name = module.ztadev_eastus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.200.64/27"]
}
		#subnet04
		output "ztadev_eastus2_dev_edge_subnet_id" {
			value = module.ztadev_eastus2_dev_edge_subnet.subnet_id
		}
		output "ztadev_eastus2_dev_edge_subnet_name" {
			value = module.ztadev_eastus2_dev_edge_subnet.subnet_name
		}

# subnet05
module "ztadev_eastus2_dev_azure_bastion_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet05
	rg_name = module.ztadev_eastus2_dev_rg.rg_name
	subnet_name = "AzureBastionSubnet"
	vnet_name = module.ztadev_eastus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.200.96/27"]
}
		#subnet05
		output "ztadev_eastus2_dev_azure_bastion_subnet_id" {
			value = module.ztadev_eastus2_dev_azure_bastion_subnet.subnet_id
		}
		output "ztadev_eastus2_dev_azure_bastion_subnet_name" {
			value = module.ztadev_eastus2_dev_azure_bastion_subnet.subnet_name
		}

# subnet11
module "ztadev_eastus_dev_prod_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet11
	rg_name = module.ztadev_eastus_dev_rg.rg_name
	subnet_name = "ztadev_eastus_dev_prod_subnet"
	vnet_name = module.ztadev_eastus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.202.0/27"]
}
	#subnet11
		output "ztadev_eastus_dev_prod_subnet_id" {
			value = module.ztadev_eastus_dev_prod_subnet.subnet_id
		}
		output "ztadev_eastus_dev_prod_subnet_name" {
			value = module.ztadev_eastus_dev_prod_subnet.subnet_name
		}

# subnet12
module "ztadev_eastus_dev_subnetgw_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet12
	rg_name = module.ztadev_eastus_dev_rg.rg_name
	subnet_name = "GatewaySubnet"
	vnet_name = module.ztadev_eastus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.202.248/29"]
}

		#subnet12
		output "ztadev_eastus_dev_subnetgw_subnet_id" {
			value = module.ztadev_eastus_dev_subnetgw_subnet.subnet_id
		}
		output "ztadev_eastus_dev_subnetgw_subnet_name" {
			value = module.ztadev_eastus_dev_subnetgw_subnet.subnet_name
		}

# subnet13
module "ztadev_eastus_dev_ztcontroller_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet13
	rg_name = module.ztadev_eastus_dev_rg.rg_name
	subnet_name = "ztadev_eastus_dev_ztcontroller_subnet"
	vnet_name = module.ztadev_eastus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.202.32/27"]
}

		#subnet13
		output "ztadev_eastus_dev_ztcontroller_subnet_id" {
			value = module.ztadev_eastus_dev_ztcontroller_subnet.subnet_id
		}
		output "ztadev_eastus_dev_ztcontroller_subnet_name" {
			value = module.ztadev_eastus_dev_ztcontroller_subnet.subnet_name
		}

# subnet14
module "ztadev_eastus_dev_edge_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet14
	rg_name = module.ztadev_eastus_dev_rg.rg_name
	subnet_name = "ztadev_eastus_dev_edge_subnet"
	vnet_name = module.ztadev_eastus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.202.64/27"]
}
		#subnet14
		output "ztadev_eastus_dev_edge_subnet_id" {
			value = module.ztadev_eastus_dev_edge_subnet.subnet_id
		}
		output "ztadev_eastus_dev_edge_subnet_name" {
			value = module.ztadev_eastus_dev_edge_subnet.subnet_name
		}

# subnet15
module "ztadev_eastus_dev_azure_bastion_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet15
	rg_name = module.ztadev_eastus_dev_rg.rg_name
	subnet_name = "AzureBastionSubnet"
	vnet_name = module.ztadev_eastus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.202.96/27"]
}
		#subnet15
		output "ztadev_eastus_dev_azure_bastion_subnet_id" {
			value = module.ztadev_eastus_dev_azure_bastion_subnet.subnet_id
		}
		output "ztadev_eastus_dev_azure_bastion_subnet_name" {
			value = module.ztadev_eastus_dev_azure_bastion_subnet.subnet_name
		}


# subnet31
module "ztadev_westus2_dev_prod_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet31
	rg_name = module.ztadev_westus2_dev_rg.rg_name
	subnet_name = "ztadev_westus2_dev_prod_subnet"
	vnet_name = module.ztadev_westus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.0/27"]
}
	#subnet31
		output "ztadev_westus2_dev_prod_subnet_id" {
			value = module.ztadev_westus2_dev_prod_subnet.subnet_id
		}
		output "ztadev_westus2_dev_prod_subnet_name" {
			value = module.ztadev_westus2_dev_prod_subnet.subnet_name
		}

# subnet32
module "ztadev_westus2_dev_subnetgw_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet32
	rg_name = module.ztadev_westus2_dev_rg.rg_name
	subnet_name = "GatewaySubnet"
	vnet_name = module.ztadev_westus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.248/29"]
}

		#subnet32
		output "ztadev_westus2_dev_subnetgw_subnet_id" {
			value = module.ztadev_westus2_dev_subnetgw_subnet.subnet_id
		}
		output "ztadev_westus2_dev_subnetgw_subnet_name" {
			value = module.ztadev_westus2_dev_subnetgw_subnet.subnet_name
		}

# subnet33
module "ztadev_westus2_dev_ztcontroller_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet33
	rg_name = module.ztadev_westus2_dev_rg.rg_name
	subnet_name = "ztadev_westus2_dev_ztcontroller_subnet"
	vnet_name = module.ztadev_westus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.32/27"]
}

		#subnet33
		output "ztadev_westus2_dev_ztcontroller_subnet_id" {
			value = module.ztadev_westus2_dev_ztcontroller_subnet.subnet_id
		}
		output "ztadev_westus2_dev_ztcontroller_subnet_name" {
			value = module.ztadev_westus2_dev_ztcontroller_subnet.subnet_name
		}

# subnet34
module "ztadev_westus2_dev_edge_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet34
	rg_name = module.ztadev_westus2_dev_rg.rg_name
	subnet_name = "ztadev_westus2_dev_edge_subnet"
	vnet_name = module.ztadev_westus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.64/27"]
}
		#subnet34
		output "ztadev_westus2_dev_edge_subnet_id" {
			value = module.ztadev_westus2_dev_edge_subnet.subnet_id
		}
		output "ztadev_westus2_dev_edge_subnet_name" {
			value = module.ztadev_westus2_dev_edge_subnet.subnet_name
		}

# subnet35
module "ztadev_westus2_dev_azure_bastion_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet35
	rg_name = module.ztadev_westus2_dev_rg.rg_name
	subnet_name = "AzureBastionSubnet"
	vnet_name = module.ztadev_westus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.96/27"]
}
		#subnet35
		output "ztadev_westus2_dev_azure_bastion_subnet_id" {
			value = module.ztadev_westus2_dev_azure_bastion_subnet.subnet_id
		}
		output "ztadev_westus2_dev_azure_bastion_subnet_name" {
			value = module.ztadev_westus2_dev_azure_bastion_subnet.subnet_name
		}

# subnet41
module "ztadev_westus_dev_prod_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet41
	rg_name = module.ztadev_westus_dev_rg.rg_name
	subnet_name = "ztadev_westus_dev_prod_subnet"
	vnet_name = module.ztadev_westus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.204.0/27"]
}
	#subnet41
		output "ztadev_westus_dev_prod_subnet_id" {
			value = module.ztadev_westus_dev_prod_subnet.subnet_id
		}
		output "ztadev_westus_dev_prod_subnet_name" {
			value = module.ztadev_westus_dev_prod_subnet.subnet_name
		}

# subnet42
module "ztadev_westus_dev_subnetgw_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet42
	rg_name = module.ztadev_westus_dev_rg.rg_name
	subnet_name = "GatewaySubnet"
	vnet_name = module.ztadev_westus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.204.248/29"]
}

		#subnet42
		output "ztadev_westus_dev_subnetgw_subnet_id" {
			value = module.ztadev_westus_dev_subnetgw_subnet.subnet_id
		}
		output "ztadev_westus_dev_subnetgw_subnet_name" {
			value = module.ztadev_westus_dev_subnetgw_subnet.subnet_name
		}

# subnet43
module "ztadev_westus_dev_ztcontroller_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet43
	rg_name = module.ztadev_westus_dev_rg.rg_name
	subnet_name = "ztadev_westus_dev_ztcontroller_subnet"
	vnet_name = module.ztadev_westus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.204.32/27"]
}

		#subnet43
		output "ztadev_westus_dev_ztcontroller_subnet_id" {
			value = module.ztadev_westus_dev_ztcontroller_subnet.subnet_id
		}
		output "ztadev_westus_dev_ztcontroller_subnet_name" {
			value = module.ztadev_westus_dev_ztcontroller_subnet.subnet_name
		}

# subnet44
module "ztadev_westus_dev_edge_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet44
	rg_name = module.ztadev_westus_dev_rg.rg_name
	subnet_name = "ztadev_westus_dev_edge_subnet"
	vnet_name = module.ztadev_westus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.204.64/27"]
}
		#subnet44
		output "ztadev_westus_dev_edge_subnet_id" {
			value = module.ztadev_westus_dev_edge_subnet.subnet_id
		}
		output "ztadev_westus_dev_edge_subnet_name" {
			value = module.ztadev_westus_dev_edge_subnet.subnet_name
		}

# subnet45
module "ztadev_westus_dev_azure_bastion_subnet" {
	source = "github.com/cantrellcloud/tfaz-subnet"
	#to_provision = local.provision_subnet45
	rg_name = module.ztadev_westus_dev_rg.rg_name
	subnet_name = "AzureBastionSubnet"
	vnet_name = module.ztadev_westus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.204.96/27"]
}
		#subnet45
		output "ztadev_westus_dev_azure_bastion_subnet_id" {
			value = module.ztadev_westus_dev_azure_bastion_subnet.subnet_id
		}
		output "ztadev_westus_dev_azure_bastion_subnet_name" {
			value = module.ztadev_westus_dev_azure_bastion_subnet.subnet_name
		}

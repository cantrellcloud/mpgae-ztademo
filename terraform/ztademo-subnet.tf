#================================================================================
#
# ZTADEMO
# Network Subnets
#
#================================================================================
#
#
# subnet01
module "ztademo_eastus2_dev_prod_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet01
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	subnet_name = "ztademo_eastus2_dev_prod_subnet"
	vnet_name = module.ztademo_eastus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.200.0/27"]
}
	#subnet01
		output "ztademo_eastus2_dev_prod_subnet_id" {
			value = module.ztademo_eastus2_dev_prod_subnet.subnet_id
		}
		output "ztademo_eastus2_dev_prod_subnet_name" {
			value = module.ztademo_eastus2_dev_prod_subnet.subnet_name
		}

# subnet02
module "ztademo_eastus2_dev_subnetgw_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet02
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	subnet_name = "GatewaySubnet"
	vnet_name = module.ztademo_eastus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.200.248/29"]
}

		#subnet02
		output "ztademo_eastus2_dev_subnetgw_subnet_id" {
			value = module.ztademo_eastus2_dev_subnetgw_subnet.subnet_id
		}
		output "ztademo_eastus2_dev_subnetgw_subnet_name" {
			value = module.ztademo_eastus2_dev_subnetgw_subnet.subnet_name
		}

# subnet03
module "ztademo_eastus2_dev_ztcontroller_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet03
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	subnet_name = "ztademo_eastus2_dev_ztcontroller_subnet"
	vnet_name = module.ztademo_eastus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.200.32/27"]
}

		#subnet03
		output "ztademo_eastus2_dev_ztcontroller_subnet_id" {
			value = module.ztademo_eastus2_dev_ztcontroller_subnet.subnet_id
		}
		output "ztademo_eastus2_dev_ztcontroller_subnet_name" {
			value = module.ztademo_eastus2_dev_ztcontroller_subnet.subnet_name
		}

# subnet04
module "ztademo_eastus2_dev_edge_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet04
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	subnet_name = "ztademo_eastus2_dev_edge_subnet"
	vnet_name = module.ztademo_eastus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.200.64/27"]
}
		#subnet04
		output "ztademo_eastus2_dev_edge_subnet_id" {
			value = module.ztademo_eastus2_dev_edge_subnet.subnet_id
		}
		output "ztademo_eastus2_dev_edge_subnet_name" {
			value = module.ztademo_eastus2_dev_edge_subnet.subnet_name
		}

# subnet05
module "ztademo_eastus2_azure_bastion_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet05
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	subnet_name = "AzureBastionSubnet"
	vnet_name = module.ztademo_eastus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.200.96/27"]
}
		#subnet05
		output "ztademo_eastus2_azure_bastion_subnet_id" {
			value = module.ztademo_eastus2_azure_bastion_subnet.subnet_id
		}
		output "ztademo_eastus2_azure_bastion_subnet_name" {
			value = module.ztademo_eastus2_azure_bastion_subnet.subnet_name
		}

# subnet11
module "ztademo_eastus_dev_prod_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet11
	rg_name = module.ztademo_eastus_dev_rg.rg_name
	subnet_name = "ztademo_eastus_dev_prod_subnet"
	vnet_name = module.ztademo_eastus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.204.0/27"]
}
	#subnet11
		output "ztademo_eastus_dev_prod_subnet_id" {
			value = module.ztademo_eastus_dev_prod_subnet.subnet_id
		}
		output "ztademo_eastus_dev_prod_subnet_name" {
			value = module.ztademo_eastus_dev_prod_subnet.subnet_name
		}

# subnet12
module "ztademo_eastus_dev_subnetgw_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet12
	rg_name = module.ztademo_eastus_dev_rg.rg_name
	subnet_name = "GatewaySubnet"
	vnet_name = module.ztademo_eastus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.204.248/29"]
}

		#subnet12
		output "ztademo_eastus_dev_subnetgw_subnet_id" {
			value = module.ztademo_eastus_dev_subnetgw_subnet.subnet_id
		}
		output "ztademo_eastus_dev_subnetgw_subnet_name" {
			value = module.ztademo_eastus_dev_subnetgw_subnet.subnet_name
		}

# subnet13
module "ztademo_eastus_dev_ztcontroller_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet13
	rg_name = module.ztademo_eastus_dev_rg.rg_name
	subnet_name = "ztademo_eastus_dev_ztcontroller_subnet"
	vnet_name = module.ztademo_eastus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.204.32/27"]
}

		#subnet13
		output "ztademo_eastus_dev_ztcontroller_subnet_id" {
			value = module.ztademo_eastus_dev_ztcontroller_subnet.subnet_id
		}
		output "ztademo_eastus_dev_ztcontroller_subnet_name" {
			value = module.ztademo_eastus_dev_ztcontroller_subnet.subnet_name
		}

# subnet14
module "ztademo_eastus_dev_edge_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet14
	rg_name = module.ztademo_eastus_dev_rg.rg_name
	subnet_name = "ztademo_eastus_dev_edge_subnet"
	vnet_name = module.ztademo_eastus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.204.64/27"]
}
		#subnet14
		output "ztademo_eastus_dev_edge_subnet_id" {
			value = module.ztademo_eastus_dev_edge_subnet.subnet_id
		}
		output "ztademo_eastus_dev_edge_subnet_name" {
			value = module.ztademo_eastus_dev_edge_subnet.subnet_name
		}

# subnet15
module "ztademo_eastus_azure_bastion_02_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet15
	rg_name = module.ztademo_eastus_dev_rg.rg_name
	subnet_name = "AzureBastionSubnet"
	vnet_name = module.ztademo_eastus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.204.96/27"]
}
		#subnet15
		output "ztademo_eastus_azure_bastion_02_subnet_id" {
			value = module.ztademo_eastus_azure_bastion_02_subnet.subnet_id
		}
		output "ztademo_eastus_azure_bastion_02_subnet_name" {
			value = module.ztademo_eastus_azure_bastion_02_subnet.subnet_name
		}

# subnet21
module "ztademo_eastus2_dev_02_prod_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet21
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	subnet_name = "ztademo_eastus2_dev_02_prod_subnet"
	vnet_name = module.ztademo_eastus2_dev_02_vnet.vnet_name
	subnet_prefixes = ["172.16.208.0/27"]
}
	#subnet21
		output "ztademo_eastus2_dev_02_prod_subnet_id" {
			value = module.ztademo_eastus2_dev_02_prod_subnet.subnet_id
		}
		output "ztademo_eastus2_dev_02_prod_subnet_name" {
			value = module.ztademo_eastus2_dev_02_prod_subnet.subnet_name
		}

# subnet22
module "ztademo_eastus2_dev_02_subnetgw_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet22
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	subnet_name = "GatewaySubnet"
	vnet_name = module.ztademo_eastus2_dev_02_vnet.vnet_name
	subnet_prefixes = ["172.16.208.248/29"]
}

		#subnet22
		output "ztademo_eastus2_dev_02_subnetgw_subnet_id" {
			value = module.ztademo_eastus2_dev_02_subnetgw_subnet.subnet_id
		}
		output "ztademo_eastus2_dev_02_subnetgw_subnet_name" {
			value = module.ztademo_eastus2_dev_02_subnetgw_subnet.subnet_name
		}

# subnet23
module "ztademo_eastus2_dev_02_ztcontroller_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet23
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	subnet_name = "ztademo_eastus2_dev_ztcontroller_subnet"
	vnet_name = module.ztademo_eastus2_dev_02_vnet.vnet_name
	subnet_prefixes = ["172.16.208.32/27"]
}

		#subnet23
		output "ztademo_eastus2_dev_02_ztcontroller_subnet_id" {
			value = module.ztademo_eastus2_dev_02_ztcontroller_subnet.subnet_id
		}
		output "ztademo_eastus2_dev_02_ztcontroller_subnet_name" {
			value = module.ztademo_eastus2_dev_02_ztcontroller_subnet.subnet_name
		}

# subnet24
module "ztademo_eastus2_dev_02_edge_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet24
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	subnet_name = "ztademo_eastus2_dev_edge_subnet"
	vnet_name = module.ztademo_eastus2_dev_02_vnet.vnet_name
	subnet_prefixes = ["172.16.208.64/27"]
}
		#subnet24
		output "ztademo_eastus2_dev_02_edge_subnet_id" {
			value = module.ztademo_eastus2_dev_02_edge_subnet.subnet_id
		}
		output "ztademo_eastus2_dev_02_edge_subnet_name" {
			value = module.ztademo_eastus2_dev_02_edge_subnet.subnet_name
		}

# subnet25
module "ztademo_eastus2_azure_bastion_03_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet25
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	subnet_name = "AzureBastionSubnet"
	vnet_name = module.ztademo_eastus2_dev_02_vnet.vnet_name
	subnet_prefixes = ["172.16.208.96/27"]
}
		#subnet25
		output "ztademo_eastus2_azure_bastion_03_subnet_id" {
			value = module.ztademo_eastus2_azure_bastion_03_subnet.subnet_id
		}
		output "ztademo_eastus2_azure_bastion_03_subnet_name" {
			value = module.ztademo_eastus2_azure_bastion_03_subnet.subnet_name
		}

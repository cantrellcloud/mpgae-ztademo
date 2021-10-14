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
	subnet_prefixes = ["172.16.202.0/27"]
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
	subnet_prefixes = ["172.16.202.248/29"]
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
	subnet_prefixes = ["172.16.202.32/27"]
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
	subnet_prefixes = ["172.16.202.64/27"]
}
		#subnet14
		output "ztademo_eastus_dev_edge_subnet_id" {
			value = module.ztademo_eastus_dev_edge_subnet.subnet_id
		}
		output "ztademo_eastus_dev_edge_subnet_name" {
			value = module.ztademo_eastus_dev_edge_subnet.subnet_name
		}

# subnet15
module "ztademo_eastus_azure_bastion_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet15
	rg_name = module.ztademo_eastus_dev_rg.rg_name
	subnet_name = "AzureBastionSubnet"
	vnet_name = module.ztademo_eastus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.202.96/27"]
}
		#subnet15
		output "ztademo_eastus_azure_bastion_subnet_id" {
			value = module.ztademo_eastus_azure_bastion_subnet.subnet_id
		}
		output "ztademo_eastus_azure_bastion_subnet_name" {
			value = module.ztademo_eastus_azure_bastion_subnet.subnet_name
		}


# subnet31
module "ztademo_westus2_dev_prod_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet31
	rg_name = module.ztademo_westus2_dev_rg.rg_name
	subnet_name = "ztademo_westus2_dev_prod_subnet"
	vnet_name = module.ztademo_westus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.0/27"]
}
	#subnet31
		output "ztademo_westus2_dev_prod_subnet_id" {
			value = module.ztademo_westus2_dev_prod_subnet.subnet_id
		}
		output "ztademo_westus2_dev_prod_subnet_name" {
			value = module.ztademo_westus2_dev_prod_subnet.subnet_name
		}

# subnet32
module "ztademo_westus2_dev_subnetgw_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet32
	rg_name = module.ztademo_westus2_dev_rg.rg_name
	subnet_name = "GatewaySubnet"
	vnet_name = module.ztademo_westus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.248/29"]
}

		#subnet32
		output "ztademo_westus2_dev_subnetgw_subnet_id" {
			value = module.ztademo_westus2_dev_subnetgw_subnet.subnet_id
		}
		output "ztademo_westus2_dev_subnetgw_subnet_name" {
			value = module.ztademo_westus2_dev_subnetgw_subnet.subnet_name
		}

# subnet33
module "ztademo_westus2_dev_ztcontroller_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet33
	rg_name = module.ztademo_westus2_dev_rg.rg_name
	subnet_name = "ztademo_westus2_dev_ztcontroller_subnet"
	vnet_name = module.ztademo_westus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.32/27"]
}

		#subnet33
		output "ztademo_westus2_dev_ztcontroller_subnet_id" {
			value = module.ztademo_westus2_dev_ztcontroller_subnet.subnet_id
		}
		output "ztademo_westus2_dev_ztcontroller_subnet_name" {
			value = module.ztademo_westus2_dev_ztcontroller_subnet.subnet_name
		}

# subnet34
module "ztademo_westus2_dev_edge_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet34
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	subnet_name = "ztademo_eastus2_dev_edge_subnet"
	vnet_name = module.ztademo_westus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.64/27"]
}
		#subnet34
		output "ztademo_westus2_dev_edge_subnet_id" {
			value = module.ztademo_westus2_dev_edge_subnet.subnet_id
		}
		output "ztademo_westus2_dev_edge_subnet_name" {
			value = module.ztademo_westus2_dev_edge_subnet.subnet_name
		}

# subnet35
module "ztademo_westus2_azure_bastion_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet35
	rg_name = module.ztademo_westus2_dev_rg.rg_name
	subnet_name = "AzureBastionSubnet"
	vnet_name = module.ztademo_westus2_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.96/27"]
}
		#subnet35
		output "ztademo_westus2_azure_bastion_subnet_id" {
			value = module.ztademo_westus2_azure_bastion_subnet.subnet_id
		}
		output "ztademo_westus2_azure_bastion_subnet_name" {
			value = module.ztademo_westus2_azure_bastion_subnet.subnet_name
		}

# subnet41
module "ztademo_westus_dev_prod_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet41
	rg_name = module.ztademo_westus_dev_rg.rg_name
	subnet_name = "ztademo_westus_dev_prod_subnet"
	vnet_name = module.ztademo_westus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.0/27"]
}
	#subnet41
		output "ztademo_westus_dev_prod_subnet_id" {
			value = module.ztademo_westus_dev_prod_subnet.subnet_id
		}
		output "ztademo_westus_dev_prod_subnet_name" {
			value = module.ztademo_westus_dev_prod_subnet.subnet_name
		}

# subnet42
module "ztademo_westus_dev_subnetgw_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet42
	rg_name = module.ztademo_westus_dev_rg.rg_name
	subnet_name = "GatewaySubnet"
	vnet_name = module.ztademo_westus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.248/29"]
}

		#subnet42
		output "ztademo_westus_dev_subnetgw_subnet_id" {
			value = module.ztademo_westus_dev_subnetgw_subnet.subnet_id
		}
		output "ztademo_westus_dev_subnetgw_subnet_name" {
			value = module.ztademo_westus_dev_subnetgw_subnet.subnet_name
		}

# subnet43
module "ztademo_westus_dev_ztcontroller_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet43
	rg_name = module.ztademo_westus_dev_rg.rg_name
	subnet_name = "ztademo_westus_dev_ztcontroller_subnet"
	vnet_name = module.ztademo_westus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.32/27"]
}

		#subnet43
		output "ztademo_westus_dev_ztcontroller_subnet_id" {
			value = module.ztademo_westus_dev_ztcontroller_subnet.subnet_id
		}
		output "ztademo_westus_dev_ztcontroller_subnet_name" {
			value = module.ztademo_westus_dev_ztcontroller_subnet.subnet_name
		}

# subnet44
module "ztademo_westus_dev_edge_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet44
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	subnet_name = "ztademo_eastus2_dev_edge_subnet"
	vnet_name = module.ztademo_westus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.64/27"]
}
		#subnet44
		output "ztademo_westus_dev_edge_subnet_id" {
			value = module.ztademo_westus_dev_edge_subnet.subnet_id
		}
		output "ztademo_westus_dev_edge_subnet_name" {
			value = module.ztademo_westus_dev_edge_subnet.subnet_name
		}

# subnet45
module "ztademo_westus_azure_bastion_subnet" {
	source = "github.com/cantrellcloud/tfAzureModules/subnet"
	#to_provision = local.provision_subnet45
	rg_name = module.ztademo_westus_dev_rg.rg_name
	subnet_name = "AzureBastionSubnet"
	vnet_name = module.ztademo_westus_dev_vnet.vnet_name
	subnet_prefixes = ["172.16.206.96/27"]
}
		#subnet45
		output "ztademo_westus_azure_bastion_subnet_id" {
			value = module.ztademo_westus_azure_bastion_subnet.subnet_id
		}
		output "ztademo_westus_azure_bastion_subnet_name" {
			value = module.ztademo_westus_azure_bastion_subnet.subnet_name
		}

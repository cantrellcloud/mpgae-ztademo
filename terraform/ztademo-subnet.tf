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

# CCES - Local Network Gateways

resource "azurerm_local_network_gateway" "itproductioneastuscotpa-localgw" {
	name = "it_production_eastus-cotpa-localgw"
	location = azurerm_resource_group.itproductioneastus-rg.location
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	tags = {
		ManagementGroup = "IT"
		Location = "EastUS"
		Environment = "Production"
		ManagedBy = "Terraform"
	}
	
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
		"172.16.254.0/24",
		"172.16.255.0/24",
		"172.16.70.0/24",
		"172.16.71.0/24"
	]
	
	gateway_address = "144.129.196.130"
}


#================================================================================
#
# LOCAL NETWORK GATEWAYS

# localgw01
module "kea_dcedemo_cces_cotpa_localgw" {
	source = "github.com/cantrellcloud/tfAzureModules/localgw"
	#to_provision = local.provision_localgw01
	rg_location = module.ztademo_eastus2_dev_rg.rg_location
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
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

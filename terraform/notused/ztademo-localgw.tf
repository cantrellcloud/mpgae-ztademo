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
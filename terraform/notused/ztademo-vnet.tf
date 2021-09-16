#================================================================================
#
# 
# Virtual Networks
#
resource "azurerm_virtual_network" "itproductioneastus-vnet" {
	name = "it_production_eastus-vnet"
	location = azurerm_resource_group.itproductioneastus-rg.location
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	tags = {
		ManagementGroup = "IT"
		Location = "EastUS"
		Environment = "Production"
		ManagedBy = "Terraform"
	}
	dns_servers = ["172.16.58.71", "172.16.58.72"]

	address_space = [
		"172.16.56.0/26",
		"172.16.56.64/26",
		"172.16.56.128/26",
		"172.16.56.192/26",
		"172.16.57.0/26",
		"172.16.57.64/26",
		"172.16.57.128/26",
		"172.16.57.192/26",
		"172.16.58.64/26",
		"172.16.58.128/26",
		"172.16.58.192/26",
		"172.16.59.0/26",
		"172.16.59.64/26",
		"172.16.59.128/26",
		"172.16.59.192/27",
		"172.16.59.224/28",
		"172.16.59.240/29",
		"172.16.59.248/29"
	]
}

resource "azurerm_virtual_network" "itproductioneastus2-vnet" {
	name = "it_production_eastus2-vnet"
	location = "eastus2"
	resource_group_name = "it_production_eastus2-group"
	tags = {
		ManagementGroup = "IT"
		Location = "EastUS2"
		Environment = "Production"
		ManagedBy = "Terraform"
	}
	dns_servers = ["172.16.58.71", "172.16.58.72"]

	address_space = [
		"172.16.48.0/22",
		"172.16.52.128/25",
		"172.16.53.0/25",
		"172.16.53.128/25",
		"172.16.54.0/25",
		"172.16.54.128/25",
		"172.16.55.0/25",
		"172.16.55.128/26",
		"172.16.55.192/27",
		"172.16.55.224/28",
		"172.16.55.240/29",
		"172.16.55.248/29"
	]
}
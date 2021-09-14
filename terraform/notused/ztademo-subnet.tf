# CCES - Network Subnets

resource "azurerm_subnet" "coazrpubeastus-subnet" {
	name = "coazr_pub-eastus"
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	virtual_network_name = azurerm_virtual_network.itproductioneastus-vnet.name
	
	address_prefixes = [
		"172.16.56.64/26"
	]
}

resource "azurerm_subnet" "coazradeastus-subnet" {
	name = "coazr_ad-eastus"
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	virtual_network_name = azurerm_virtual_network.itproductioneastus-vnet.name
	
	address_prefixes = [
		"172.16.58.64/26"
	]
}

resource "azurerm_subnet" "coazrwebeastus-subnet" {
	name = "coazr_web-eastus"
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	virtual_network_name = azurerm_virtual_network.itproductioneastus-vnet.name
	
	address_prefixes = [
		"172.16.58.128/26"
	]
}

resource "azurerm_subnet" "coazrappeastus-subnet" {
	name = "coazr_app-eastus"
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	virtual_network_name = azurerm_virtual_network.itproductioneastus-vnet.name
	
	address_prefixes = [
		"172.16.58.192/26"
	]
}

resource "azurerm_subnet" "GatewaySubneteastus-subnet" {
	name = "GatewaySubnet"
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	virtual_network_name = azurerm_virtual_network.itproductioneastus-vnet.name
	
	address_prefixes = [
		"172.16.59.248/29"
	]
}

resource "azurerm_subnet" "coazrpubeastus2-subnet" {
	name = "coazr_pub-eastus2"
	resource_group_name = azurerm_resource_group.itproductioneastus2-rg.name
	virtual_network_name = azurerm_virtual_network.itproductioneastus2-vnet.name
	
	address_prefixes = [
		"172.16.48.128/25"
	]
}

resource "azurerm_subnet" "coazradeastus2-subnet" {
	name = "coazr_ad-eastus2"
	resource_group_name = azurerm_resource_group.itproductioneastus2-rg.name
	virtual_network_name = azurerm_virtual_network.itproductioneastus2-vnet.name
	
	address_prefixes = [
		"172.16.52.128/25"
	]
}

resource "azurerm_subnet" "GatewaySubneteastus2-subnet" {
	name = "GatewaySubnet"
	resource_group_name = azurerm_resource_group.itproductioneastus2-rg.name
	virtual_network_name = azurerm_virtual_network.itproductioneastus2-vnet.name
	
	address_prefixes = [
		"172.16.55.248/29"
	]
}
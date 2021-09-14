# CCES - Public IPs

resource "azurerm_public_ip" "coazrunifi01-ip" {
	name = "coazr-unifi01-ip"
	location = azurerm_resource_group.itproductioneastus-rg.location
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	tags = {
		ManagementGroup = "IT"
		Location = "EastUS"
		Environment = "Production"
		ManagedBy = "Terraform"
	}
	
	allocation_method = "Static"
	domain_name_label = "coazr-unifi01"
	idle_timeout_in_minutes = 4
	ip_version = "IPv4"
	public_ip_prefix_id = null
	reverse_fqdn = ""
	sku = "Basic"
}

resource "azurerm_public_ip" "itproductioneastus-ip" {
	name = "it_production_eastus-ip"
	location = azurerm_resource_group.itproductioneastus-rg.location
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	tags = {
		ManagementGroup = "IT"
		Location = "EastUS"
		Environment = "Production"
		ManagedBy = "Terraform"
	}

	allocation_method = "Dynamic"
	domain_name_label = null
	idle_timeout_in_minutes = 4
	ip_version = "IPv4"
	public_ip_prefix_id = null
	reverse_fqdn = null
	sku = "Basic"
}
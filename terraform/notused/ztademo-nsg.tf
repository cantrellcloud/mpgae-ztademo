# CCES - Network Security Groups

resource "azurerm_network_security_group" "itproductioneastusunifi-nsg" {
	name = "it_production_eastus-unifi-nsg"
	location = azurerm_resource_group.itproductioneastus-rg.location
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	tags = {
		ManagementGroup = "IT"
		Location = "EastUS"
		Environment = "Production"
		ManagedBy = "Terraform"
	}
	
	security_rule {
		access = "Allow"
		description = ""
		destination_address_prefix = "*"
		destination_address_prefixes = []
		destination_application_security_group_ids = []
		destination_port_range = "*"
		destination_port_ranges = []
		direction = "Inbound"
		name = "Allow_ICMP"
		priority = 100
		protocol = "ICMP"
		source_address_prefix = "*"
		#source_address_prefixes = [
		#	"7.225.123.7",
		#	"100.80.123.8",
		#	"47.206.14.65",
		#	"97.76.159.66"
		#]
		source_application_security_group_ids = []
		source_port_range = "*"
		source_port_ranges = []
	}
	
	security_rule {
		access = "Allow"
		description = "UniFi mobile speed test"
		destination_address_prefix = "*"
		destination_address_prefixes = []
		destination_application_security_group_ids = []
		destination_port_range = "6789"
		destination_port_ranges = []
		direction = "Inbound"
		name = "Port_6789"
		priority = 106
		protocol = "TCP"
		source_address_prefix = "*"
		#source_address_prefixes = [
		#	"7.225.123.7",
		#	"100.80.123.8",
		#	"47.206.14.65",
		#	"97.76.159.66"
		#]
		source_application_security_group_ids = []
		source_port_range = "*"
		source_port_ranges = []
	}
	
	security_rule {
		access = "Allow"
		description = "Unifi HTTP portal redirection"
		destination_address_prefix = "*"
		destination_address_prefixes = []
		destination_application_security_group_ids = []
		destination_port_range = "8880"
		destination_port_ranges = []
		direction = "Inbound"
		name = "Port_8880"
		priority = 104
		protocol = "TCP"
		source_address_prefix = "*"
		#source_address_prefixes = [
		#	"7.225.123.7",
		#	"100.80.123.8",
		#	"47.206.14.65",
		#	"97.76.159.66"
		#]
		source_application_security_group_ids = []
		source_port_range = "*"
		source_port_ranges = []
	}
	
	security_rule {
		access = "Allow"
		description = "Unifi HTTPS portal redirection"
		destination_address_prefix = "*"
		destination_address_prefixes = []
		destination_application_security_group_ids = []
		destination_port_range = "8843"
		destination_port_ranges = []
		direction = "Inbound"
		name = "Port_8843"
		priority = 105
		protocol = "TCP"
		source_address_prefix = "*"
		#source_address_prefixes = [
		#	"7.225.123.7",
		#	"100.80.123.8",
		#	"47.206.14.65",
		#	"97.76.159.66"
		#]
		source_application_security_group_ids = []
		source_port_range = "*"
		source_port_ranges = []
	}
	
	security_rule {
		access = "Allow"
		description = "Unifi STUN"
		destination_address_prefix = "*"
		destination_address_prefixes = []
		destination_application_security_group_ids = []
		destination_port_range = "3478"
		destination_port_ranges = []
		direction = "Inbound"
		name = "Port_3478"
		priority = 101
		protocol = "UDP"
		source_address_prefix = "*"
		#source_address_prefixes = [
		#	"7.225.123.7",
		#	"100.80.123.8",
		#	"47.206.14.65",
		#	"97.76.159.66"
		#]
		source_application_security_group_ids = []
		source_port_range = "*"
		source_port_ranges = []
	}
	
	security_rule {
		access = "Allow"
		description = "Unifi controller GUI/API as seen in a web browser"
		destination_address_prefix = "*"
		destination_address_prefixes = []
		destination_application_security_group_ids = []
		destination_port_range = "8443"
		destination_port_ranges = []
		direction = "Inbound"
		name = "Port_8443"
		priority = 103
		protocol = "TCP"
		source_address_prefix = "*"
		#source_address_prefixes = [
		#	"7.225.123.7",
		#	"100.80.123.8",
		#	"47.206.14.65",
		#	"97.76.159.66"
		#]
		source_application_security_group_ids = []
		source_port_range = "*"
		source_port_ranges = []
	}
	
	security_rule {
		access = "Allow"
		description = "Unifi device and controller communication"
		destination_address_prefix = "*"
		destination_address_prefixes = []
		destination_application_security_group_ids = []
		destination_port_range = "8080"
		destination_port_ranges = []
		direction = "Inbound"
		name = "Port_8080"
		priority = 102
		protocol = "TCP"
		source_address_prefix = "*"
		#source_address_prefixes = [
		#	"7.225.123.7",
		#	"100.80.123.8",
		#	"47.206.14.65",
		#	"97.76.159.66"
		#]
		source_application_security_group_ids = []
		source_port_range = "*"
		source_port_ranges = []
	}
}

resource "azurerm_network_security_group" "itproductioneastusdc-nsg" {
	name = "it_production_eastus-dc-nsg"
	location = azurerm_resource_group.itproductioneastus-rg.location
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	tags = {
		ManagementGroup = "IT"
		Location = "EastUS"
		Environment = "Production"
		ManagedBy = "Terraform"
	}
}

resource "azurerm_network_security_group" "itproductioneastusca-nsg" {
	name = "it_production_eastus-ca-nsg"
	location = azurerm_resource_group.itproductioneastus-rg.location
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	tags = {
		ManagementGroup = "IT"
		Location = "EastUS"
		Environment = "Production"
		ManagedBy = "Terraform"
	}
}

resource "azurerm_network_security_group" "itproductioneastuspubdc-nsg" {
	name = "it_production_eastus-pubdc-nsg"
	location = azurerm_resource_group.itproductioneastus-rg.location
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	tags = {
		ManagementGroup = "IT"
		Location = "EastUS"
		Environment = "Production"
		ManagedBy = "Terraform"
	}

	security_rule {
		access = "Allow"
		description = ""
		destination_address_prefix = "*"
		destination_address_prefixes = []
		destination_application_security_group_ids = []
		destination_port_range = "*"
		destination_port_ranges = []
		direction = "Inbound"
		name = "Allow_Domain_Subnet"
		priority = 1000
		protocol = "*"
		source_address_prefix = ""
		source_address_prefixes = [
			"172.16.1.0/24",
			"172.16.56.64/26"
		]
		source_application_security_group_ids = []
		source_port_range = "*"
		source_port_ranges = []
	}
	
	security_rule {
		access = "Allow"
		description = ""
		destination_address_prefix = "*"
		destination_address_prefixes = []
		destination_application_security_group_ids = []
		destination_port_range = "*"
		destination_port_ranges = []
		direction = "Inbound"
		name = "Port_ICMP"
		priority = 4095
		protocol = "ICMP"
		source_address_prefix = ""
		source_address_prefixes = [
			"172.16.14.0/24",
			"172.16.8.0/24"
		]
		source_application_security_group_ids = []
		source_port_range = "*"
		source_port_ranges = []
	}
	
	security_rule {
		access = "Allow"
		description = ""
		destination_address_prefix = "*"
		destination_address_prefixes = []
		destination_application_security_group_ids = []
		destination_port_range = "3389"
		destination_port_ranges = []
		direction = "Inbound"
		name = "Port_3389"
		priority = 101
		protocol = "TCP"
		source_address_prefix = ""
		source_address_prefixes = [
			"172.16.14.0/24",
			"172.16.8.0/24"
		]
		source_application_security_group_ids = []
		source_port_range = "*"
		source_port_ranges = []
	}
	
	security_rule {
		access = "Allow"
		description = ""
		destination_address_prefix = "*"
		destination_address_prefixes = []
		destination_application_security_group_ids = []
		destination_port_range = "445"
		destination_port_ranges = []
		direction = "Inbound"
		name = "Port_445"
		priority = 103
		protocol = "TCP"
		source_address_prefix = ""
		source_address_prefixes = [
			"172.16.14.0/24",
			"172.16.8.0/24"
		]
		source_application_security_group_ids = []
		source_port_range = "*"
		source_port_ranges = []
	}
	
	security_rule {
		access = "Allow"
		description = ""
		destination_address_prefix = "*"
		destination_address_prefixes = []
		destination_application_security_group_ids = []
		destination_port_range = "53"
		destination_port_ranges = []
		direction = "Inbound"
		name = "Port_53"
		priority = 100
		protocol = "*"
		source_address_prefix = "*"
		source_address_prefixes = []
		source_application_security_group_ids = []
		source_port_range = "*"
		source_port_ranges = []
	}
	
	security_rule {
		access = "Deny"
		description = ""
		destination_address_prefix = "*"
		destination_address_prefixes = []
		destination_application_security_group_ids = []
		destination_port_range = "*"
		destination_port_ranges = []
		direction = "Inbound"
		name = "Deny_All"
		priority = 4096
		protocol = "*"
		source_address_prefix = "*"
		source_address_prefixes = []
		source_application_security_group_ids = []
		source_port_range = "*"
		source_port_ranges = []
	}
}
#================================================================================
#
# ZTADEV
# Main, Resource Groups, and Storage Accounts
#
#================================================================================
#
# DEFINITIONS

terraform {
	required_providers {
		azurerm = {
			source = "hashicorp/azurerm"
			version = ">= 2.76.0"
		}
	}
	backend "azurerm" {
    resource_group_name  = "mpgae_eastus2_prod_rg"
    storage_account_name = "mpgaeeastus2prodgeneral"
    container_name       = "tfstates"
    key                  = "ztadev.dev.tfstate"
	tenant_id            = "5889ef41-a0dc-46e1-9f62-a1ecdcc5e8c1"
	subscription_id      = "919946d0-8cae-4e2d-9430-e33602bddf9c"
  }
}

#================================================================================
#
# PROVIDERS

provider "azurerm" {
	features {}

	client_id 		= "5a62ed24-8d52-4895-a5a9-5e3b953447d6"
	client_secret 	= "rEZETjwgJjAhv735%FNtL!8!4"
	tenant_id 		= "bd2bd7e2-575d-41db-85f6-b4343ae968ac"
	subscription_id = "e881dd00-1c8f-4a37-a621-1172a91700b5"
}

#================================================================================
#
# LOCALS

locals {
	localgw01_gateway_address = "144.129.196.130" # to-ztadev_cotpa_localgw
}

#================================================================================
#
# RESOURCE GROUPS

# rg01
module "ztadev_eastus2_dev_rg" {
    source = "github.com/cantrellcloud/tfaz-rg/"
	rg_name = "ztadev_eastus2_dev_rg"
	rg_location = "eastus2"
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# rg01_outputs
	output "ztadev_eastus2_dev_rg_name" {
		value = module.ztadev_eastus2_dev_rg.rg_name
	}
	output "ztadev_eastus2_dev_rg_location" {
		value = module.ztadev_eastus2_dev_rg.rg_location
	}

# rg02
module "ztadev_eastus2_dev_appsvcplan_rg" {
    source = "github.com/cantrellcloud/tfaz-rg/"
	rg_name = "ztadev_eastus2_dev_appsvcplan_rg"
	rg_location = "eastus2"
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# rg02_outputs
	output "ztadev_eastus2_dev_appsvcplan_rg_name" {
		value = module.ztadev_eastus2_dev_appsvcplan_rg.rg_name
	}
	output "ztadev_eastus2_dev_appsvcplan_rg_location" {
		value = module.ztadev_eastus2_dev_appsvcplan_rg.rg_location
	}

# rg03
module "ztadev_eastus_dev_rg" {
    source = "github.com/cantrellcloud/tfaz-rg/"
	rg_name = "ztadev_eastus_dev_rg"
	rg_location = "eastus"
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# rg03_outputs
	output "ztadev_eastus_dev_rg_name" {
		value = module.ztadev_eastus_dev_rg.rg_name
	}
	output "ztadev_eastus_dev_rg_location" {
		value = module.ztadev_eastus_dev_rg.rg_location
	}

# rg04
module "ztadev_westus_dev_rg" {
    source = "github.com/cantrellcloud/tfaz-rg/"
	rg_name = "ztadev_westus_dev_rg"
	rg_location = "westus"
	rg_tags = {
		"ManagementGroup" = "MPG A&E westus2",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# rg04_outputs
	output "ztadev_westus_dev_rg_name" {
		value = module.ztadev_westus_dev_rg.rg_name
	}
	output "ztadev_westus_dev_rg_location" {
		value = module.ztadev_westus_dev_rg.rg_location
	}

# rg05
module "ztadev_westus2_dev_rg" {
    source = "github.com/cantrellcloud/tfaz-rg/"
	rg_name = "ztadev_westus2_dev_rg"
	rg_location = "westus2"
	rg_tags = {
		"ManagementGroup" = "MPG A&E westus22",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# rg05_outputs
	output "ztadev_westus2_dev_rg_name" {
		value = module.ztadev_westus2_dev_rg.rg_name
	}
	output "ztadev_westus2_dev_rg_location" {
		value = module.ztadev_westus2_dev_rg.rg_location
	}

#================================================================================
#
# STORAGE ACCOUNTS

# storage01
module "ztadev_eastus2_dev_general_storage" {
	source = "github.com/cantrellcloud/tfaz-storage"
	#to_provision = local.provision_storage01
	rg_location = module.ztadev_eastus2_dev_rg.rg_location
	rg_name = module.ztadev_eastus2_dev_rg.rg_name
	storage_name = "ztadeveastus2devgeneral"
	account_tier = "Standard"
	account_replication_type = "GRS"
	enable_https_traffic_only = true
	allow_blob_public_access = true
	access_tier = "hot"
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# storage01_outputs
	output "ztadev_eastus2_dev_general_storage_id" {
		value = module.ztadev_eastus2_dev_general_storage.storage_id
	}
	output "ztadev_eastus2_dev_general_storage_name" {
		value = module.ztadev_eastus2_dev_general_storage.storage_name
	}
	output "ztadev_eastus2_dev_general_storage_pri_location" {
		value = module.ztadev_eastus2_dev_general_storage.storage_pri_location
	}
	output "ztadev_eastus2_dev_general_storage_sec_location" {
		value = module.ztadev_eastus2_dev_general_storage.storage_sec_location
	}
	output "ztadev_eastus2_dev_general_storage_pri_blob_endpoint" {
		value = module.ztadev_eastus2_dev_general_storage.storage_pri_blob_endpoint
	}
	output "ztadev_eastus2_dev_general_storage_sec_blob_endpoint" {
		value = module.ztadev_eastus2_dev_general_storage.storage_sec_blob_endpoint
	}
	output "ztadev_eastus2_dev_general_storage_pri_access_key" {
		value = module.ztadev_eastus2_dev_general_storage.storage_pri_access_key
		sensitive = true
	}
	output "ztadev_eastus2_dev_general_storage_pri_connect_string" {
		value = module.ztadev_eastus2_dev_general_storage.storage_pri_connect_string
		sensitive = true
	}

# storage02
module "ztadev_eastus_dev_logs_storage" {
	source = "github.com/cantrellcloud/tfaz-storage"
	#to_provision = local.provision_storage01
	rg_location = module.ztadev_eastus_dev_rg.rg_location
	rg_name = module.ztadev_eastus_dev_rg.rg_name
	storage_name = "ztadeveastusdevlogs"
	account_tier = "Standard"
	account_replication_type = "GRS"
	enable_https_traffic_only = true
	allow_blob_public_access = true
	access_tier = "hot"
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# storage02_outputs
	output "ztadev_eastus_dev_logs_storage_id" {
		value = module.ztadev_eastus_dev_logs_storage.storage_id
	}
	output "ztadev_eastus_dev_logs_storage_name" {
		value = module.ztadev_eastus_dev_logs_storage.storage_name
	}
	output "ztadev_eastus_dev_logs_storage_pri_location" {
		value = module.ztadev_eastus_dev_logs_storage.storage_pri_location
	}
	output "ztadev_eastus_dev_logs_storage_sec_location" {
		value = module.ztadev_eastus_dev_logs_storage.storage_sec_location
	}
	output "ztadev_eastus_dev_logs_storage_pri_blob_endpoint" {
		value = module.ztadev_eastus_dev_logs_storage.storage_pri_blob_endpoint
	}
	output "ztadev_eastus_dev_logs_storage_sec_blob_endpoint" {
		value = module.ztadev_eastus_dev_logs_storage.storage_sec_blob_endpoint
	}
	output "ztadev_eastus_dev_logs_storage_pri_access_key" {
		value = module.ztadev_eastus_dev_logs_storage.storage_pri_access_key
		sensitive = true
	}
	output "ztadev_eastus_dev_logs_storage_pri_connect_string" {
		value = module.ztadev_eastus_dev_logs_storage.storage_pri_connect_string
		sensitive = true
	}

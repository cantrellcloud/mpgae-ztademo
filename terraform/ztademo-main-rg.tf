#================================================================================
#
# ZTADEMO
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
    resource_group_name  = "ae700rd_eastus2_rg"
    storage_account_name = "ae700rdeastus2general"
    container_name       = "tfstates"
    key                  = "ztademo.tfstate"
  }
}

#================================================================================
#
# PROVIDERS

provider "azurerm" {
	features {}
}

#================================================================================
#
# LOCALS

locals {
	localgw01_gateway_address = "144.129.196.130" # to-ztademo_cces_cotpa_localgw
}

#================================================================================
#
# RESOURCE GROUPS

# rg01
module "ztademo_eastus2_dev_rg" {
    source = "github.com/cantrellcloud/tfAzureModules/rg/"
	rg_name = "ztademo_eastus2_dev_rg"
	rg_location = "eastus2"
	rg_tags = {
		"ManagementGroup" = "A&E 700 R&D",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# rg01_outputs
	output "ztademo_eastus2_dev_rg_name" {
		value = module.ztademo_eastus2_dev_rg.rg_name
	}
	output "ztademo_eastus2_dev_rg_location" {
		value = module.ztademo_eastus2_dev_rg.rg_location
	}

# rg02
module "ztademo_eastus2_dev_appsvcplan_rg" {
    source = "github.com/cantrellcloud/tfAzureModules/rg/"
	rg_name = "ztademo_eastus2_dev_appsvcplan_rg"
	rg_location = "eastus2"
	rg_tags = {
		"ManagementGroup" = "A&E 700 R&D",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# rg02_outputs
	output "ztademo_eastus2_dev_appsvcplan_rg_name" {
		value = module.ztademo_eastus2_dev_appsvcplan_rg.rg_name
	}
	output "ztademo_eastus2_dev_appsvcplan_rg_location" {
		value = module.ztademo_eastus2_dev_appsvcplan_rg.rg_location
	}

# rg03
module "ztademo_eastus_dev_rg" {
    source = "github.com/cantrellcloud/tfAzureModules/rg/"
	rg_name = "ztademo_eastus_dev_rg"
	rg_location = "eastus"
	rg_tags = {
		"ManagementGroup" = "A&E 700 R&D",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# rg02_outputs
	output "ztademo_eastus_dev_rg_name" {
		value = module.ztademo_eastus_dev_rg.rg_name
	}
	output "ztademo_eastus_dev_rg_location" {
		value = module.ztademo_eastus_dev_rg.rg_location
	}

#================================================================================
#
# STORAGE ACCOUNTS

# storage01
module "ztademo_eastus2_general_storage" {
	source = "github.com/cantrellcloud/tfAzureModules/storage"
	#to_provision = local.provision_storage01
	rg_location = module.ztademo_eastus2_dev_rg.rg_location
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	storage_name = "ztademoeastus2general"
	account_tier = "Standard"
	account_replication_type = "GRS"
	enable_https_traffic_only = true
	allow_blob_public_access = true
	rg_tags = {
		"ManagementGroup" = "A&E 700 R&D",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# storage01_outputs
	output "ztademo_eastus2_general_storage_id" {
		value = module.ztademo_eastus2_general_storage.storage_id
	}
	output "ztademo_eastus2_general_storage_name" {
		value = module.ztademo_eastus2_general_storage.storage_name
	}
	output "ztademo_eastus2_general_storage_pri_location" {
		value = module.ztademo_eastus2_general_storage.storage_pri_location
	}
	output "ztademo_eastus2_general_storage_sec_location" {
		value = module.ztademo_eastus2_general_storage.storage_sec_location
	}
	output "ztademo_eastus2_general_storage_pri_blob_endpoint" {
		value = module.ztademo_eastus2_general_storage.storage_pri_blob_endpoint
	}
	output "ztademo_eastus2_general_storage_sec_blob_endpoint" {
		value = module.ztademo_eastus2_general_storage.storage_sec_blob_endpoint
	}
	output "ztademo_eastus2_general_storage_pri_access_key" {
		value = module.ztademo_eastus2_general_storage.storage_pri_access_key
		sensitive = true
	}
	output "ztademo_eastus2_general_storage_pri_connect_string" {
		value = module.ztademo_eastus2_general_storage.storage_pri_connect_string
		sensitive = true
	}

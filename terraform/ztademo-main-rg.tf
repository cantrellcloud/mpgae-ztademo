#================================================================================
#
# ZTADEMO
# Main
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
    resource_group_name  = "ae700rdeastus2_rg"
    storage_account_name = "ae700rdeastus2general"
    container_name       = "tfstates"
    key                  = "ztademo.tfstate"
  }
}

#================================================================================
#
# PROVIDERS

provider "azurerm" {
	/*client_id 		= var.azure_app_id
	client_secret 	= var.azure_password
	tenant_id 		= var.azure_tenant_id
	subscription_id = var.azure_subscription_id
	environment 	= "public" */
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
module "ae700rd_ztademo_eastus2_rg" {
    source = "github.com/cantrellcloud/tfAzureModules/rg/"
	rg_name = "ae700rd_ztademo_eastus2_rg"
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
	output "ae700rd_ztademo_eastus2_rg_name" {
		value = module.ae700rd_ztademo_eastus2_rg.rg_name
	}
	output "ae700rd_ztademo_eastus2_rg_location" {
		value = module.ae700rd_ztademo_eastus2_rg.rg_location
	}

# rg02
module "ae700rd_ztademo_eastus2_appsvcplan_rg" {
    source = "github.com/cantrellcloud/tfAzureModules/rg/"
	rg_name = "ae700rd_ztademo_eastus2_appsvcplan_rg"
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
	output "ae700rd_ztademo_eastus2_appsvcplan_rg_name" {
		value = module.ae700rd_ztademo_eastus2_appsvcplan_rg.rg_name
	}
	output "ae700rd_ztademo_eastus2_appsvcplan_rg_location" {
		value = module.ae700rd_ztademo_eastus2_appsvcplan_rg.rg_location
	}

#================================================================================
#
# STORAGE ACCOUNTS

# storage01
module "ae700rd_ztademo_eastus2_general_storage" {
	source = "github.com/cantrellcloud/tfAzureModules/storage"
	#to_provision = local.provision_storage01
	rg_location = module.ae700rd_ztademo_eastus2_rg.rg_location
	rg_name = module.ae700rd_ztademo_eastus2_rg.rg_name
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
	output "ae700rd_ztademo_eastus2_general_storage_id" {
		value = module.ae700rd_ztademo_eastus2_general_storage.storage_id
	}
	output "ae700rd_ztademo_eastus2_general_storage_name" {
		value = module.ae700rd_ztademo_eastus2_general_storage.storage_name
	}
	output "ae700rd_ztademo_eastus2_general_storage_pri_location" {
		value = module.ae700rd_ztademo_eastus2_general_storage.storage_pri_location
	}
	output "ae700rd_ztademo_eastus2_general_storage_sec_location" {
		value = module.ae700rd_ztademo_eastus2_general_storage.storage_sec_location
	}
	output "ae700rd_ztademo_eastus2_general_storage_pri_blob_endpoint" {
		value = module.ae700rd_ztademo_eastus2_general_storage.storage_pri_blob_endpoint
	}
	output "ae700rd_ztademo_eastus2_general_storage_sec_blob_endpoint" {
		value = module.ae700rd_ztademo_eastus2_general_storage.storage_sec_blob_endpoint
	}
	output "ae700rd_ztademo_eastus2_general_storage_pri_access_key" {
		value = module.ae700rd_ztademo_eastus2_general_storage.storage_pri_access_key
		sensitive = true
	}
	output "ae700rd_ztademo_eastus2_general_storage_pri_connect_string" {
		value = module.ae700rd_ztademo_eastus2_general_storage.storage_pri_connect_string
		sensitive = true
	}
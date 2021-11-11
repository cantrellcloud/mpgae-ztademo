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
    resource_group_name  = "mpgae_eastus2_prod_rg"
    storage_account_name = "mpgaeeastus2prodgeneral"
    container_name       = "tfstates"
    key                  = "ztademo.tfstate"
	tenant_id            = "5889ef41-a0dc-46e1-9f62-a1ecdcc5e8c1"
	subscription_id      = "919946d0-8cae-4e2d-9430-e33602bddf9c"
  }
}

#================================================================================
#
# PROVIDERS

provider "azurerm" {
	features {}

/*	client_id 		= "0ac0af1f-f1b1-4197-86ae-a62aa1087bc9"
	client_secret 	= "52221cd7-890f-43db-974c-f3ec0462f3b4"
	tenant_id 		= "5889ef41-a0dc-46e1-9f62-a1ecdcc5e8c1"
	subscription_id = "919946d0-8cae-4e2d-9430-e33602bddf9c"
*/
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
    source = "github.com/cantrellcloud/tfaz-rg/"
	rg_name = "ztademo_eastus2_dev_rg"
	rg_location = "eastus2"
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
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
    source = "github.com/cantrellcloud/tfaz-rg/"
	rg_name = "ztademo_eastus2_dev_appsvcplan_rg"
	rg_location = "eastus2"
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
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
    source = "github.com/cantrellcloud/tfaz-rg/"
	rg_name = "ztademo_eastus_dev_rg"
	rg_location = "eastus"
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# rg03_outputs
	output "ztademo_eastus_dev_rg_name" {
		value = module.ztademo_eastus_dev_rg.rg_name
	}
	output "ztademo_eastus_dev_rg_location" {
		value = module.ztademo_eastus_dev_rg.rg_location
	}

# rg04
module "ztademo_westus_dev_rg" {
    source = "github.com/cantrellcloud/tfaz-rg/"
	rg_name = "ztademo_westus_dev_rg"
	rg_location = "westus"
	rg_tags = {
		"ManagementGroup" = "MPG A&E westus2",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# rg04_outputs
	output "ztademo_westus_dev_rg_name" {
		value = module.ztademo_westus_dev_rg.rg_name
	}
	output "ztademo_westus_dev_rg_location" {
		value = module.ztademo_westus_dev_rg.rg_location
	}

# rg05
module "ztademo_westus2_dev_rg" {
    source = "github.com/cantrellcloud/tfaz-rg/"
	rg_name = "ztademo_westus2_dev_rg"
	rg_location = "westus2"
	rg_tags = {
		"ManagementGroup" = "MPG A&E westus22",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# rg05_outputs
	output "ztademo_westus2_dev_rg_name" {
		value = module.ztademo_westus2_dev_rg.rg_name
	}
	output "ztademo_westus2_dev_rg_location" {
		value = module.ztademo_westus2_dev_rg.rg_location
	}

#================================================================================
#
# STORAGE ACCOUNTS

# storage01
module "ztademo_eastus2_dev_general_storage" {
	source = "github.com/cantrellcloud/tfaz-storage"
	#to_provision = local.provision_storage01
	rg_location = module.ztademo_eastus2_dev_rg.rg_location
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	storage_name = "ztademoeastus2devgeneral"
	account_tier = "Standard"
	account_replication_type = "GRS"
	enable_https_traffic_only = true
	allow_blob_public_access = true
	access_tier = "hot"
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# storage01_outputs
	output "ztademo_eastus2_dev_general_storage_id" {
		value = module.ztademo_eastus2_dev_general_storage.storage_id
	}
	output "ztademo_eastus2_dev_general_storage_name" {
		value = module.ztademo_eastus2_dev_general_storage.storage_name
	}
	output "ztademo_eastus2_dev_general_storage_pri_location" {
		value = module.ztademo_eastus2_dev_general_storage.storage_pri_location
	}
	output "ztademo_eastus2_dev_general_storage_sec_location" {
		value = module.ztademo_eastus2_dev_general_storage.storage_sec_location
	}
	output "ztademo_eastus2_dev_general_storage_pri_blob_endpoint" {
		value = module.ztademo_eastus2_dev_general_storage.storage_pri_blob_endpoint
	}
	output "ztademo_eastus2_dev_general_storage_sec_blob_endpoint" {
		value = module.ztademo_eastus2_dev_general_storage.storage_sec_blob_endpoint
	}
	output "ztademo_eastus2_dev_general_storage_pri_access_key" {
		value = module.ztademo_eastus2_dev_general_storage.storage_pri_access_key
		sensitive = true
	}
	output "ztademo_eastus2_dev_general_storage_pri_connect_string" {
		value = module.ztademo_eastus2_dev_general_storage.storage_pri_connect_string
		sensitive = true
	}

# storage02
module "ztademo_eastus_dev_logs_storage" {
	source = "github.com/cantrellcloud/tfaz-storage"
	#to_provision = local.provision_storage01
	rg_location = module.ztademo_eastus_dev_rg.rg_location
	rg_name = module.ztademo_eastus_dev_rg.rg_name
	storage_name = "ztademoeastusdevlogs"
	account_tier = "Standard"
	account_replication_type = "GRS"
	enable_https_traffic_only = true
	allow_blob_public_access = true
	access_tier = "hot"
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
}

	# storage02_outputs
	output "ztademo_eastus_dev_logs_storage_id" {
		value = module.ztademo_eastus_dev_logs_storage.storage_id
	}
	output "ztademo_eastus_dev_logs_storage_name" {
		value = module.ztademo_eastus_dev_logs_storage.storage_name
	}
	output "ztademo_eastus_dev_logs_storage_pri_location" {
		value = module.ztademo_eastus_dev_logs_storage.storage_pri_location
	}
	output "ztademo_eastus_dev_logs_storage_sec_location" {
		value = module.ztademo_eastus_dev_logs_storage.storage_sec_location
	}
	output "ztademo_eastus_dev_logs_storage_pri_blob_endpoint" {
		value = module.ztademo_eastus_dev_logs_storage.storage_pri_blob_endpoint
	}
	output "ztademo_eastus_dev_logs_storage_sec_blob_endpoint" {
		value = module.ztademo_eastus_dev_logs_storage.storage_sec_blob_endpoint
	}
	output "ztademo_eastus_dev_logs_storage_pri_access_key" {
		value = module.ztademo_eastus_dev_logs_storage.storage_pri_access_key
		sensitive = true
	}
	output "ztademo_eastus_dev_logs_storage_pri_connect_string" {
		value = module.ztademo_eastus_dev_logs_storage.storage_pri_connect_string
		sensitive = true
	}

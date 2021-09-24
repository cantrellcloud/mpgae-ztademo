#================================================================================
#
# ZTADEMO
# Log Analytics
#
#================================================================================
#
# loganalyticswrkspc
module "ztademo_eastus_dev_loganalyticswrkspc" {
	source = "github.com/cantrellcloud/tfAzureModules/loganalyticswrkspc"
	#to_provision = local.provision_loganalyticswrkspc
	rg_location = module.ztademo_eastus_dev_rg.rg_location
	rg_name = module.ztademo_eastus_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	loganalyticswrkspc_name = "ztademo-eastus-dev-loganalyticswrkspc"
	loganalyticswrkspc_sku                               = "PerGB2018"
	loganalyticswrkspc_retention_in_days                 = 30
	loganalyticswrkspc_daily_quota_gb                    = null
	loganalyticswrkspc_internet_ingestion_enabled        = true
	loganalyticswrkspc_internet_query_enabled            = true
	loganalyticswrkspc_reservation_capcity_in_gb_per_day = null
}

#loganalyticswrkspc_outputs
output "ztademo_eastus_dev_loganalyticswrkspc_id" {
	value = module.ztademo_eastus_dev_loganalyticswrkspc.loganalyticswrkspc_id
}
output "ztademo_eastus_dev_loganalyticswrkspc_name" {
	value = module.ztademo_eastus_dev_loganalyticswrkspc.loganalyticswrkspc_name
}
output "ztademo_eastus_dev_loganalyticswrkspc_primary_shared_key" {
    value = module.ztademo_eastus_dev_loganalyticswrkspc.loganalyticswrkspc_primary_shared_key
	sensitive = true
}
output "ztademo_eastus_dev_loganalyticswrkspc_secondary_shared_key" {
    value = module.ztademo_eastus_dev_loganalyticswrkspc.loganalyticswrkspc_secondary_shared_key
	sensitive = true
}
output "ztademo_eastus_dev_loganalyticswrkspc_workspace_id" {
    value = module.ztademo_eastus_dev_loganalyticswrkspc.loganalyticswrkspc_workspace_id
}

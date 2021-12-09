#================================================================================
#
# ZTADEV
# Log Analytics
#
#================================================================================
#
# loganalyticswrkspc
module "ztadev_eastus_dev_loganalyticswrkspc" {
	source = "github.com/cantrellcloud/tfaz-loganalyticswrkspc"
	#to_provision = local.provision_loganalyticswrkspc
	rg_location = module.ztadev_eastus_dev_rg.rg_location
	rg_name = module.ztadev_eastus_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	loganalyticswrkspc_name = "ztadev-eastus-dev-loganalyticswrkspc"
	loganalyticswrkspc_sku                               = "PerGB2018"
	loganalyticswrkspc_retention_in_days                 = 30
	loganalyticswrkspc_daily_quota_gb                    = null
	loganalyticswrkspc_internet_ingestion_enabled        = true
	loganalyticswrkspc_internet_query_enabled            = true
	loganalyticswrkspc_reservation_capcity_in_gb_per_day = null
}

#loganalyticswrkspc_outputs
output "ztadev_eastus_dev_loganalyticswrkspc_id" {
	value = module.ztadev_eastus_dev_loganalyticswrkspc.loganalyticswrkspc_id
}
output "ztadev_eastus_dev_loganalyticswrkspc_name" {
	value = module.ztadev_eastus_dev_loganalyticswrkspc.loganalyticswrkspc_name
}
output "ztadev_eastus_dev_loganalyticswrkspc_primary_shared_key" {
    value = module.ztadev_eastus_dev_loganalyticswrkspc.loganalyticswrkspc_primary_shared_key
	sensitive = true
}
output "ztadev_eastus_dev_loganalyticswrkspc_secondary_shared_key" {
    value = module.ztadev_eastus_dev_loganalyticswrkspc.loganalyticswrkspc_secondary_shared_key
	sensitive = true
}
output "ztadev_eastus_dev_loganalyticswrkspc_workspace_id" {
    value = module.ztadev_eastus_dev_loganalyticswrkspc.loganalyticswrkspc_workspace_id
}

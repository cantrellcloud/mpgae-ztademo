#================================================================================
#
# ZTADEV
# Automation
#
#================================================================================
#
# autoaccount
module "ztadev_eastus_dev_autoaccount" {
	source = "github.com/cantrellcloud/tfaz-autoaccount"
	#to_provision = local.provision_autoaccount
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

	autoaccount_name = "ztadev-eastus-dev-autoaccount"
	autoaccount_sku_name = "Basic"
}

#autoaccount_outputs
output "ztadev_eastus_dev_autoaccount_id" {
	value = module.ztadev_eastus_dev_autoaccount.autoaccount_id
}
output "ztadev_eastus_dev_autoaccount_name" {
	value = module.ztadev_eastus_dev_autoaccount.autoaccount_name
}
output "ztadev_eastus_dev_autoaccount_sku_name" {
    value = module.ztadev_eastus_dev_autoaccount.autoaccount_sku_name
}
output "ztadev_eastus_dev_autoaccount_dsc_server_endpoint" {
    value = module.ztadev_eastus_dev_autoaccount.autoaccount_dsc_server_endpoint
}
output "ztadev_eastus_dev_autoaccount_dsc_primary_access_key" {
    value = module.ztadev_eastus_dev_autoaccount.autoaccount_dsc_primary_access_key
}
output "ztadev_eastus_dev_autoaccount_dsc_secondary_access_key" {
    value = module.ztadev_eastus_dev_autoaccount.autoaccount_dsc_secondary_access_key
}

#autoschedule01
module "ztadev_eastus_dev_autoschedule_shutdown_vm_daily" {
	source = "github.com/cantrellcloud/tfaz-autoschedule"
	#to_provision = local.provision_autoschedule_01
	rg_name = module.ztadev_eastus_dev_rg.rg_name

    autoschedule_autoaccount_name  = module.ztadev_eastus_dev_autoaccount.autoaccount_name
    autoschedule_name              = "shutdown_vms_daily"
    autoschedule_frequency         = "Day"
    autoschedule_interval          = 1
    autoschedule_timezone          = "America/New_York"
    autoschedule_start_time        = "2021-11-24T03:30:00Z"
    autoschedule_expiry_time       = null
    autoschedule_description       = "Shutdown VMs Each Night"
    autoschedule_week_days         = null
    autoschedule_month_days        = null
}

#autoschedule01_outputs
output "ztadev_eastus_dev_autoschedule_shutdown_vm_daily_autoschedule_id" {
   	value = module.ztadev_eastus_dev_autoschedule_shutdown_vm_daily.autoschedule_id
}
output "ztadev_eastus_dev_autoschedule_shutdown_vm_daily_autoschedule_name" {
   	value = module.ztadev_eastus_dev_autoschedule_shutdown_vm_daily.autoschedule_name
}

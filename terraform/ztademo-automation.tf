#================================================================================
#
# ZTADEMO
# Automation
#

# autoaccount
module "ztademo_eastus_dev_autoaccount" {
	source = "github.com/cantrellcloud/tfAzureModules/autoaccount"
	#to_provision = local.provision_autoaccount
	rg_location = module.ztademo_eastus_dev_rg.rg_location
	rg_name = module.ztademo_eastus_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "A&E 700 R&D",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	autoaccount_name = "ztademo-eastus-dev-autoaccount"
	autoaccount_sku_name = "Basic"
}

#autoaccount_outputs
output "ztademo_eastus_dev_autoaccount_id" {
	value = module.ztademo_eastus_dev_autoaccount.autoaccount_id
}
output "ztademo_eastus_dev_autoaccount_name" {
	value = module.ztademo_eastus_dev_autoaccount.autoaccount_name
}
output "ztademo_eastus_dev_autoaccount_sku_name" {
    value = module.ztademo_eastus_dev_autoaccount.autoaccount_sku_name
}
output "ztademo_eastus_dev_autoaccount_dsc_server_endpoint" {
    value = module.ztademo_eastus_dev_autoaccount.autoaccount_dsc_server_endpoint
}
output "ztademo_eastus_dev_autoaccount_dsc_primary_access_key" {
    value = module.ztademo_eastus_dev_autoaccount.autoaccount_dsc_primary_access_key
}
output "ztademo_eastus_dev_autoaccount_dsc_secondary_access_key" {
    value = module.ztademo_eastus_dev_autoaccount.autoaccount_dsc_secondary_access_key
}

#autoschedule01
module "ztademo_eastus_dev_autoschedule_shutdown_vm_daily" {
	source = "github.com/cantrellcloud/tfAzureModules/autoschedule"
	#to_provision = local.provision_autoschedule_01
	rg_name = module.ztademo_eastus_dev_rg.rg_name

    autoschedule_autoaccount_name  = module.ztademo_eastus_dev_autoaccount.autoaccount_name
    autoschedule_name              = "shutdown_vms_daily"
    autoschedule_frequency         = "Day"
    autoschedule_interval          = 1
    autoschedule_timezone          = "America/New_York"
    autoschedule_start_time        = "2021-09-21T03:30:00Z"
    autoschedule_expiry_time       = null
    autoschedule_description       = "Shutdown VMs Each Night"
    autoschedule_week_days         = null
    autoschedule_month_days        = null
}

#autoschedule01_outputs
output "ztademo_eastus_dev_autoschedule_shutdown_vm_daily_autoschedule_id" {
   	value = module.ztademo_eastus_dev_autoschedule_shutdown_vm_daily.autoschedule_id
}
output "ztademo_eastus_dev_autoschedule_shutdown_vm_daily_autoschedule_name" {
   	value = module.ztademo_eastus_dev_autoschedule_shutdown_vm_daily.autoschedule_name
}

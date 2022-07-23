# appsvcplan_ztaconfig
module "jtodev_eastus2_dev_appsvcplan_ztaconfig" {
	source = "github.com/cantrellcloud/tfaz-appsvcplan"
	#to_provision = local.provision_appsvcplan_ztaconfig
	rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
	rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name

	appsvcplan_name = "jtodev_eastus2_dev_appsvcplan_ztaconfig"
    kind = "Windows"
    reserved = false
    is_xenon = false

    #sku
        sku_tier = "Standard"
        sku_size = "S1"
        #sku_capacity = 4
}

   #appsvcplan_ztaconfig_outputs
   output "jtodev_eastus2_dev_ztaconfig_appsvcplan_id" {
        value = module.jtodev_eastus2_dev_appsvcplan_ztaconfig.appsvcplan_id
    }
    output "jtodev_eastus2_dev_ztaconfig_appsvcplan_name" {
        value = module.jtodev_eastus2_dev_appsvcplan_ztaconfig.appsvcplan_name
    }
    output "jtodev_eastus2_dev_ztaconfig_appsvcplan_kind" {
        value = module.jtodev_eastus2_dev_appsvcplan_ztaconfig.appsvcplan_kind
    }
    output "jtodev_eastus2_dev_ztaconfig_appsvcplan_appsvcplan_ztaconfig_maximum_number_of_workers" {
        value = module.jtodev_eastus2_dev_appsvcplan_ztaconfig.appsvcplan_maximum_number_of_workers
    }

# appsvcplan_jtodevzta
module "jtodev_eastus2_dev_appsvcplan_jtodevzta" {
	source = "github.com/cantrellcloud/tfaz-appsvcplan"
	#to_provision = local.provision_jtodevzta_appsvcplan
	rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
	rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name

	appsvcplan_name = "jtodev_eastus2_dev_appsvcplan_jtodevzta"
    kind = "Windows"
    reserved = false
    is_xenon = false

    #sku
        sku_tier = "Standard"
        sku_size = "S1"
        #sku_capacity = 4
}

   #appsvcplan01_outputs
   output "jtodev_eastus2_dev_appsvcplan_jtodevzta_id" {
        value = module.jtodev_eastus2_dev_appsvcplan_jtodevzta.appsvcplan_id
    }
    output "jtodev_eastus2_dev_appsvcplan_jtodevzta_name" {
        value = module.jtodev_eastus2_dev_appsvcplan_jtodevzta.appsvcplan_name
    }
    output "jtodev_eastus2_dev_appsvcplan_jtodevzta_kind" {
        value = module.jtodev_eastus2_dev_appsvcplan_jtodevzta.appsvcplan_kind
    }
    output "jtodev_eastus2_dev_appsvcplan_jtodevzta_appsvc_jtodevztaplan_maximum_number_of_workers" {
        value = module.jtodev_eastus2_dev_appsvcplan_jtodevzta.appsvcplan_maximum_number_of_workers
    }

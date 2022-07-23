# appsvcplan_onboardsdp
module "jtodev_eastus2_dev_appsvcplan_onboardsdp" {
	source = "github.com/cantrellcloud/tfaz-appsvcplan"
	#to_provision = local.provision_appsvcplan_onboardsdp
	rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
	rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name

	appsvcplan_name = "jtodev_eastus2_dev_appsvcplan_onboardsdp"
    kind = "Windows"
    reserved = false
    is_xenon = false

    #sku
        sku_tier = "Standard"
        sku_size = "S1"
        #sku_capacity = 4
}

   #appsvcplan_onboardsdp_outputs
   output "jtodev_eastus2_dev_onboardsdp_appsvcplan_id" {
        value = module.jtodev_eastus2_dev_appsvcplan_onboardsdp.appsvcplan_id
    }
    output "jtodev_eastus2_dev_onboardsdp_appsvcplan_name" {
        value = module.jtodev_eastus2_dev_appsvcplan_onboardsdp.appsvcplan_name
    }
    output "jtodev_eastus2_dev_onboardsdp_appsvcplan_kind" {
        value = module.jtodev_eastus2_dev_appsvcplan_onboardsdp.appsvcplan_kind
    }
    output "jtodev_eastus2_dev_onboardsdp_appsvcplan_appsvcplan_onboardsdp_maximum_number_of_workers" {
        value = module.jtodev_eastus2_dev_appsvcplan_onboardsdp.appsvcplan_maximum_number_of_workers
    }

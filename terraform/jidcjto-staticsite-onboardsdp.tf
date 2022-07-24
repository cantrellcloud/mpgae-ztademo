# staticsite_onboardsdp     # JTODev ZTA Onboard SDP site
module "jtodev_eastus2_dev_staticsite_onboardsdp" {
    source = "github.com/cantrellcloud/tfaz-staticsite"
    #to_provision = local.provision_staticsite_onboardsdp
    rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
    rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name
    staticsite_name = "onboardsdp"
    staticsite_sku_size = "Free"
    staticsite_sku_tier = "Free"
}

    #staticsite_onboardsdp_outputs
    output "jtodev_eastus2_dev_staticsite_onboardsdp_id" {
        value = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_id
    }
    output "jtodev_eastus2_dev_staticsite_onboardsdp_name" {
        value = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_name
    }
    output "jtodev_eastus2_dev_staticsite_onboardsdp_api_key" {
        value = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_api_key
    }
    output "jtodev_eastus2_dev_staticsite_onboardsdp_staticsite_default_host_name" {
        value = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_default_host_name
    }
    output "jtodev_eastus2_dev_staticsite_onboardsdp_staticsite_identity" {
        value = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_identity
    }

# staticsite_onboardsdp     # JTODev ZTA Onboard SDP site
module "jtodev_eastus2_dev_staticsite_onboardsdp" {
    source = "github.com/cantrellcloud/tfaz-staticsite"
    #to_provision = local.provision_staticsite_onboardsdp
    rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
    rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name
    rg_tags = {
        "Management Group" = "MPG A&E EastUS2",
		"Environment" = "JTODev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

    staticsite_name = "onboardsdp"
    staticsite_sku_size = "Standard"
    staticsite_sku_tier = "Standard"
    staticsite_identity_type = "SystemAssigned"
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

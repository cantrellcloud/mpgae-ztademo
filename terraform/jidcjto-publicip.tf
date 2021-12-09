#================================================================================
#
# ZTADEV
# Public IPs
#
#================================================================================
#
# PUBLIC IPs
#
# vnetgw_publicip
module "ztadev_eastus2_dev_vnetgw_publicip" {
    source            = "github.com/cantrellcloud/tfaz-publicip"
    #to_provision     = local.provision_ztadevdc01_publicip
    rg_location       = module.ztadev_eastus2_dev_rg.rg_location
    rg_name           = module.ztadev_eastus2_dev_rg.rg_name
	rg_tags               = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment"     = "Dev",
		"AutomatedBy"     = "Terraform",
		"Note1"           = "Do not manually change",
		"POCName"         = "ronc@mindpointgroup.com",
		"POCPhone"        = "843.330.6769",
		"Project"         = "Zero Trust Demo"
	}

    publicip_name              = "ztadev_eastus2_dev_vnetgw_publicip"
    publicip_allocation_method = "Dynamic"
    publicip_sku               = "Basic"
    publicip_domain_name_label = "ztadev-vnetgw"
}

#vnetgw_publicip_outputs
    output "ztadev_eastus2_dev_vnetgw_publicip_id" {
        value = module.ztadev_eastus2_dev_vnetgw_publicip.publicip_id
    }
    output "ztadev_eastus2_dev_vnetgw_publicip_name" {
        value = module.ztadev_eastus2_dev_vnetgw_publicip.publicip_name
    }
    output "ztadev_eastus2_dev_vnetgw_publicip_domain_name_label" {
        value = module.ztadev_eastus2_dev_vnetgw_publicip.publicip_domain_name_label
    }

#================================================================================
#
# ZTADEMO
# Bastion Host
#
#================================================================================
#
# BASTION HOST and PUBLIC IPs
#
# bastion01
module "ztademo_eastus2_dev_ztadev_bast01_bastion" {
	source = "github.com/cantrellcloud/tfaz-bastions"
	#to_provision = local.provision_bastion01
	rg_location = module.ztademo_eastus2_dev_rg.rg_location
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	bastions_name = "ztadev-bast01"
    ip_configuration_name                 = "ztadev_bast01_ip"
    ip_configuration_subnet_id            = module.ztademo_eastus2_dev_azure_bastion_subnet.subnet_id
    ip_configuration_public_ip_address_id = module.ztademo_eastus2_dev_ztadev_bast01_publicip.publicip_id
}

    # ztadev_bast01_publicip
    module "ztademo_eastus2_dev_ztadev_bast01_publicip" {
        source            = "github.com/cantrellcloud/tfaz-publicip"
        #to_provision     = local.provision_ztadev_bast01_publicip
        rg_location       = module.ztademo_eastus2_dev_rg.rg_location
        rg_name           = module.ztademo_eastus2_dev_rg.rg_name
        publicip_name     = "ztademo_eastus2_dev_ztadev_bast01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadevbast01"
    }

    # ztadev_bast01_outputs
    output "ztademo_eastus2_dev_ztadev_bast01_bastion_id" {
        value = module.ztademo_eastus2_dev_ztadev_bast01_bastion.bastions_id
    }
    output "ztademo_eastus2_dev_ztadev_bast01_bastion_name" {
        value = module.ztademo_eastus2_dev_ztadev_bast01_bastion.bastions_name
    }
    output "ztademo_eastus2_dev_ztadev_bast01_bastion_dns_name" {
        value = module.ztademo_eastus2_dev_ztadev_bast01_bastion.bastions_dns_name
    }
	#ztadev_bast01_publicip_outputs
    output "ztademo_eastus2_dev_ztadev_bast01_publicip_id" {
        value = module.ztademo_eastus2_dev_ztadev_bast01_publicip.publicip_id
    }
    output "ztademo_eastus2_dev_ztadev_bast01_publicip_name" {
        value = module.ztademo_eastus2_dev_ztadev_bast01_publicip.publicip_name
    }
    output "ztademo_eastus2_dev_ztadev_bast01_publicip_domain_name_label" {
        value = module.ztademo_eastus2_dev_ztadev_bast01_publicip.publicip_domain_name_label
    }

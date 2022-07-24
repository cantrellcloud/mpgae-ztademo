# zone01
module "jtodev_eastus2_dev_dnszone_jidcjto_com" {
	source        = "github.com/cantrellcloud/tfaz-dnszone"
	#to_provision = local.provision_zone01
	rg_name       = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name
	dnszone_name  = "jitdjto.com"
    rg_tags = {
        "Management Group" = "MPG A&E EastUS2",
		"Environment" = "JTODev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}
	
}
	# zone01_outputs
	output "jtodev_eastus2_dev_dnszone_jidcjto_com_id" {
		value = module.jtodev_eastus2_dev_dnszone_jidcjto_com.dnszone_id
	}
	output "jtodev_eastus2_dev_dnszone_jidcjto_com_max_number_of_record_sets" {
		value = module.jtodev_eastus2_dev_dnszone_jidcjto_com.dnszone_max_number_of_record_sets
	}
	output "jtodev_eastus2_dev_dnszone_jidcjto_com_number_of_record_sets" {
		value = module.jtodev_eastus2_dev_dnszone_jidcjto_com.dnszone_number_of_record_sets
	}
	output "jtodev_eastus2_dev_dnszone_jidcjto_com_name_servers" {
		value = module.jtodev_eastus2_dev_dnszone_jidcjto_com.dnszone_name_servers
	}

# zone01
module "jtodev_eastus2_dev_dnszone_jidcjto_com" {
	source        = "github.com/cantrellcloud/tfaz-dnszone"
	#to_provision = local.provision_zone01
	rg_name       = module.jtodev_eastus2_dev_rg.rg_name
	dnszone_name  = "jitdjto.com"
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

#================================================================================
#
# LOCAL NETWORK GATEWAYS

# localgw01
module "ztadev_eastus2_dev_cotpa_localgw" {
	source = "github.com/cantrellcloud/tfaz-localgw"
	#to_provision = local.provision_localgw01
	rg_location = module.ztadev_eastus2_dev_rg.rg_location
	rg_name = module.ztadev_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	localgw_name = "ztadev_eastus2_dev-cotpa_localgw"
	gateway_address = local.localgw01_gateway_address

	# ENTER NETWORK IDs OF LOCAL NET FOR ROUTING 
	address_space = [
		"172.16.8.0/24",
		"172.16.14.0/24",
		"172.16.10.11/32",
		"172.16.58.71/32",
		"172.16.58.72/32"
	]
}

# localgw01_outputs
    output "ztadev_eastus2_dev_cotpa_localgw_id" {
        value = module.ztadev_eastus2_dev_cotpa_localgw.localgw_id
    }
    output "ztadev_eastus2_dev_cotpa_localgw_name" {
        value = module.ztadev_eastus2_dev_cotpa_localgw.localgw_name
    }

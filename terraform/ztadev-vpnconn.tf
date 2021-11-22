#================================================================================
#
# VPN CONNECTIONS

# vpncon01
module "ztadev_eastus2_dev_cotpa_vpncon" {
	source = "github.com/cantrellcloud/tfaz-vpncon"
	#to_provision = local.provision_vpncon01
    rg_location           = module.ztadev_eastus2_dev_rg.rg_location
    rg_name               = module.ztadev_eastus2_dev_rg.rg_name
	rg_tags               = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment"     = "Dev",
		"AutomatedBy"     = "Terraform",
		"Note1"           = "Do not manually change",
		"POCName"         = "ronc@mindpointgroup.com",
		"POCPhone"        = "843.330.6769",
		"Project"         = "Zero Trust Demo"
	}

	vpncon_name       = "ztadev_eastus2_dev-cotpa_vpncon"
	vpncon_type       = "IPsec"
	vpncon_vnetgw_id  = module.ztadev_eastus2_dev_vnetgw.vnetgw_id
	vpncon_localgw_id = module.ztadev_eastus2_dev_cotpa_localgw.localgw_id
	vpncon_shared_key = "iakavfGhjH68Yu2BBd%8Nac6N"
}

# vpncon01_outputs
    output "ztadev_eastus2_dev_cotpa_vpncon_id" {
        value = module.ztadev_eastus2_dev_cotpa_vpncon.vpncon_id
    }
    output "ztadev_eastus2_dev_cotpa_vpncon_name" {
        value = module.ztadev_eastus2_dev_cotpa_vpncon.vpncon_name
    }
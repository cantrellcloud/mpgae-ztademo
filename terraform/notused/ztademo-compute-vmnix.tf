#================================================================================
#
# DCEDEMO
#
# abac-compute-vmnix.tf
#
#================================================================================
#
# VIRTUAL MACHINES and NETWORK INTERFACES

# vmnix01
# ** ASSIGNED TO DON RUNNELS **
# **      Do not delete      **
module "kea_dcedemo_eastus_jidcjtonix01_vmnix" {
	source = "github.com/cantrellcloud/tfAzureModules/vmnix"
	#to_provision = local.provision_vmnix01
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vmnix_name = "jidcjto-nix01"
    size                  = "Standard_D4s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jidcjto-nix01"
    network_interface_ids = [
        module.kea_dcedemo_eastus_jidcjtonix01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "UbuntuServer"
    source_image_reference_sku       = "18.04-LTS"
    #version   = "latest"
}

    # jidcjtonix01_publicip
    module "kea_dcedemo_eastus_jidcjtonix01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_jidcjtonix01_publicip
        rg_location       = module.kea_dcedemo_eastus_rg.rg_location
        rg_name           = module.kea_dcedemo_eastus_rg.rg_name
        publicip_name     = "kea_dcedemo_eastus_jidcjtonix01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jidcjto-nix01"
    }

    # jidcjtonix01_netinf
    module "kea_dcedemo_eastus_jidcjtonix01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_jidcjtonix01_netinf
        rg_location = module.kea_dcedemo_eastus_rg.rg_location
        rg_name = module.kea_dcedemo_eastus_rg.rg_name
        netinf_name = "jidcjtonix01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.kea_dcedemo_eastus_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "10.0.200.6"
        ip_configuration_public_ip_address_id          = module.kea_dcedemo_eastus_jidcjtonix01_publicip.publicip_id
}

    # jidcjtonix01_outputs
    output "kea_dcedemo_eastus_jidcjtonix01_vmnix_id" {
        value = module.kea_dcedemo_eastus_jidcjtonix01_vmnix.vmnix_id
    }
    output "kea_dcedemo_eastus_jidcjtonix01_vmnix_name" {
        value = module.kea_dcedemo_eastus_jidcjtonix01_vmnix.vmnix_name
    }
    output "kea_dcedemo_eastus_jidcjtonix01_vmnix_computer_name" {
        value = module.kea_dcedemo_eastus_jidcjtonix01_vmnix.vmnix_computer_name
    }
    output "kea_dcedemo_eastus_jidcjtonix01_vmnix_private_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtonix01_vmnix.vmnix_private_ip_address
    }
    output "kea_dcedemo_eastus_jidcjtonix01_vmnix_virtual_machine_id" {
        value = module.kea_dcedemo_eastus_jidcjtonix01_vmnix.vmnix_virtual_machine_id
    }
    output "kea_dcedemo_eastus_jidcjtonix01_vmnix_public_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtonix01_vmnix.vmnix_public_ip_address
    }

    #jidcjtonix01_publicip
    output "kea_dcedemo_eastus_jidcjtonix01_publicip_id" {
        value = module.kea_dcedemo_eastus_jidcjtonix01_publicip.publicip_id
    }
    output "kea_dcedemo_eastus_jidcjtonix01_publicip_name" {
        value = module.kea_dcedemo_eastus_jidcjtonix01_publicip.publicip_name
    }
    output "kea_dcedemo_eastus_jidcjtonix01_publicip_domain_name_label" {
        value = module.kea_dcedemo_eastus_jidcjtonix01_publicip.publicip_domain_name_label
    }

	# jidcjtonix01_netinf_outputs
	output "kea_dcedemo_eastus_jidcjtonix01_netinf_id" {
		value = module.kea_dcedemo_eastus_jidcjtonix01_netinf.netinf_id
	}
	output "kea_dcedemo_eastus_jidcjtonix01_netinf_name" {
		value = module.kea_dcedemo_eastus_jidcjtonix01_netinf.netinf_name
	}
	output "kea_dcedemo_eastus_jidcjtonix01_netinf_private_ip_address" {
		value = module.kea_dcedemo_eastus_jidcjtonix01_netinf.netinf_private_ip_address
	}
	output "kea_dcedemo_eastus_jidcjtonix01_netinf_virtual_machine_id" {
		value = module.kea_dcedemo_eastus_jidcjtonix01_netinf.netinf_virtual_machine_id
	}

# vmnix02
# ** DCE Demo Splunk Server  **
# **      Do not delete      **
module "kea_dcedemo_eastus_jidcjtospl01_vmnix" {
	source = "github.com/cantrellcloud/tfAzureModules/vmnix"
	#to_provision = local.provision_vmnix02
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vmnix_name = "jidcjto-spl01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jidcjto-spl01"
    network_interface_ids = [
        module.kea_dcedemo_eastus_jidcjtospl01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "UbuntuServer"
    source_image_reference_sku       = "18.04-LTS"
    #version   = "latest"
}

    # jidcjtospl01_publicip
    module "kea_dcedemo_eastus_jidcjtospl01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_jidcjtospl01_publicip
        rg_location       = module.kea_dcedemo_eastus_rg.rg_location
        rg_name           = module.kea_dcedemo_eastus_rg.rg_name
        publicip_name     = "kea_dcedemo_eastus_jidcjtospl01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jidcjto-spl01"
    }

    # jidcjtospl01_netinf
    module "kea_dcedemo_eastus_jidcjtospl01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_jidcjtospl01_netinf
        rg_location = module.kea_dcedemo_eastus_rg.rg_location
        rg_name = module.kea_dcedemo_eastus_rg.rg_name
        netinf_name = "jidcjtospl01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.kea_dcedemo_eastus_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "10.0.200.30"
        ip_configuration_public_ip_address_id          = module.kea_dcedemo_eastus_jidcjtospl01_publicip.publicip_id
}

    # jidcjtospl01_outputs
    output "kea_dcedemo_eastus_jidcjtospl01_vmnix_id" {
        value = module.kea_dcedemo_eastus_jidcjtospl01_vmnix.vmnix_id
    }
    output "kea_dcedemo_eastus_jidcjtospl01_vmnix_name" {
        value = module.kea_dcedemo_eastus_jidcjtospl01_vmnix.vmnix_name
    }
    output "kea_dcedemo_eastus_jidcjtospl01_vmnix_computer_name" {
        value = module.kea_dcedemo_eastus_jidcjtospl01_vmnix.vmnix_computer_name
    }
    output "kea_dcedemo_eastus_jidcjtospl01_vmnix_private_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtospl01_vmnix.vmnix_private_ip_address
    }
    output "kea_dcedemo_eastus_jidcjtospl01_vmnix_virtual_machine_id" {
        value = module.kea_dcedemo_eastus_jidcjtospl01_vmnix.vmnix_virtual_machine_id
    }
    output "kea_dcedemo_eastus_jidcjtospl01_vmnix_public_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtospl01_vmnix.vmnix_public_ip_address
    }

    #jidcjtospl01_publicip
    output "kea_dcedemo_eastus_jidcjtospl01_publicip_id" {
        value = module.kea_dcedemo_eastus_jidcjtospl01_publicip.publicip_id
    }
    output "kea_dcedemo_eastus_jidcjtospl01_publicip_name" {
        value = module.kea_dcedemo_eastus_jidcjtospl01_publicip.publicip_name
    }
    output "kea_dcedemo_eastus_jidcjtospl01_publicip_domain_name_label" {
        value = module.kea_dcedemo_eastus_jidcjtospl01_publicip.publicip_domain_name_label
    }

	# jidcjtospl01_netinf_outputs
	output "kea_dcedemo_eastus_jidcjtospl01_netinf_id" {
		value = module.kea_dcedemo_eastus_jidcjtospl01_netinf.netinf_id
	}
	output "kea_dcedemo_eastus_jidcjtospl01_netinf_name" {
		value = module.kea_dcedemo_eastus_jidcjtospl01_netinf.netinf_name
	}
	output "kea_dcedemo_eastus_jidcjtospl01_netinf_private_ip_address" {
		value = module.kea_dcedemo_eastus_jidcjtospl01_netinf.netinf_private_ip_address
	}
	output "kea_dcedemo_eastus_jidcjtospl01_netinf_virtual_machine_id" {
		value = module.kea_dcedemo_eastus_jidcjtospl01_netinf.netinf_virtual_machine_id
	}

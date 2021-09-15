#================================================================================
#
# DCEDEMO
#
# abac-compute-vmnix-ztpc01-03.tf
#
#================================================================================
#
# VIRTUAL MACHINES and NETWORK INTERFACES

# zpc01
module "kea_dcedemo_eastus_ztpc01_vmnix" {
	source = "github.com/cantrellcloud/tfAzureModules/vmnix"
	#to_provision = local.provision_vmnix02
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vmnix_name = "ztpc01"
    size                  = "Standard_B2s"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztpc01"
    network_interface_ids = [
        module.kea_dcedemo_eastus_ztpc01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "UbuntuServer"
    source_image_reference_sku       = "18.04-LTS"
    #version   = "latest"
}

    # ztpc01_publicip
/*    module "kea_dcedemo_eastus_ztpc01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_ztpc01_publicip
        rg_location       = module.kea_dcedemo_eastus_rg.rg_location
        rg_name           = module.kea_dcedemo_eastus_rg.rg_name
        publicip_name     = "kea_dcedemo_eastus_ztpc01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztpc01"
    }
*/
    # ztpc01_netinf
    module "kea_dcedemo_eastus_ztpc01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_ztpc01_netinf
        rg_location = module.kea_dcedemo_eastus_rg.rg_location
        rg_name = module.kea_dcedemo_eastus_rg.rg_name
        netinf_name = "ztpc01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.kea_dcedemo_eastus_ztcontroller_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "10.0.200.41"
        ip_configuration_public_ip_address_id          = null   #module.kea_dcedemo_eastus_ztpc01_publicip.publicip_id
}

    # ztpc01_outputs
    output "kea_dcedemo_eastus_ztpc01_vmnix_id" {
        value = module.kea_dcedemo_eastus_ztpc01_vmnix.vmnix_id
    }
    output "kea_dcedemo_eastus_ztpc01_vmnix_name" {
        value = module.kea_dcedemo_eastus_ztpc01_vmnix.vmnix_name
    }
    output "kea_dcedemo_eastus_ztpc01_vmnix_computer_name" {
        value = module.kea_dcedemo_eastus_ztpc01_vmnix.vmnix_computer_name
    }
    output "kea_dcedemo_eastus_ztpc01_vmnix_private_ip_address" {
        value = module.kea_dcedemo_eastus_ztpc01_vmnix.vmnix_private_ip_address
    }
    output "kea_dcedemo_eastus_ztpc01_vmnix_virtual_machine_id" {
        value = module.kea_dcedemo_eastus_ztpc01_vmnix.vmnix_virtual_machine_id
    }
 /*   output "kea_dcedemo_eastus_ztpc01_vmnix_public_ip_address" {
        value = module.kea_dcedemo_eastus_ztpc01_vmnix.vmnix_public_ip_address
    }
*/
    #ztpc01_publicip_outputs
/*    output "kea_dcedemo_eastus_ztpc01_publicip_id" {
        value = module.kea_dcedemo_eastus_ztpc01_publicip.publicip_id
    }
    output "kea_dcedemo_eastus_ztpc01_publicip_name" {
        value = module.kea_dcedemo_eastus_ztpc01_publicip.publicip_name
    }
    output "kea_dcedemo_eastus_ztpc01_publicip_domain_name_label" {
        value = module.kea_dcedemo_eastus_ztpc01_publicip.publicip_domain_name_label
    }
*/
	# ztpc01_netinf_outputs
	output "kea_dcedemo_eastus_ztpc01_netinf_id" {
		value = module.kea_dcedemo_eastus_ztpc01_netinf.netinf_id
	}
	output "kea_dcedemo_eastus_ztpc01_netinf_name" {
		value = module.kea_dcedemo_eastus_ztpc01_netinf.netinf_name
	}
	output "kea_dcedemo_eastus_ztpc01_netinf_private_ip_address" {
		value = module.kea_dcedemo_eastus_ztpc01_netinf.netinf_private_ip_address
	}
	output "kea_dcedemo_eastus_ztpc01_netinf_virtual_machine_id" {
		value = module.kea_dcedemo_eastus_ztpc01_netinf.netinf_virtual_machine_id
	}

# ztpc02
module "kea_dcedemo_eastus_ztpc02_vmnix" {
	source = "github.com/cantrellcloud/tfAzureModules/vmnix"
	#to_provision = local.provision_vmnix03
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vmnix_name = "ztpc02"
    size                  = "Standard_B2s"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztpc02"
    network_interface_ids = [
        module.kea_dcedemo_eastus_ztpc02_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "UbuntuServer"
    source_image_reference_sku       = "18.04-LTS"
    #version   = "latest"
}

    # ztpc02_publicip
/*    module "kea_dcedemo_eastus_ztpc02_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_ztpc02_publicip
        rg_location       = module.kea_dcedemo_eastus_rg.rg_location
        rg_name           = module.kea_dcedemo_eastus_rg.rg_name
        publicip_name     = "kea_dcedemo_eastus_ztpc02_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztpc02"
    }
*/
    # ztpc02_netinf
    module "kea_dcedemo_eastus_ztpc02_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_ztpc02_netinf
        rg_location = module.kea_dcedemo_eastus_rg.rg_location
        rg_name = module.kea_dcedemo_eastus_rg.rg_name
        netinf_name = "ztpc02_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.kea_dcedemo_eastus_ztcontroller_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "10.0.200.42"
        ip_configuration_public_ip_address_id          = null   #module.kea_dcedemo_eastus_ztpc02_publicip.publicip_id
}

    # ztpc02_outputs
    output "kea_dcedemo_eastus_ztpc02_vmnix_id" {
        value = module.kea_dcedemo_eastus_ztpc02_vmnix.vmnix_id
    }
    output "kea_dcedemo_eastus_ztpc02_vmnix_name" {
        value = module.kea_dcedemo_eastus_ztpc02_vmnix.vmnix_name
    }
    output "kea_dcedemo_eastus_ztpc02_vmnix_computer_name" {
        value = module.kea_dcedemo_eastus_ztpc02_vmnix.vmnix_computer_name
    }
    output "kea_dcedemo_eastus_ztpc02_vmnix_private_ip_address" {
        value = module.kea_dcedemo_eastus_ztpc02_vmnix.vmnix_private_ip_address
    }
    output "kea_dcedemo_eastus_ztpc02_vmnix_virtual_machine_id" {
        value = module.kea_dcedemo_eastus_ztpc02_vmnix.vmnix_virtual_machine_id
    }
/*    output "kea_dcedemo_eastus_ztpc02_vmnix_public_ip_address" {
        value = module.kea_dcedemo_eastus_ztpc02_vmnix.vmnix_public_ip_address
    }
*/
    #ztpc02_publicip_outputs
/*    output "kea_dcedemo_eastus_ztpc02_publicip_id" {
        value = module.kea_dcedemo_eastus_ztpc02_publicip.publicip_id
    }
    output "kea_dcedemo_eastus_ztpc02_publicip_name" {
        value = module.kea_dcedemo_eastus_ztpc02_publicip.publicip_name
    }
    output "kea_dcedemo_eastus_ztpc02_publicip_domain_name_label" {
        value = module.kea_dcedemo_eastus_ztpc02_publicip.publicip_domain_name_label
    }
*/
	# ztpc02_netinf_outputs
	output "kea_dcedemo_eastus_ztpc02_netinf_id" {
		value = module.kea_dcedemo_eastus_ztpc02_netinf.netinf_id
	}
	output "kea_dcedemo_eastus_ztpc02_netinf_name" {
		value = module.kea_dcedemo_eastus_ztpc02_netinf.netinf_name
	}
	output "kea_dcedemo_eastus_ztpc02_netinf_private_ip_address" {
		value = module.kea_dcedemo_eastus_ztpc02_netinf.netinf_private_ip_address
	}
	output "kea_dcedemo_eastus_ztpc02_netinf_virtual_machine_id" {
		value = module.kea_dcedemo_eastus_ztpc02_netinf.netinf_virtual_machine_id
	}

# ztpc03
module "kea_dcedemo_eastus_ztpc03_vmnix" {
	source = "github.com/cantrellcloud/tfAzureModules/vmnix"
	#to_provision = local.provision_vmnix04
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vmnix_name = "ztpc03"
    size                  = "Standard_B2s"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztpc03"
    network_interface_ids = [
        module.kea_dcedemo_eastus_ztpc03_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "UbuntuServer"
    source_image_reference_sku       = "18.04-LTS"
    #version   = "latest"
}

    # ztpc03_publicip
/*    module "kea_dcedemo_eastus_ztpc03_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_ztpc03_publicip
        rg_location       = module.kea_dcedemo_eastus_rg.rg_location
        rg_name           = module.kea_dcedemo_eastus_rg.rg_name
        publicip_name     = "kea_dcedemo_eastus_ztpc03_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztpc03"
    }
*/
    # ztpc03_netinf
    module "kea_dcedemo_eastus_ztpc03_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_ztpc03_netinf
        rg_location = module.kea_dcedemo_eastus_rg.rg_location
        rg_name = module.kea_dcedemo_eastus_rg.rg_name
        netinf_name = "ztpc03_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.kea_dcedemo_eastus_ztcontroller_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "10.0.200.43"
        ip_configuration_public_ip_address_id          = null   #module.kea_dcedemo_eastus_ztpc03_publicip.publicip_id
}

    # ztpc03_outputs
    output "kea_dcedemo_eastus_ztpc03_vmnix_id" {
        value = module.kea_dcedemo_eastus_ztpc03_vmnix.vmnix_id
    }
    output "kea_dcedemo_eastus_ztpc03_vmnix_name" {
        value = module.kea_dcedemo_eastus_ztpc03_vmnix.vmnix_name
    }
    output "kea_dcedemo_eastus_ztpc03_vmnix_computer_name" {
        value = module.kea_dcedemo_eastus_ztpc03_vmnix.vmnix_computer_name
    }
    output "kea_dcedemo_eastus_ztpc03_vmnix_private_ip_address" {
        value = module.kea_dcedemo_eastus_ztpc03_vmnix.vmnix_private_ip_address
    }
    output "kea_dcedemo_eastus_ztpc03_vmnix_virtual_machine_id" {
        value = module.kea_dcedemo_eastus_ztpc03_vmnix.vmnix_virtual_machine_id
    }
/*    output "kea_dcedemo_eastus_ztpc03_vmnix_public_ip_address" {
        value = module.kea_dcedemo_eastus_ztpc03_vmnix.vmnix_public_ip_address
    }
*/
    #ztpc03_publicip
/*    output "kea_dcedemo_eastus_ztpc03_publicip_id" {
        value = module.kea_dcedemo_eastus_ztpc03_publicip.publicip_id
    }
    output "kea_dcedemo_eastus_ztpc03_publicip_name" {
        value = module.kea_dcedemo_eastus_ztpc03_publicip.publicip_name
    }
    output "kea_dcedemo_eastus_ztpc03_publicip_domain_name_label" {
        value = module.kea_dcedemo_eastus_ztpc03_publicip.publicip_domain_name_label
    }
*/
	# ztpc03_netinf_outputs
	output "kea_dcedemo_eastus_ztpc03_netinf_id" {
		value = module.kea_dcedemo_eastus_ztpc03_netinf.netinf_id
	}
	output "kea_dcedemo_eastus_ztpc03_netinf_name" {
		value = module.kea_dcedemo_eastus_ztpc03_netinf.netinf_name
	}
	output "kea_dcedemo_eastus_ztpc03_netinf_private_ip_address" {
		value = module.kea_dcedemo_eastus_ztpc03_netinf.netinf_private_ip_address
	}
	output "kea_dcedemo_eastus_ztpc03_netinf_virtual_machine_id" {
		value = module.kea_dcedemo_eastus_ztpc03_netinf.netinf_virtual_machine_id
	}
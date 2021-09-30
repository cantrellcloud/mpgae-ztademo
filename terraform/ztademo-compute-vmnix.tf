#================================================================================
#
# ZTADEMO
# Compute - Linux
#
#================================================================================
#
# LINUX VIRTUAL MACHINES, NETWORK INTERFACES, and PUBLIC IPs
#
# vmnix01
module "ztademo_eastus2_dev_ztadevnix01_vmnix" {
	source = "github.com/cantrellcloud/tfAzureModules/vmnix"
	#to_provision = local.provision_vmnix01
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

	vmnix_name = "ztadev-nix01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-nix01"
    network_interface_ids = [
        module.ztademo_eastus2_dev_ztadevnix01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "0001-com-ubuntu-server-focal"
    source_image_reference_sku       = "20_04-lts-gen2"
    #version   = "latest"
}

    # ztadevnix01_publicip
/*    module "ztademo_eastus2_dev_ztadevnix01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_ztadevnix01_publicip
        rg_location       = module.ztademo_eastus2_dev_rg.rg_location
        rg_name           = module.ztademo_eastus2_dev_rg.rg_name
        publicip_name     = "ztademo_eastus2_dev_ztadevnix01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadev-nix01"
    }
*/
    # ztadevnix01_netinf
    module "ztademo_eastus2_dev_ztadevnix01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_ztadevnix01_netinf
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
        netinf_name = "ztadevnix01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztademo_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.6"
        ip_configuration_public_ip_address_id          = null # module.ztademo_eastus2_dev_ztadevnix01_publicip.publicip_id
}

    # ztadevnix01_outputs
    output "ztademo_eastus2_dev_ztadevnix01_vmnix_id" {
        value = module.ztademo_eastus2_dev_ztadevnix01_vmnix.vmnix_id
    }
    output "ztademo_eastus2_dev_ztadevnix01_vmnix_name" {
        value = module.ztademo_eastus2_dev_ztadevnix01_vmnix.vmnix_name
    }
    output "ztademo_eastus2_dev_ztadevnix01_vmnix_computer_name" {
        value = module.ztademo_eastus2_dev_ztadevnix01_vmnix.vmnix_computer_name
    }
    output "ztademo_eastus2_dev_ztadevnix01_vmnix_private_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevnix01_vmnix.vmnix_private_ip_address
    }
    output "ztademo_eastus2_dev_ztadevnix01_vmnix_virtual_machine_id" {
        value = module.ztademo_eastus2_dev_ztadevnix01_vmnix.vmnix_virtual_machine_id
    }
    output "ztademo_eastus2_dev_ztadevnix01_vmnix_public_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevnix01_vmnix.vmnix_public_ip_address
    }

    #ztadevnix01_publicip
/*    output "ztademo_eastus2_dev_ztadevnix01_publicip_id" {
        value = module.ztademo_eastus2_dev_ztadevnix01_publicip.publicip_id
    }
    output "ztademo_eastus2_dev_ztadevnix01_publicip_name" {
        value = module.ztademo_eastus2_dev_ztadevnix01_publicip.publicip_name
    }
    output "ztademo_eastus2_dev_ztadevnix01_publicip_domain_name_label" {
        value = module.ztademo_eastus2_dev_ztadevnix01_publicip.publicip_domain_name_label
    }
*/
	# ztadevnix01_netinf_outputs
	output "ztademo_eastus2_dev_ztadevnix01_netinf_id" {
		value = module.ztademo_eastus2_dev_ztadevnix01_netinf.netinf_id
	}
	output "ztademo_eastus2_dev_ztadevnix01_netinf_name" {
		value = module.ztademo_eastus2_dev_ztadevnix01_netinf.netinf_name
	}
	output "ztademo_eastus2_dev_ztadevnix01_netinf_private_ip_address" {
		value = module.ztademo_eastus2_dev_ztadevnix01_netinf.netinf_private_ip_address
	}
	output "ztademo_eastus2_dev_ztadevnix01_netinf_virtual_machine_id" {
		value = module.ztademo_eastus2_dev_ztadevnix01_netinf.netinf_virtual_machine_id
	}

# vmnix02
module "ztademo_eastus2_dev_ztadevnix02_vmnix" {
	source = "github.com/cantrellcloud/tfAzureModules/vmnix"
	#to_provision = local.provision_vmnix02
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

	vmnix_name = "ztadev-nix02"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-nix02"
    network_interface_ids = [
        module.ztademo_eastus2_dev_ztadevnix02_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "0001-com-ubuntu-server-focal"
    source_image_reference_sku       = "20_04-lts-gen2"
    #version   = "latest"
}

    # ztadevnix02_publicip
/*    module "ztademo_eastus2_dev_ztadevnix02_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_ztadevnix02_publicip
        rg_location       = module.ztademo_eastus2_dev_rg.rg_location
        rg_name           = module.ztademo_eastus2_dev_rg.rg_name
        publicip_name     = "ztademo_eastus2_dev_ztadevnix02_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadev-nix02"
    }
*/
    # ztadevnix02_netinf
    module "ztademo_eastus2_dev_ztadevnix02_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_ztadevnix02_netinf
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
        netinf_name = "ztadevnix02_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztademo_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.7"
        ip_configuration_public_ip_address_id          = null # module.ztademo_eastus2_dev_ztadevnix02_publicip.publicip_id
}

    # ztadevnix02_outputs
    output "ztademo_eastus2_dev_ztadevnix02_vmnix_id" {
        value = module.ztademo_eastus2_dev_ztadevnix02_vmnix.vmnix_id
    }
    output "ztademo_eastus2_dev_ztadevnix02_vmnix_name" {
        value = module.ztademo_eastus2_dev_ztadevnix02_vmnix.vmnix_name
    }
    output "ztademo_eastus2_dev_ztadevnix02_vmnix_computer_name" {
        value = module.ztademo_eastus2_dev_ztadevnix02_vmnix.vmnix_computer_name
    }
    output "ztademo_eastus2_dev_ztadevnix02_vmnix_private_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevnix02_vmnix.vmnix_private_ip_address
    }
    output "ztademo_eastus2_dev_ztadevnix02_vmnix_virtual_machine_id" {
        value = module.ztademo_eastus2_dev_ztadevnix02_vmnix.vmnix_virtual_machine_id
    }
    output "ztademo_eastus2_dev_ztadevnix02_vmnix_public_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevnix02_vmnix.vmnix_public_ip_address
    }

    #ztadevnix02_publicip
/*    output "ztademo_eastus2_dev_ztadevnix02_publicip_id" {
        value = module.ztademo_eastus2_dev_ztadevnix02_publicip.publicip_id
    }
    output "ztademo_eastus2_dev_ztadevnix02_publicip_name" {
        value = module.ztademo_eastus2_dev_ztadevnix02_publicip.publicip_name
    }
    output "ztademo_eastus2_dev_ztadevnix02_publicip_domain_name_label" {
        value = module.ztademo_eastus2_dev_ztadevnix02_publicip.publicip_domain_name_label
    }
*/
	# ztadevnix02_netinf_outputs
	output "ztademo_eastus2_dev_ztadevnix02_netinf_id" {
		value = module.ztademo_eastus2_dev_ztadevnix02_netinf.netinf_id
	}
	output "ztademo_eastus2_dev_ztadevnix02_netinf_name" {
		value = module.ztademo_eastus2_dev_ztadevnix02_netinf.netinf_name
	}
	output "ztademo_eastus2_dev_ztadevnix02_netinf_private_ip_address" {
		value = module.ztademo_eastus2_dev_ztadevnix02_netinf.netinf_private_ip_address
	}
	output "ztademo_eastus2_dev_ztadevnix02_netinf_virtual_machine_id" {
		value = module.ztademo_eastus2_dev_ztadevnix02_netinf.netinf_virtual_machine_id
	}

# vmnix03
# ** ZTA Demo Splunk Server  **
# **      Do not delete      **
module "ztademo_eastus2_dev_ztadevspl01_vmnix" {
	source = "github.com/cantrellcloud/tfAzureModules/vmnix"
	#to_provision = local.provision_vmnix02
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

	vmnix_name = "ztadev-spl01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-spl01"
    network_interface_ids = [
        module.ztademo_eastus2_dev_ztadevspl01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "0001-com-ubuntu-server-focal"
    source_image_reference_sku       = "20_04-lts-gen2"
    #version   = "latest"
}

    # ztademospl01_publicip
/*    module "ztademo_eastus2_dev_ztadevspl01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_ztademospl01_publicip
        rg_location       = module.ztademo_eastus2_dev_rg.rg_location
        rg_name           = module.ztademo_eastus2_dev_rg.rg_name
        publicip_name     = "ztademo_eastus2_dev_ztadevspl01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadev-spl01"
    }
*/
    # ztademospl01_netinf
    module "ztademo_eastus2_dev_ztadevspl01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_ztademospl01_netinf
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
        netinf_name = "ztadevspl01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztademo_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.30"
        ip_configuration_public_ip_address_id          = null # module.ztademo_eastus2_dev_ztadevspl01_publicip.publicip_id
}

    # ztadevspl01_manageddisk
    module "ztademo_eastus2_dev_ztadevspl01_data01_manageddisk" {
        source = "github.com/cantrellcloud/tfAzureModules/manageddisk"
        #to_provision = local.provision_ztadevspl01_manageddisk
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
        manageddisk_name = "ztadevspl01_data01_manageddisk"

        storage_account_type   = "Standard_LRS"
        create_option          = "Empty"
        disk_size_gb           = "64"
        #disk_encryption_set_id = 
        #disk_iops_read_write   = 
        #disk_mbps_read_write   = 
        #encryption_settings    = 
        #image_reference_id     = 
        #os_type                = 
        #source_resource_id     = 
        #source_uri             = 
        #storage_account_id     = 
        #zones                  = 
    }

    #ztadevspl01_datadiskattach
    module "ztademo_eastus2_dev_ztadevspl01_data01_datadiskattach" {
        source = "github.com/cantrellcloud/tfAzureModules/datadiskattach"
        #to_provision = local.provision_ztadevspl01_data01_datadiskattach
        managed_disk_id = module.ztademo_eastus2_dev_ztadevspl01_data01_manageddisk.manageddisk_id
        virtual_machine_id = module.ztademo_eastus2_dev_ztadevspl01_vmnix.vmnix_id
        lun = 10
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # ztademospl01_outputs
    output "ztademo_eastus2_dev_ztadevspl01_vmnix_id" {
        value = module.ztademo_eastus2_dev_ztadevspl01_vmnix.vmnix_id
    }
    output "ztademo_eastus2_dev_ztadevspl01_vmnix_name" {
        value = module.ztademo_eastus2_dev_ztadevspl01_vmnix.vmnix_name
    }
    output "ztademo_eastus2_dev_ztadevspl01_vmnix_computer_name" {
        value = module.ztademo_eastus2_dev_ztadevspl01_vmnix.vmnix_computer_name
    }
    output "ztademo_eastus2_dev_ztadevspl01_vmnix_private_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevspl01_vmnix.vmnix_private_ip_address
    }
    output "ztademo_eastus2_dev_ztadevspl01_vmnix_virtual_machine_id" {
        value = module.ztademo_eastus2_dev_ztadevspl01_vmnix.vmnix_virtual_machine_id
    }
    output "ztademo_eastus2_dev_ztadevspl01_vmnix_public_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevspl01_vmnix.vmnix_public_ip_address
    }

    #ztademospl01_publicip
/*    output "ztademo_eastus2_dev_ztadevspl01_publicip_id" {
        value = module.ztademo_eastus2_dev_ztadevspl01_publicip.publicip_id
    }
    output "ztademo_eastus2_dev_ztadevspl01_publicip_name" {
        value = module.ztademo_eastus2_dev_ztadevspl01_publicip.publicip_name
    }
    output "ztademo_eastus2_dev_ztadevspl01_publicip_domain_name_label" {
        value = module.ztademo_eastus2_dev_ztadevspl01_publicip.publicip_domain_name_label
    }
*/
	# ztademospl01_netinf_outputs
	output "ztademo_eastus2_dev_ztadevspl01_netinf_id" {
		value = module.ztademo_eastus2_dev_ztadevspl01_netinf.netinf_id
	}
	output "ztademo_eastus2_dev_ztadevspl01_netinf_name" {
		value = module.ztademo_eastus2_dev_ztadevspl01_netinf.netinf_name
	}
	output "ztademo_eastus2_dev_ztadevspl01_netinf_private_ip_address" {
		value = module.ztademo_eastus2_dev_ztadevspl01_netinf.netinf_private_ip_address
	}
	output "ztademo_eastus2_dev_ztadevspl01_netinf_virtual_machine_id" {
		value = module.ztademo_eastus2_dev_ztadevspl01_netinf.netinf_virtual_machine_id
	}

    # ztadevspl01_manageddisk_outputs
	output "ztademo_eastus2_dev_ztadevspl01_data01_manageddisk_id" {
		value = module.ztademo_eastus2_dev_ztadevspl01_data01_manageddisk.manageddisk_id
	}
	output "ztademo_eastus2_dev_ztadevspl01_data01_manageddisk_name" {
		value = module.ztademo_eastus2_dev_ztadevspl01_data01_manageddisk.manageddisk_name
	}

	# ztadevspl01_datadiskattach_outputs
    output "ztademo_eastus2_dev_ztadevspl01_data01_datadiskattach_id" {
		value = module.ztademo_eastus2_dev_ztadevspl01_data01_datadiskattach.datadiskattach_id
	}


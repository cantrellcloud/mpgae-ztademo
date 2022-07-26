#================================================================================
#
# ZTADEV
# Compute - Linux
#
#================================================================================
#
# LINUX VIRTUAL MACHINES, NETWORK INTERFACES, and PUBLIC IPs
#
# vmnix01
module "jtodev_eastus2_dev_jtodevnix01_vmnix" {
	source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-vmnix"
	#to_provision = local.provision_vmnix01
	rg_location = module.jtodev_eastus2_dev_rg.rg_location
	rg_name = module.jtodev_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "JTODev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vmnix_name = "jtodev-nix01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-nix01"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevnix01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "0001-com-ubuntu-server-focal"
    source_image_reference_sku       = "20_04-lts-gen2"
    #version   = "latest"
}

    # jtodevnix01_publicip
/*    module "jtodev_eastus2_dev_jtodevnix01_publicip" {
        source            = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-publicip"
        #to_provision     = local.provision_jtodevnix01_publicip
        rg_location       = module.jtodev_eastus2_dev_rg.rg_location
        rg_name           = module.jtodev_eastus2_dev_rg.rg_name
        publicip_name     = "jtodev_eastus2_dev_jtodevnix01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jtodev-nix01"
    }
*/
    # jtodevnix01_netinf
    module "jtodev_eastus2_dev_jtodevnix01_netinf" {
        source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-netinf"
        #to_provision = local.provision_jtodevnix01_netinf
        rg_location = module.jtodev_eastus2_dev_rg.rg_location
        rg_name = module.jtodev_eastus2_dev_rg.rg_name
    	rg_tags = {
	    	"ManagementGroup" = "MPG A&E EastUS2",
		    "Environment" = "JTODev",
    		"AutomatedBy" = "Terraform",
	    	"Note1" = "Do not manually change",
		    "POCName" = "ronc@mindpointgroup.com",
    		"POCPhone" = "843.330.6769",
		    "Project" = "Zero Trust Demo"
	    }

        netinf_name = "jtodevnix01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.6"
        ip_configuration_public_ip_address_id          = null # module.jtodev_eastus2_dev_jtodevnix01_publicip.publicip_id
}

    # jtodevnix01_outputs
    output "jtodev_eastus2_dev_jtodevnix01_vmnix_id" {
        value = module.jtodev_eastus2_dev_jtodevnix01_vmnix.vmnix_id
    }
    output "jtodev_eastus2_dev_jtodevnix01_vmnix_name" {
        value = module.jtodev_eastus2_dev_jtodevnix01_vmnix.vmnix_name
    }
    output "jtodev_eastus2_dev_jtodevnix01_vmnix_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevnix01_vmnix.vmnix_computer_name
    }
    output "jtodev_eastus2_dev_jtodevnix01_vmnix_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevnix01_vmnix.vmnix_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevnix01_vmnix_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevnix01_vmnix.vmnix_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevnix01_vmnix_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevnix01_vmnix.vmnix_public_ip_address
    }

    #jtodevnix01_publicip
/*    output "jtodev_eastus2_dev_jtodevnix01_publicip_id" {
        value = module.jtodev_eastus2_dev_jtodevnix01_publicip.publicip_id
    }
    output "jtodev_eastus2_dev_jtodevnix01_publicip_name" {
        value = module.jtodev_eastus2_dev_jtodevnix01_publicip.publicip_name
    }
    output "jtodev_eastus2_dev_jtodevnix01_publicip_domain_name_label" {
        value = module.jtodev_eastus2_dev_jtodevnix01_publicip.publicip_domain_name_label
    }
*/
	# jtodevnix01_netinf_outputs
	output "jtodev_eastus2_dev_jtodevnix01_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevnix01_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevnix01_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevnix01_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevnix01_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevnix01_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevnix01_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevnix01_netinf.netinf_virtual_machine_id
	}

# vmnix02
module "jtodev_eastus2_dev_jtodevnix02_vmnix" {
	source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-vmnix"
	#to_provision = local.provision_vmnix02
	rg_location = module.jtodev_eastus2_dev_rg.rg_location
	rg_name = module.jtodev_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "JTODev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vmnix_name = "jtodev-nix02"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-nix02"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevnix02_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "0001-com-ubuntu-server-focal"
    source_image_reference_sku       = "20_04-lts-gen2"
    #version   = "latest"
}

    # jtodevnix02_publicip
/*    module "jtodev_eastus2_dev_jtodevnix02_publicip" {
        source            = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-publicip"
        #to_provision     = local.provision_jtodevnix02_publicip
        rg_location       = module.jtodev_eastus2_dev_rg.rg_location
        rg_name           = module.jtodev_eastus2_dev_rg.rg_name
        publicip_name     = "jtodev_eastus2_dev_jtodevnix02_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jtodev-nix02"
    }
*/
    # jtodevnix02_netinf
    module "jtodev_eastus2_dev_jtodevnix02_netinf" {
        source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-netinf"
        #to_provision = local.provision_jtodevnix02_netinf
        rg_location = module.jtodev_eastus2_dev_rg.rg_location
        rg_name = module.jtodev_eastus2_dev_rg.rg_name
    	rg_tags = {
	    	"ManagementGroup" = "MPG A&E EastUS2",
		    "Environment" = "JTODev",
    		"AutomatedBy" = "Terraform",
	    	"Note1" = "Do not manually change",
		    "POCName" = "ronc@mindpointgroup.com",
    		"POCPhone" = "843.330.6769",
		    "Project" = "Zero Trust Demo"
	    }

        netinf_name = "jtodevnix02_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_web_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.41"
        ip_configuration_public_ip_address_id          = null # module.jtodev_eastus2_dev_jtodevnix02_publicip.publicip_id
}

    # jtodevnix02_outputs
    output "jtodev_eastus2_dev_jtodevnix02_vmnix_id" {
        value = module.jtodev_eastus2_dev_jtodevnix02_vmnix.vmnix_id
    }
    output "jtodev_eastus2_dev_jtodevnix02_vmnix_name" {
        value = module.jtodev_eastus2_dev_jtodevnix02_vmnix.vmnix_name
    }
    output "jtodev_eastus2_dev_jtodevnix02_vmnix_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevnix02_vmnix.vmnix_computer_name
    }
    output "jtodev_eastus2_dev_jtodevnix02_vmnix_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevnix02_vmnix.vmnix_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevnix02_vmnix_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevnix02_vmnix.vmnix_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevnix02_vmnix_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevnix02_vmnix.vmnix_public_ip_address
    }

    #jtodevnix02_publicip
/*    output "jtodev_eastus2_dev_jtodevnix02_publicip_id" {
        value = module.jtodev_eastus2_dev_jtodevnix02_publicip.publicip_id
    }
    output "jtodev_eastus2_dev_jtodevnix02_publicip_name" {
        value = module.jtodev_eastus2_dev_jtodevnix02_publicip.publicip_name
    }
    output "jtodev_eastus2_dev_jtodevnix02_publicip_domain_name_label" {
        value = module.jtodev_eastus2_dev_jtodevnix02_publicip.publicip_domain_name_label
    }
*/
	# jtodevnix02_netinf_outputs
	output "jtodev_eastus2_dev_jtodevnix02_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevnix02_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevnix02_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevnix02_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevnix02_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevnix02_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevnix02_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevnix02_netinf.netinf_virtual_machine_id
	}

# vmnix03
# ** ZTA Demo Splunk Server  **
# **      Do not delete      **
module "jtodev_eastus2_dev_jtodevspl01_vmnix" {
	source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-vmnix"
	#to_provision = local.provision_vmnix02
	rg_location = module.jtodev_eastus2_dev_rg.rg_location
	rg_name = module.jtodev_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment" = "JTODev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vmnix_name = "jtodev-spl01"
    size                  = "Standard_D4s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-spl01"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevspl01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "0001-com-ubuntu-server-focal"
    source_image_reference_sku       = "20_04-lts-gen2"
    #version   = "latest"
}

    # jtodevspl01_netinf
    module "jtodev_eastus2_dev_jtodevspl01_netinf" {
        source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-netinf"
        #to_provision = local.provision_jtodevspl01_netinf
        rg_location = module.jtodev_eastus2_dev_rg.rg_location
        rg_name = module.jtodev_eastus2_dev_rg.rg_name
    	rg_tags = {
	    	"ManagementGroup" = "MPG A&E EastUS2",
		    "Environment" = "JTODev",
    		"AutomatedBy" = "Terraform",
	    	"Note1" = "Do not manually change",
		    "POCName" = "ronc@mindpointgroup.com",
    		"POCPhone" = "843.330.6769",
		    "Project" = "Zero Trust Demo"
	    }

        netinf_name = "jtodevspl01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.30"
        ip_configuration_public_ip_address_id          = null # module.jtodev_eastus2_dev_jtodevspl01_publicip.publicip_id
}

    # jtodevspl01_manageddisk
    module "jtodev_eastus2_dev_jtodevspl01_data01_manageddisk" {
        source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-manageddisk"
        #to_provision = local.provision_jtodevspl01_manageddisk
        rg_location = module.jtodev_eastus2_dev_rg.rg_location
        rg_name = module.jtodev_eastus2_dev_rg.rg_name
        manageddisk_name = "jtodevspl01_data01_manageddisk"

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

    #jtodevspl01_datadiskattach
    module "jtodev_eastus2_dev_jtodevspl01_data01_datadiskattach" {
        source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-datadiskattach"
        #to_provision = local.provision_jtodevspl01_data01_datadiskattach
        managed_disk_id = module.jtodev_eastus2_dev_jtodevspl01_data01_manageddisk.manageddisk_id
        virtual_machine_id = module.jtodev_eastus2_dev_jtodevspl01_vmnix.vmnix_id
        lun = 10
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # jtodevspl01_outputs
    output "jtodev_eastus2_dev_jtodevspl01_vmnix_id" {
        value = module.jtodev_eastus2_dev_jtodevspl01_vmnix.vmnix_id
    }
    output "jtodev_eastus2_dev_jtodevspl01_vmnix_name" {
        value = module.jtodev_eastus2_dev_jtodevspl01_vmnix.vmnix_name
    }
    output "jtodev_eastus2_dev_jtodevspl01_vmnix_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevspl01_vmnix.vmnix_computer_name
    }
    output "jtodev_eastus2_dev_jtodevspl01_vmnix_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevspl01_vmnix.vmnix_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevspl01_vmnix_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevspl01_vmnix.vmnix_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevspl01_vmnix_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevspl01_vmnix.vmnix_public_ip_address
    }

	# jtodevspl01_netinf_outputs
	output "jtodev_eastus2_dev_jtodevspl01_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevspl01_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevspl01_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevspl01_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevspl01_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevspl01_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevspl01_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevspl01_netinf.netinf_virtual_machine_id
	}

    # jtodevspl01_manageddisk_outputs
	output "jtodev_eastus2_dev_jtodevspl01_data01_manageddisk_id" {
		value = module.jtodev_eastus2_dev_jtodevspl01_data01_manageddisk.manageddisk_id
	}
	output "jtodev_eastus2_dev_jtodevspl01_data01_manageddisk_name" {
		value = module.jtodev_eastus2_dev_jtodevspl01_data01_manageddisk.manageddisk_name
	}

	# jtodevspl01_datadiskattach_outputs
    output "jtodev_eastus2_dev_jtodevspl01_data01_datadiskattach_id" {
		value = module.jtodev_eastus2_dev_jtodevspl01_data01_datadiskattach.datadiskattach_id
	}

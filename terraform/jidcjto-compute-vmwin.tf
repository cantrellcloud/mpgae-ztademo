#================================================================================
#
# ZTADEV
# Compute - Windows
#
#================================================================================
#
# WINDOWS VIRTUAL MACHINES, NETWORK INTERFACES, and PUBLIC IPs
#
# jtodevdc01
module "jtodev_eastus2_dev_jtodevdc01_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin01
	rg_location = module.jtodev_eastus2_dev_rg.rg_location
	rg_name = module.jtodev_eastus2_dev_rg.rg_name
	rg_tags = {
        "Management Group" = "MPG A&E EastUS2",
		"Environment" = "JTODev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vmwin_name = "jtodev-dc01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-dc01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevdc01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # jtodevdc01_netinf
    module "jtodev_eastus2_dev_jtodevdc01_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_jtodevdc01_netinf
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

        netinf_name = "jtodevdc01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.11"
        ip_configuration_public_ip_address_id          = null # module.jtodev_eastus2_dev_jtodevdc01_publicip.publicip_id
    }

    # jtodevdc01_manageddisk
    module "jtodev_eastus2_dev_jtodevdc01_sysvol_manageddisk" {
        source = "github.com/cantrellcloud/tfaz-manageddisk"
        #to_provision = local.provision_jtodevdc01_manageddisk
        rg_location = module.jtodev_eastus2_dev_rg.rg_location
        rg_name = module.jtodev_eastus2_dev_rg.rg_name
        manageddisk_name = "jtodevdc01_sysvol_manageddisk"

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

    #jtodevdc01_datadiskattach
    module "jtodev_eastus2_dev_jtodevdc01_sysvol_datadiskattach" {
        source = "github.com/cantrellcloud/tfaz-datadiskattach"
        #to_provision = local.provision_jtodevdc01_sysvol_datadiskattach
        managed_disk_id = module.jtodev_eastus2_dev_jtodevdc01_sysvol_manageddisk.manageddisk_id
        virtual_machine_id = module.jtodev_eastus2_dev_jtodevdc01_vmwin.vmwin_id
        lun = 10
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # jtodevdc01_adbackup_manageddisk
    module "jtodev_eastus2_dev_jtodevdc01_adbackup_manageddisk" {
        source = "github.com/cantrellcloud/tfaz-manageddisk"
        #to_provision = local.provision_jtodevdc01_adbackup_manageddisk
        rg_location = module.jtodev_eastus2_dev_rg.rg_location
        rg_name = module.jtodev_eastus2_dev_rg.rg_name
        manageddisk_name = "jtodevdc01_adbackup_manageddisk"

        storage_account_type   = "Standard_LRS"
        create_option          = "Empty"
        disk_size_gb           = "128"
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

    #jtodevdc01_adbackup_datadiskattach
    module "jtodev_eastus2_dev_jtodevdc01_adbackup_datadiskattach" {
        source = "github.com/cantrellcloud/tfaz-datadiskattach"
        #to_provision = local.provision_jtodevdc01_adbackup_datadiskattach
        managed_disk_id = module.jtodev_eastus2_dev_jtodevdc01_adbackup_manageddisk.manageddisk_id
        virtual_machine_id = module.jtodev_eastus2_dev_jtodevdc01_vmwin.vmwin_id
        lun = 20
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # jtodevdc01_outputs
    output "jtodev_eastus2_dev_jtodevdc01_vmwin_id" {
        value = module.jtodev_eastus2_dev_jtodevdc01_vmwin.vmwin_id
    }
    output "jtodev_eastus2_dev_jtodevdc01_vmwin_name" {
        value = module.jtodev_eastus2_dev_jtodevdc01_vmwin.vmwin_name
    }
    output "jtodev_eastus2_dev_jtodevdc01_vmwin_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevdc01_vmwin.vmwin_computer_name
    }
    output "jtodev_eastus2_dev_jtodevdc01_vmwin_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevdc01_vmwin.vmwin_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevdc01_vmwin_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevdc01_vmwin.vmwin_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevdc01_vmwin_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevdc01_vmwin.vmwin_public_ip_address
    }

	# jtodevdc01_netinf_outputs
	output "jtodev_eastus2_dev_jtodevdc01_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevdc01_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevdc01_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevdc01_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevdc01_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevdc01_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevdc01_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevdc01_netinf.netinf_virtual_machine_id
	}

    # jtodevdc01_manageddisk_outputs
	output "jtodev_eastus2_dev_jtodevdc01_sysvol_manageddisk_id" {
		value = module.jtodev_eastus2_dev_jtodevdc01_sysvol_manageddisk.manageddisk_id
	}
	output "jtodev_eastus2_dev_jtodevdc01_sysvol_manageddisk_name" {
		value = module.jtodev_eastus2_dev_jtodevdc01_sysvol_manageddisk.manageddisk_name
	}

	# jtodevdc01_datadiskattach_outputs
    output "jtodev_eastus2_dev_jtodevdc01_sysvol_datadiskattach_id" {
		value = module.jtodev_eastus2_dev_jtodevdc01_sysvol_datadiskattach.datadiskattach_id
	}

    # jtodevdc01_adbackup_manageddisk_outputs
	output "jtodev_eastus2_dev_jtodevdc01_adbackup_manageddisk_id" {
		value = module.jtodev_eastus2_dev_jtodevdc01_adbackup_manageddisk.manageddisk_id
	}
	output "jtodev_eastus2_dev_jtodevdc01_adbackup_manageddisk_name" {
		value = module.jtodev_eastus2_dev_jtodevdc01_adbackup_manageddisk.manageddisk_name
	}

	# jtodevdc01_adbackup_datadiskattach_outputs
    output "jtodev_eastus2_dev_jtodevdc01_adbackup_datadiskattach_id" {
		value = module.jtodev_eastus2_dev_jtodevdc01_adbackup_datadiskattach.datadiskattach_id
	}

#########################################################################################

# jtodevdc02
module "jtodev_eastus2_dev_jtodevdc02_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin01
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

	vmwin_name = "jtodev-dc02"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-dc02"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevdc02_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # jtodevdc02_netinf
    module "jtodev_eastus2_dev_jtodevdc02_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_jtodevdc02_netinf
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

        netinf_name = "jtodevdc02_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.12"
        ip_configuration_public_ip_address_id          = null # module.jtodev_eastus2_dev_jtodevdc02_publicip.publicip_id
    }

    # jtodevdc02_manageddisk
    module "jtodev_eastus2_dev_jtodevdc02_sysvol_manageddisk" {
        source = "github.com/cantrellcloud/tfaz-manageddisk"
        #to_provision = local.provision_jtodevdc02_manageddisk
        rg_location = module.jtodev_eastus2_dev_rg.rg_location
        rg_name = module.jtodev_eastus2_dev_rg.rg_name
        manageddisk_name = "jtodevdc02_sysvol_manageddisk"

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

    #jtodevdc02_datadiskattach
    module "jtodev_eastus2_dev_jtodevdc02_sysvol_datadiskattach" {
        source = "github.com/cantrellcloud/tfaz-datadiskattach"
        #to_provision = local.provision_jtodevdc02_sysvol_datadiskattach
        managed_disk_id = module.jtodev_eastus2_dev_jtodevdc02_sysvol_manageddisk.manageddisk_id
        virtual_machine_id = module.jtodev_eastus2_dev_jtodevdc02_vmwin.vmwin_id
        lun = 10
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # jtodevdc02_adbackup_manageddisk
    module "jtodev_eastus2_dev_jtodevdc02_adbackup_manageddisk" {
        source = "github.com/cantrellcloud/tfaz-manageddisk"
        #to_provision = local.provision_jtodevdc02_adbackup_manageddisk
        rg_location = module.jtodev_eastus2_dev_rg.rg_location
        rg_name = module.jtodev_eastus2_dev_rg.rg_name
        manageddisk_name = "jtodevdc02_adbackup_manageddisk"

        storage_account_type   = "Standard_LRS"
        create_option          = "Empty"
        disk_size_gb           = "128"
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

    #jtodevdc02_adbackup_datadiskattach
    module "jtodev_eastus2_dev_jtodevdc02_adbackup_datadiskattach" {
        source = "github.com/cantrellcloud/tfaz-datadiskattach"
        #to_provision = local.provision_jtodevdc02_adbackup_datadiskattach
        managed_disk_id = module.jtodev_eastus2_dev_jtodevdc02_adbackup_manageddisk.manageddisk_id
        virtual_machine_id = module.jtodev_eastus2_dev_jtodevdc02_vmwin.vmwin_id
        lun = 20
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # jtodevdc02_outputs
    output "jtodev_eastus2_dev_jtodevdc02_vmwin_id" {
        value = module.jtodev_eastus2_dev_jtodevdc02_vmwin.vmwin_id
    }
    output "jtodev_eastus2_dev_jtodevdc02_vmwin_name" {
        value = module.jtodev_eastus2_dev_jtodevdc02_vmwin.vmwin_name
    }
    output "jtodev_eastus2_dev_jtodevdc02_vmwin_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevdc02_vmwin.vmwin_computer_name
    }
    output "jtodev_eastus2_dev_jtodevdc02_vmwin_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevdc02_vmwin.vmwin_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevdc02_vmwin_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevdc02_vmwin.vmwin_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevdc02_vmwin_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevdc02_vmwin.vmwin_public_ip_address
    }

	# jtodevdc02_netinf_outputs
	output "jtodev_eastus2_dev_jtodevdc02_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevdc02_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevdc02_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevdc02_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevdc02_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevdc02_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevdc02_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevdc02_netinf.netinf_virtual_machine_id
	}

	# jtodevdc02_manageddisk_outputs
	output "jtodev_eastus2_dev_jtodevdc02_sysvol_manageddisk_id" {
		value = module.jtodev_eastus2_dev_jtodevdc02_sysvol_manageddisk.manageddisk_id
	}
	output "jtodev_eastus2_dev_jtodevdc02_sysvol_manageddisk_name" {
		value = module.jtodev_eastus2_dev_jtodevdc02_sysvol_manageddisk.manageddisk_name
	}

	# jtodevdc02_datadiskattach_outputs
    output "jtodev_eastus2_dev_jtodevdc02_sysvol_datadiskattach_id" {
		value = module.jtodev_eastus2_dev_jtodevdc02_sysvol_datadiskattach.datadiskattach_id
	}

    # jtodevdc02_adbackup_manageddisk_outputs
	output "jtodev_eastus2_dev_jtodevdc02_adbackup_manageddisk_id" {
		value = module.jtodev_eastus2_dev_jtodevdc02_adbackup_manageddisk.manageddisk_id
	}
	output "jtodev_eastus2_dev_jtodevdc02_adbackup_manageddisk_name" {
		value = module.jtodev_eastus2_dev_jtodevdc02_adbackup_manageddisk.manageddisk_name
	}

	# jtodevdc02_adbackup_datadiskattach_outputs
    output "jtodev_eastus2_dev_jtodevdc02_adbackup_datadiskattach_id" {
		value = module.jtodev_eastus2_dev_jtodevdc02_adbackup_datadiskattach.datadiskattach_id
	}

#########################################################################################

# jtodevsubca01
module "jtodev_eastus2_dev_jtodevsubca01_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin03
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

	vmwin_name = "jtodev-subca01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-subca01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevsubca01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

   # jtodevsubca01_netinf
    module "jtodev_eastus2_dev_jtodevsubca01_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_jtodevsubca01_netinf
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

        netinf_name = "jtodevsubca01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.10"
        ip_configuration_public_ip_address_id          = null # module.jtodev_eastus2_dev_jtodevsubca01_publicip.publicip_id
}

    # jtodevsubca01_outputs
    output "jtodev_eastus2_dev_jtodevsubca01_vmwin_id" {
        value = module.jtodev_eastus2_dev_jtodevsubca01_vmwin.vmwin_id
    }
    output "jtodev_eastus2_dev_jtodevsubca01_vmwin_name" {
        value = module.jtodev_eastus2_dev_jtodevsubca01_vmwin.vmwin_name
    }
    output "jtodev_eastus2_dev_jtodevsubca01_vmwin_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevsubca01_vmwin.vmwin_computer_name
    }
    output "jtodev_eastus2_dev_jtodevsubca01_vmwin_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevsubca01_vmwin.vmwin_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevsubca01_vmwin_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevsubca01_vmwin.vmwin_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevsubca01_vmwin_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevsubca01_vmwin.vmwin_public_ip_address
    }

    # jtodevsubca01_netinf_outputs
	output "jtodev_eastus2_dev_jtodevsubca01_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevsubca01_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevsubca01_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevsubca01_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevsubca01_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevsubca01_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevsubca01_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevsubca01_netinf.netinf_virtual_machine_id
	}

#########################################################################################

# jtodevwks01
module "jtodev_eastus2_dev_jtodevwks01_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin02
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

	vmwin_name = "jtodev-wks01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-wks01"
    license_type          = "Windows_Client"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevwks01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsDesktop"
    source_image_reference_offer     = "Windows-10"
    source_image_reference_sku       = "20h2-pro-g2"
    #version   = "latest"
}

    # jtodevwks01_netinf
    module "jtodev_eastus2_dev_jtodevwks01_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_jtodevwks01_netinf
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

        netinf_name = "jtodevwks01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.5"
        ip_configuration_public_ip_address_id          = null # module.jtodev_eastus2_dev_jtodevwks01_publicip.publicip_id
}

    # jtodevwks01_outputs
    output "jtodev_eastus2_dev_jtodevwks01_vmwin_id" {
        value = module.jtodev_eastus2_dev_jtodevwks01_vmwin.vmwin_id
    }
    output "jtodev_eastus2_dev_jtodevwks01_vmwin_name" {
        value = module.jtodev_eastus2_dev_jtodevwks01_vmwin.vmwin_name
    }
    output "jtodev_eastus2_dev_jtodevwks01_vmwin_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevwks01_vmwin.vmwin_computer_name
    }
    output "jtodev_eastus2_dev_jtodevwks01_vmwin_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevwks01_vmwin.vmwin_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevwks01_vmwin_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevwks01_vmwin.vmwin_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevwks01_vmwin_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevwks01_vmwin.vmwin_public_ip_address
    }

    # jtodevwks01_netinf_outputs
	output "jtodev_eastus2_dev_jtodevwks01_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevwks01_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevwks01_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevwks01_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevwks01_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevwks01_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevwks01_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevwks01_netinf.netinf_virtual_machine_id
	}

#########################################################################################

# jtodevweb01
module "jtodev_eastus2_dev_jtodevweb01_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin03
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

	vmwin_name = "jtodev-web01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-web01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevweb01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

   # jtodevweb01_netinf
    module "jtodev_eastus2_dev_jtodevweb01_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_jtodevweb01_netinf
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

        netinf_name = "jtodevweb01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_web_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.42"
        ip_configuration_public_ip_address_id          = null #module.jtodev_eastus2_dev_appgate_web_publicip.publicip_id
}

    # jtodevweb01_outputs
    output "jtodev_eastus2_dev_jtodevweb01_vmwin_id" {
        value = module.jtodev_eastus2_dev_jtodevweb01_vmwin.vmwin_id
    }
    output "jtodev_eastus2_dev_jtodevweb01_vmwin_name" {
        value = module.jtodev_eastus2_dev_jtodevweb01_vmwin.vmwin_name
    }
    output "jtodev_eastus2_dev_jtodevweb01_vmwin_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevweb01_vmwin.vmwin_computer_name
    }
    output "jtodev_eastus2_dev_jtodevweb01_vmwin_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevweb01_vmwin.vmwin_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevweb01_vmwin_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevweb01_vmwin.vmwin_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevweb01_vmwin_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevweb01_vmwin.vmwin_public_ip_address
    }

    # jtodevweb01_netinf_outputs
	output "jtodev_eastus2_dev_jtodevweb01_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevweb01_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevweb01_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevweb01_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevweb01_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevweb01_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevweb01_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevweb01_netinf.netinf_virtual_machine_id
	}

#########################################################################################

# jtodevsp01
module "jtodev_eastus2_dev_jtodevsp01_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin05
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

	vmwin_name = "jtodev-sp01"
    size                  = "Standard_D4s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-sp01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevsp01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # jtodevsp01_netinf
    module "jtodev_eastus2_dev_jtodevsp01_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_jtodevsp01_netinf
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

        netinf_name = "jtodevsp01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.23"
        ip_configuration_public_ip_address_id          = null # module.jtodev_eastus2_dev_jtodevsp01_publicip.publicip_id
}

    # jtodevsp01_outputs
    output "jtodev_eastus2_dev_jtodevsp01_vmwin_id" {
        value = module.jtodev_eastus2_dev_jtodevsp01_vmwin.vmwin_id
    }
    output "jtodev_eastus2_dev_jtodevsp01_vmwin_name" {
        value = module.jtodev_eastus2_dev_jtodevsp01_vmwin.vmwin_name
    }
    output "jtodev_eastus2_dev_jtodevsp01_vmwin_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevsp01_vmwin.vmwin_computer_name
    }
    output "jtodev_eastus2_dev_jtodevsp01_vmwin_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevsp01_vmwin.vmwin_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevsp01_vmwin_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevsp01_vmwin.vmwin_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevsp01_vmwin_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevsp01_vmwin.vmwin_public_ip_address
    }

	# jtodevsp01_netinf_outputs
	output "jtodev_eastus2_dev_jtodevsp01_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevsp01_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevsp01_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevsp01_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevsp01_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevsp01_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevsp01_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevsp01_netinf.netinf_virtual_machine_id
	}

#########################################################################################

# jtodevex01
module "jtodev_eastus2_dev_jtodevex01_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin06
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

	vmwin_name = "jtodev-ex01"
    size                  = "Standard_D4s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-ex01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevex01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # jtodevex01_netinf
    module "jtodev_eastus2_dev_jtodevex01_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_jtodevex01_netinf
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

        netinf_name = "jtodevex01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.24"
        ip_configuration_public_ip_address_id          = null # module.jtodev_eastus2_dev_jtodevex01_publicip.publicip_id
}

    # jtodevex01_manageddisk
    module "jtodev_eastus2_dev_jtodevex01_mbdatabase_manageddisk" {
        source = "github.com/cantrellcloud/tfaz-manageddisk"
        #to_provision = local.provision_jtodevex01_manageddisk
        rg_location = module.jtodev_eastus2_dev_rg.rg_location
        rg_name = module.jtodev_eastus2_dev_rg.rg_name
        manageddisk_name = "jtodevex01_mbdatabase_manageddisk"

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

    #jtodevex01_datadiskattach
    module "jtodev_eastus2_dev_jtodevex01_mbdatabase_datadiskattach" {
        source = "github.com/cantrellcloud/tfaz-datadiskattach"
        #to_provision = local.provision_jtodevex01_mbdatabase_datadiskattach
        managed_disk_id = module.jtodev_eastus2_dev_jtodevex01_mbdatabase_manageddisk.manageddisk_id
        virtual_machine_id = module.jtodev_eastus2_dev_jtodevex01_vmwin.vmwin_id
        lun = 10
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # jtodevex01_outputs
    output "jtodev_eastus2_dev_jtodevex01_vmwin_id" {
        value = module.jtodev_eastus2_dev_jtodevex01_vmwin.vmwin_id
    }
    output "jtodev_eastus2_dev_jtodevex01_vmwin_name" {
        value = module.jtodev_eastus2_dev_jtodevex01_vmwin.vmwin_name
    }
    output "jtodev_eastus2_dev_jtodevex01_vmwin_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevex01_vmwin.vmwin_computer_name
    }
    output "jtodev_eastus2_dev_jtodevex01_vmwin_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevex01_vmwin.vmwin_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevex01_vmwin_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevex01_vmwin.vmwin_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevex01_vmwin_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevex01_vmwin.vmwin_public_ip_address
    }

	# jtodevex01_netinf_outputs
	output "jtodev_eastus2_dev_jtodevex01_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevex01_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevex01_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevex01_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevex01_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevex01_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevex01_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevex01_netinf.netinf_virtual_machine_id
	}

	# jtodevex01_manageddisk_outputs
	output "jtodev_eastus2_dev_jtodevex01_mbdatabase_manageddisk_id" {
		value = module.jtodev_eastus2_dev_jtodevex01_mbdatabase_manageddisk.manageddisk_id
	}
	output "jtodev_eastus2_dev_jtodevex01_mbdatabase_manageddisk_name" {
		value = module.jtodev_eastus2_dev_jtodevex01_mbdatabase_manageddisk.manageddisk_name
	}

	# jtodevex01_datadiskattach_outputs
    output "jtodev_eastus2_dev_jtodevex01_mbdatabase_datadiskattach_id" {
		value = module.jtodev_eastus2_dev_jtodevex01_mbdatabase_datadiskattach.datadiskattach_id
	}

#########################################################################################

# jtodevwks08
module "jtodev_eastus_dev_jtodevwks08_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin08
	rg_location = module.jtodev_eastus_dev_rg.rg_location
	rg_name = module.jtodev_eastus_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E eastus",
		"Environment" = "JTODev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vmwin_name = "jtodev-wks08"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-wks08"
    license_type          = "Windows_Client"
    network_interface_ids = [
        module.jtodev_eastus_dev_jtodevwks08_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsDesktop"
    source_image_reference_offer     = "Windows-10"
    source_image_reference_sku       = "20h2-pro-g2"
    #version   = "latest"
}

    # jtodevwks08_publicip
/*    module "jtodev_eastus_dev_jtodevwks08_publicip" {
        source            = "github.com/cantrellcloud/tfaz-publicip"
        #to_provision     = local.provision_jtodevwks08_publicip
        rg_location       = module.jtodev_eastus_dev_rg.rg_location
        rg_name           = module.jtodev_eastus_dev_rg.rg_name
        publicip_name     = "jtodev_eastus_dev_jtodevwks08_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jtodev-wks08"
    }
*/
    # jtodevwks08_netinf
    module "jtodev_eastus_dev_jtodevwks08_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_jtodevwks08_netinf
        rg_location = module.jtodev_eastus_dev_rg.rg_location
        rg_name = module.jtodev_eastus_dev_rg.rg_name
    	rg_tags = {
	    	"ManagementGroup" = "MPG A&E EastUS2",
		    "Environment" = "JTODev",
    		"AutomatedBy" = "Terraform",
	    	"Note1" = "Do not manually change",
		    "POCName" = "ronc@mindpointgroup.com",
    		"POCPhone" = "843.330.6769",
		    "Project" = "Zero Trust Demo"
	    }

        netinf_name = "jtodevwks08_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.202.5"
        ip_configuration_public_ip_address_id          = null # module.jtodev_eastus_dev_jtodevwks08_publicip.publicip_id
}

    # jtodevwks08_outputs
    output "jtodev_eastus_dev_jtodevwks08_vmwin_id" {
        value = module.jtodev_eastus_dev_jtodevwks08_vmwin.vmwin_id
    }
    output "jtodev_eastus_dev_jtodevwks08_vmwin_name" {
        value = module.jtodev_eastus_dev_jtodevwks08_vmwin.vmwin_name
    }
    output "jtodev_eastus_dev_jtodevwks08_vmwin_computer_name" {
        value = module.jtodev_eastus_dev_jtodevwks08_vmwin.vmwin_computer_name
    }
    output "jtodev_eastus_dev_jtodevwks08_vmwin_private_ip_address" {
        value = module.jtodev_eastus_dev_jtodevwks08_vmwin.vmwin_private_ip_address
    }
    output "jtodev_eastus_dev_jtodevwks08_vmwin_virtual_machine_id" {
        value = module.jtodev_eastus_dev_jtodevwks08_vmwin.vmwin_virtual_machine_id
    }
    output "jtodev_eastus_dev_jtodevwks08_vmwin_public_ip_address" {
        value = module.jtodev_eastus_dev_jtodevwks08_vmwin.vmwin_public_ip_address
    }

	#jtodevwks08_publicip_outputs
/*    output "jtodev_eastus_dev_jtodevwks08_publicip_id" {
        value = module.jtodev_eastus_dev_jtodevwks08_publicip.publicip_id
    }
    output "jtodev_eastus_dev_jtodevwks08_publicip_name" {
        value = module.jtodev_eastus_dev_jtodevwks08_publicip.publicip_name
    }
    output "jtodev_eastus_dev_jtodevwks08_publicip_domain_name_label" {
        value = module.jtodev_eastus_dev_jtodevwks08_publicip.publicip_domain_name_label
    }
*/
    # jtodevwks08_netinf_outputs
	output "jtodev_eastus_dev_jtodevwks08_netinf_id" {
		value = module.jtodev_eastus_dev_jtodevwks08_netinf.netinf_id
	}
	output "jtodev_eastus_dev_jtodevwks08_netinf_name" {
		value = module.jtodev_eastus_dev_jtodevwks08_netinf.netinf_name
	}
	output "jtodev_eastus_dev_jtodevwks08_netinf_private_ip_address" {
		value = module.jtodev_eastus_dev_jtodevwks08_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus_dev_jtodevwks08_netinf_virtual_machine_id" {
		value = module.jtodev_eastus_dev_jtodevwks08_netinf.netinf_virtual_machine_id
	}

#########################################################################################

# jtodevwks09
module "jtodev_westus_dev_jtodevwks09_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin09
	rg_location = module.jtodev_westus_dev_rg.rg_location
	rg_name = module.jtodev_westus_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E WestUS",
		"Environment" = "JTODev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vmwin_name = "jtodev-wks09"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-wks09"
    license_type          = "Windows_Client"
    network_interface_ids = [
        module.jtodev_westus_dev_jtodevwks09_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsDesktop"
    source_image_reference_offer     = "Windows-10"
    source_image_reference_sku       = "20h2-pro-g2"
    #version   = "latest"
}

/*
    # jtodevwks09_publicip
    module "jtodev_westus_dev_jtodevwks09_publicip" {
        source            = "github.com/cantrellcloud/tfaz-publicip"
        #to_provision     = local.provision_jtodevwks09_publicip
        rg_location       = module.jtodev_westus_dev_rg.rg_location
        rg_name           = module.jtodev_westus_dev_rg.rg_name
        publicip_name     = "jtodev_westus_dev_jtodevwks09_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jtodev-wks09"
    }
*/

    # jtodevwks09_netinf
    module "jtodev_westus_dev_jtodevwks09_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_jtodevwks09_netinf
        rg_location = module.jtodev_westus_dev_rg.rg_location
        rg_name = module.jtodev_westus_dev_rg.rg_name
    	rg_tags = {
	    	"ManagementGroup" = "MPG A&E WestUS",
		    "Environment" = "JTODev",
    		"AutomatedBy" = "Terraform",
	    	"Note1" = "Do not manually change",
		    "POCName" = "ronc@mindpointgroup.com",
    		"POCPhone" = "843.330.6769",
		    "Project" = "Zero Trust Demo"
	    }

        netinf_name = "jtodevwks09_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_westus_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.204.5"
        ip_configuration_public_ip_address_id          = null # module.jtodev_westus_dev_jtodevwks09_publicip.publicip_id
}

    # jtodevwks09_outputs
    output "jtodev_westus_dev_jtodevwks09_vmwin_id" {
        value = module.jtodev_westus_dev_jtodevwks09_vmwin.vmwin_id
    }
    output "jtodev_westus_dev_jtodevwks09_vmwin_name" {
        value = module.jtodev_westus_dev_jtodevwks09_vmwin.vmwin_name
    }
    output "jtodev_westus_dev_jtodevwks09_vmwin_computer_name" {
        value = module.jtodev_westus_dev_jtodevwks09_vmwin.vmwin_computer_name
    }
    output "jtodev_westus_dev_jtodevwks09_vmwin_private_ip_address" {
        value = module.jtodev_westus_dev_jtodevwks09_vmwin.vmwin_private_ip_address
    }
    output "jtodev_westus_dev_jtodevwks09_vmwin_virtual_machine_id" {
        value = module.jtodev_westus_dev_jtodevwks09_vmwin.vmwin_virtual_machine_id
    }
    output "jtodev_westus_dev_jtodevwks09_vmwin_public_ip_address" {
        value = module.jtodev_westus_dev_jtodevwks09_vmwin.vmwin_public_ip_address
    }

	#jtodevwks09_publicip_outputs
/*    output "jtodev_westus_dev_jtodevwks09_publicip_id" {
        value = module.jtodev_westus_dev_jtodevwks09_publicip.publicip_id
    }
    output "jtodev_westus_dev_jtodevwks09_publicip_name" {
        value = module.jtodev_westus_dev_jtodevwks09_publicip.publicip_name
    }
    output "jtodev_westus_dev_jtodevwks09_publicip_domain_name_label" {
        value = module.jtodev_westus_dev_jtodevwks09_publicip.publicip_domain_name_label
    }
*/
    # jtodevwks09_netinf_outputs
	output "jtodev_westus_dev_jtodevwks09_netinf_id" {
		value = module.jtodev_westus_dev_jtodevwks09_netinf.netinf_id
	}
	output "jtodev_westus_dev_jtodevwks09_netinf_name" {
		value = module.jtodev_westus_dev_jtodevwks09_netinf.netinf_name
	}
	output "jtodev_westus_dev_jtodevwks09_netinf_private_ip_address" {
		value = module.jtodev_westus_dev_jtodevwks09_netinf.netinf_private_ip_address
	}
	output "jtodev_westus_dev_jtodevwks09_netinf_virtual_machine_id" {
		value = module.jtodev_westus_dev_jtodevwks09_netinf.netinf_virtual_machine_id
	}

#########################################################################################

# jtodevwks10
module "jtodev_westus2_dev_jtodevwks10_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin10
	rg_location = module.jtodev_westus2_dev_rg.rg_location
	rg_name = module.jtodev_westus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E WestUS2",
		"Environment" = "JTODev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vmwin_name = "jtodev-wks10"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-wks10"
    license_type          = "Windows_Client"
    network_interface_ids = [
        module.jtodev_westus2_dev_jtodevwks10_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsDesktop"
    source_image_reference_offer     = "Windows-10"
    source_image_reference_sku       = "20h2-pro-g2"
    #version   = "latest"
}

/*
    # jtodevwks10_publicip
    module "jtodev_westus2_dev_jtodevwks10_publicip" {
        source            = "github.com/cantrellcloud/tfaz-publicip"
        #to_provision     = local.provision_jtodevwks10_publicip
        rg_location       = module.jtodev_westus2_dev_rg.rg_location
        rg_name           = module.jtodev_westus2_dev_rg.rg_name
        publicip_name     = "jtodev_westus2_dev_jtodevwks10_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jtodev-wks10"
    }
*/
    # jtodevwks10_netinf
    module "jtodev_westus2_dev_jtodevwks10_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_jtodevwks10_netinf
        rg_location = module.jtodev_westus2_dev_rg.rg_location
        rg_name = module.jtodev_westus2_dev_rg.rg_name
    	rg_tags = {
	    	"ManagementGroup" = "MPG A&E EastUS2",
		    "Environment" = "JTODev",
    		"AutomatedBy" = "Terraform",
	    	"Note1" = "Do not manually change",
		    "POCName" = "ronc@mindpointgroup.com",
    		"POCPhone" = "843.330.6769",
		    "Project" = "Zero Trust Demo"
	    }

        netinf_name = "jtodevwks10_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_westus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.206.5"
        ip_configuration_public_ip_address_id          = null # module.jtodev_westus2_dev_jtodevwks10_publicip.publicip_id
}

    # jtodevwks10_outputs
    output "jtodev_westus2_dev_jtodevwks10_vmwin_id" {
        value = module.jtodev_westus2_dev_jtodevwks10_vmwin.vmwin_id
    }
    output "jtodev_westus2_dev_jtodevwks10_vmwin_name" {
        value = module.jtodev_westus2_dev_jtodevwks10_vmwin.vmwin_name
    }
    output "jtodev_westus2_dev_jtodevwks10_vmwin_computer_name" {
        value = module.jtodev_westus2_dev_jtodevwks10_vmwin.vmwin_computer_name
    }
    output "jtodev_westus2_dev_jtodevwks10_vmwin_private_ip_address" {
        value = module.jtodev_westus2_dev_jtodevwks10_vmwin.vmwin_private_ip_address
    }
    output "jtodev_westus2_dev_jtodevwks10_vmwin_virtual_machine_id" {
        value = module.jtodev_westus2_dev_jtodevwks10_vmwin.vmwin_virtual_machine_id
    }
    output "jtodev_westus2_dev_jtodevwks10_vmwin_public_ip_address" {
        value = module.jtodev_westus2_dev_jtodevwks10_vmwin.vmwin_public_ip_address
    }

	#jtodevwks10_publicip_outputs
/*    output "jtodev_westus2_dev_jtodevwks10_publicip_id" {
        value = module.jtodev_westus2_dev_jtodevwks10_publicip.publicip_id
    }
    output "jtodev_westus2_dev_jtodevwks10_publicip_name" {
        value = module.jtodev_westus2_dev_jtodevwks10_publicip.publicip_name
    }
    output "jtodev_westus2_dev_jtodevwks10_publicip_domain_name_label" {
        value = module.jtodev_westus2_dev_jtodevwks10_publicip.publicip_domain_name_label
    }
*/

    # jtodevwks10_netinf_outputs
	output "jtodev_westus2_dev_jtodevwks10_netinf_id" {
		value = module.jtodev_westus2_dev_jtodevwks10_netinf.netinf_id
	}
	output "jtodev_westus2_dev_jtodevwks10_netinf_name" {
		value = module.jtodev_westus2_dev_jtodevwks10_netinf.netinf_name
	}
	output "jtodev_westus2_dev_jtodevwks10_netinf_private_ip_address" {
		value = module.jtodev_westus2_dev_jtodevwks10_netinf.netinf_private_ip_address
	}
	output "jtodev_westus2_dev_jtodevwks10_netinf_virtual_machine_id" {
		value = module.jtodev_westus2_dev_jtodevwks10_netinf.netinf_virtual_machine_id
	}


#########################################################################################

# jtodevjirsd01
module "jtodev_eastus2_dev_jtodevjirsd01_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_jtodevjirsd01
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

	vmwin_name = "jtodev-jirsd01"
    size                  = "Standard_D4s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-jirsd01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevjirsd01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

   # jtodevjirsd01_netinf
    module "jtodev_eastus2_dev_jtodevjirsd01_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_jtodevjirsd01_netinf
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

        netinf_name = "jtodevjirsd01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_web_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.60"
        ip_configuration_public_ip_address_id          = null # module.jtodev_eastus2_dev_jtodevjirsd01_publicip.publicip_id
}

    # jtodevjirsd01_outputs
    output "jtodev_eastus2_dev_jtodevjirsd01_vmwin_id" {
        value = module.jtodev_eastus2_dev_jtodevjirsd01_vmwin.vmwin_id
    }
    output "jtodev_eastus2_dev_jtodevjirsd01_vmwin_name" {
        value = module.jtodev_eastus2_dev_jtodevjirsd01_vmwin.vmwin_name
    }
    output "jtodev_eastus2_dev_jtodevjirsd01_vmwin_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevjirsd01_vmwin.vmwin_computer_name
    }
    output "jtodev_eastus2_dev_jtodevjirsd01_vmwin_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevjirsd01_vmwin.vmwin_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevjirsd01_vmwin_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevjirsd01_vmwin.vmwin_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevjirsd01_vmwin_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevjirsd01_vmwin.vmwin_public_ip_address
    }

    # jtodevjirsd01_netinf_outputs
	output "jtodev_eastus2_dev_jtodevjirsd01_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevjirsd01_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevjirsd01_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevjirsd01_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevjirsd01_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevjirsd01_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevjirsd01_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevjirsd01_netinf.netinf_virtual_machine_id
	}

#########################################################################################

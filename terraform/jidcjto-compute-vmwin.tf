#================================================================================
#
# ZTADEV
# Compute - Windows
#
#================================================================================
#
# WINDOWS VIRTUAL MACHINES, NETWORK INTERFACES, and PUBLIC IPs
#
# ztadevdc01
module "ztadev_eastus2_dev_ztadevdc01_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin01
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

	vmwin_name = "ztadev-dc01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-dc01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.ztadev_eastus2_dev_ztadevdc01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # ztadevdc01_netinf
    module "ztadev_eastus2_dev_ztadevdc01_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_ztadevdc01_netinf
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

        netinf_name = "ztadevdc01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztadev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.11"
        ip_configuration_public_ip_address_id          = null # module.ztadev_eastus2_dev_ztadevdc01_publicip.publicip_id
    }

    # ztadevdc01_manageddisk
    module "ztadev_eastus2_dev_ztadevdc01_sysvol_manageddisk" {
        source = "github.com/cantrellcloud/tfaz-manageddisk"
        #to_provision = local.provision_ztadevdc01_manageddisk
        rg_location = module.ztadev_eastus2_dev_rg.rg_location
        rg_name = module.ztadev_eastus2_dev_rg.rg_name
        manageddisk_name = "ztadevdc01_sysvol_manageddisk"

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

    #ztadevdc01_datadiskattach
    module "ztadev_eastus2_dev_ztadevdc01_sysvol_datadiskattach" {
        source = "github.com/cantrellcloud/tfaz-datadiskattach"
        #to_provision = local.provision_ztadevdc01_sysvol_datadiskattach
        managed_disk_id = module.ztadev_eastus2_dev_ztadevdc01_sysvol_manageddisk.manageddisk_id
        virtual_machine_id = module.ztadev_eastus2_dev_ztadevdc01_vmwin.vmwin_id
        lun = 10
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # ztadevdc01_outputs
    output "ztadev_eastus2_dev_ztadevdc01_vmwin_id" {
        value = module.ztadev_eastus2_dev_ztadevdc01_vmwin.vmwin_id
    }
    output "ztadev_eastus2_dev_ztadevdc01_vmwin_name" {
        value = module.ztadev_eastus2_dev_ztadevdc01_vmwin.vmwin_name
    }
    output "ztadev_eastus2_dev_ztadevdc01_vmwin_computer_name" {
        value = module.ztadev_eastus2_dev_ztadevdc01_vmwin.vmwin_computer_name
    }
    output "ztadev_eastus2_dev_ztadevdc01_vmwin_private_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevdc01_vmwin.vmwin_private_ip_address
    }
    output "ztadev_eastus2_dev_ztadevdc01_vmwin_virtual_machine_id" {
        value = module.ztadev_eastus2_dev_ztadevdc01_vmwin.vmwin_virtual_machine_id
    }
    output "ztadev_eastus2_dev_ztadevdc01_vmwin_public_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevdc01_vmwin.vmwin_public_ip_address
    }

	# ztadevdc01_netinf_outputs
	output "ztadev_eastus2_dev_ztadevdc01_netinf_id" {
		value = module.ztadev_eastus2_dev_ztadevdc01_netinf.netinf_id
	}
	output "ztadev_eastus2_dev_ztadevdc01_netinf_name" {
		value = module.ztadev_eastus2_dev_ztadevdc01_netinf.netinf_name
	}
	output "ztadev_eastus2_dev_ztadevdc01_netinf_private_ip_address" {
		value = module.ztadev_eastus2_dev_ztadevdc01_netinf.netinf_private_ip_address
	}
	output "ztadev_eastus2_dev_ztadevdc01_netinf_virtual_machine_id" {
		value = module.ztadev_eastus2_dev_ztadevdc01_netinf.netinf_virtual_machine_id
	}

    # ztadevdc01_manageddisk_outputs
	output "ztadev_eastus2_dev_ztadevdc01_sysvol_manageddisk_id" {
		value = module.ztadev_eastus2_dev_ztadevdc01_sysvol_manageddisk.manageddisk_id
	}
	output "ztadev_eastus2_dev_ztadevdc01_sysvol_manageddisk_name" {
		value = module.ztadev_eastus2_dev_ztadevdc01_sysvol_manageddisk.manageddisk_name
	}

	# ztadevdc01_datadiskattach_outputs
    output "ztadev_eastus2_dev_ztadevdc01_sysvol_datadiskattach_id" {
		value = module.ztadev_eastus2_dev_ztadevdc01_sysvol_datadiskattach.datadiskattach_id
	}

#########################################################################################

# ztadevdc02
module "ztadev_eastus2_dev_ztadevdc02_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin01
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

	vmwin_name = "ztadev-dc02"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-dc02"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.ztadev_eastus2_dev_ztadevdc02_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # ztadevdc02_netinf
    module "ztadev_eastus2_dev_ztadevdc02_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_ztadevdc02_netinf
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

        netinf_name = "ztadevdc02_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztadev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.12"
        ip_configuration_public_ip_address_id          = null # module.ztadev_eastus2_dev_ztadevdc02_publicip.publicip_id
    }

    # ztadevdc02_manageddisk
    module "ztadev_eastus2_dev_ztadevdc02_sysvol_manageddisk" {
        source = "github.com/cantrellcloud/tfaz-manageddisk"
        #to_provision = local.provision_ztadevdc02_manageddisk
        rg_location = module.ztadev_eastus2_dev_rg.rg_location
        rg_name = module.ztadev_eastus2_dev_rg.rg_name
        manageddisk_name = "ztadevdc02_sysvol_manageddisk"

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

    #ztadevdc02_datadiskattach
    module "ztadev_eastus2_dev_ztadevdc02_sysvol_datadiskattach" {
        source = "github.com/cantrellcloud/tfaz-datadiskattach"
        #to_provision = local.provision_ztadevdc02_sysvol_datadiskattach
        managed_disk_id = module.ztadev_eastus2_dev_ztadevdc02_sysvol_manageddisk.manageddisk_id
        virtual_machine_id = module.ztadev_eastus2_dev_ztadevdc02_vmwin.vmwin_id
        lun = 10
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # ztadevdc02_outputs
    output "ztadev_eastus2_dev_ztadevdc02_vmwin_id" {
        value = module.ztadev_eastus2_dev_ztadevdc02_vmwin.vmwin_id
    }
    output "ztadev_eastus2_dev_ztadevdc02_vmwin_name" {
        value = module.ztadev_eastus2_dev_ztadevdc02_vmwin.vmwin_name
    }
    output "ztadev_eastus2_dev_ztadevdc02_vmwin_computer_name" {
        value = module.ztadev_eastus2_dev_ztadevdc02_vmwin.vmwin_computer_name
    }
    output "ztadev_eastus2_dev_ztadevdc02_vmwin_private_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevdc02_vmwin.vmwin_private_ip_address
    }
    output "ztadev_eastus2_dev_ztadevdc02_vmwin_virtual_machine_id" {
        value = module.ztadev_eastus2_dev_ztadevdc02_vmwin.vmwin_virtual_machine_id
    }
    output "ztadev_eastus2_dev_ztadevdc02_vmwin_public_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevdc02_vmwin.vmwin_public_ip_address
    }

	# ztadevdc02_netinf_outputs
	output "ztadev_eastus2_dev_ztadevdc02_netinf_id" {
		value = module.ztadev_eastus2_dev_ztadevdc02_netinf.netinf_id
	}
	output "ztadev_eastus2_dev_ztadevdc02_netinf_name" {
		value = module.ztadev_eastus2_dev_ztadevdc02_netinf.netinf_name
	}
	output "ztadev_eastus2_dev_ztadevdc02_netinf_private_ip_address" {
		value = module.ztadev_eastus2_dev_ztadevdc02_netinf.netinf_private_ip_address
	}
	output "ztadev_eastus2_dev_ztadevdc02_netinf_virtual_machine_id" {
		value = module.ztadev_eastus2_dev_ztadevdc02_netinf.netinf_virtual_machine_id
	}

	# ztadevdc02_manageddisk_outputs
	output "ztadev_eastus2_dev_ztadevdc02_sysvol_manageddisk_id" {
		value = module.ztadev_eastus2_dev_ztadevdc02_sysvol_manageddisk.manageddisk_id
	}
	output "ztadev_eastus2_dev_ztadevdc02_sysvol_manageddisk_name" {
		value = module.ztadev_eastus2_dev_ztadevdc02_sysvol_manageddisk.manageddisk_name
	}

	# ztadevdc02_datadiskattach_outputs
    output "ztadev_eastus2_dev_ztadevdc02_sysvol_datadiskattach_id" {
		value = module.ztadev_eastus2_dev_ztadevdc02_sysvol_datadiskattach.datadiskattach_id
	}

#########################################################################################

# ztadevsubca01
module "ztadev_eastus2_dev_ztadevsubca01_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin03
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

	vmwin_name = "ztadev-subca01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-subca01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.ztadev_eastus2_dev_ztadevsubca01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

   # ztadevsubca01_netinf
    module "ztadev_eastus2_dev_ztadevsubca01_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_ztadevsubca01_netinf
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

        netinf_name = "ztadevsubca01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztadev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.10"
        ip_configuration_public_ip_address_id          = null # module.ztadev_eastus2_dev_ztadevsubca01_publicip.publicip_id
}

    # ztadevsubca01_outputs
    output "ztadev_eastus2_dev_ztadevsubca01_vmwin_id" {
        value = module.ztadev_eastus2_dev_ztadevsubca01_vmwin.vmwin_id
    }
    output "ztadev_eastus2_dev_ztadevsubca01_vmwin_name" {
        value = module.ztadev_eastus2_dev_ztadevsubca01_vmwin.vmwin_name
    }
    output "ztadev_eastus2_dev_ztadevsubca01_vmwin_computer_name" {
        value = module.ztadev_eastus2_dev_ztadevsubca01_vmwin.vmwin_computer_name
    }
    output "ztadev_eastus2_dev_ztadevsubca01_vmwin_private_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevsubca01_vmwin.vmwin_private_ip_address
    }
    output "ztadev_eastus2_dev_ztadevsubca01_vmwin_virtual_machine_id" {
        value = module.ztadev_eastus2_dev_ztadevsubca01_vmwin.vmwin_virtual_machine_id
    }
    output "ztadev_eastus2_dev_ztadevsubca01_vmwin_public_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevsubca01_vmwin.vmwin_public_ip_address
    }

    # ztadevsubca01_netinf_outputs
	output "ztadev_eastus2_dev_ztadevsubca01_netinf_id" {
		value = module.ztadev_eastus2_dev_ztadevsubca01_netinf.netinf_id
	}
	output "ztadev_eastus2_dev_ztadevsubca01_netinf_name" {
		value = module.ztadev_eastus2_dev_ztadevsubca01_netinf.netinf_name
	}
	output "ztadev_eastus2_dev_ztadevsubca01_netinf_private_ip_address" {
		value = module.ztadev_eastus2_dev_ztadevsubca01_netinf.netinf_private_ip_address
	}
	output "ztadev_eastus2_dev_ztadevsubca01_netinf_virtual_machine_id" {
		value = module.ztadev_eastus2_dev_ztadevsubca01_netinf.netinf_virtual_machine_id
	}

#########################################################################################

# ztadevwks01
module "ztadev_eastus2_dev_ztadevwks01_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin02
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

	vmwin_name = "ztadev-wks01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-wks01"
    license_type          = "Windows_Client"
    network_interface_ids = [
        module.ztadev_eastus2_dev_ztadevwks01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsDesktop"
    source_image_reference_offer     = "Windows-10"
    source_image_reference_sku       = "20h2-pro-g2"
    #version   = "latest"
}

    # ztadevwks01_netinf
    module "ztadev_eastus2_dev_ztadevwks01_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_ztadevwks01_netinf
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

        netinf_name = "ztadevwks01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztadev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.5"
        ip_configuration_public_ip_address_id          = null # module.ztadev_eastus2_dev_ztadevwks01_publicip.publicip_id
}

    # ztadevwks01_outputs
    output "ztadev_eastus2_dev_ztadevwks01_vmwin_id" {
        value = module.ztadev_eastus2_dev_ztadevwks01_vmwin.vmwin_id
    }
    output "ztadev_eastus2_dev_ztadevwks01_vmwin_name" {
        value = module.ztadev_eastus2_dev_ztadevwks01_vmwin.vmwin_name
    }
    output "ztadev_eastus2_dev_ztadevwks01_vmwin_computer_name" {
        value = module.ztadev_eastus2_dev_ztadevwks01_vmwin.vmwin_computer_name
    }
    output "ztadev_eastus2_dev_ztadevwks01_vmwin_private_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevwks01_vmwin.vmwin_private_ip_address
    }
    output "ztadev_eastus2_dev_ztadevwks01_vmwin_virtual_machine_id" {
        value = module.ztadev_eastus2_dev_ztadevwks01_vmwin.vmwin_virtual_machine_id
    }
    output "ztadev_eastus2_dev_ztadevwks01_vmwin_public_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevwks01_vmwin.vmwin_public_ip_address
    }

    # ztadevwks01_netinf_outputs
	output "ztadev_eastus2_dev_ztadevwks01_netinf_id" {
		value = module.ztadev_eastus2_dev_ztadevwks01_netinf.netinf_id
	}
	output "ztadev_eastus2_dev_ztadevwks01_netinf_name" {
		value = module.ztadev_eastus2_dev_ztadevwks01_netinf.netinf_name
	}
	output "ztadev_eastus2_dev_ztadevwks01_netinf_private_ip_address" {
		value = module.ztadev_eastus2_dev_ztadevwks01_netinf.netinf_private_ip_address
	}
	output "ztadev_eastus2_dev_ztadevwks01_netinf_virtual_machine_id" {
		value = module.ztadev_eastus2_dev_ztadevwks01_netinf.netinf_virtual_machine_id
	}

#########################################################################################

# ztadevweb01
module "ztadev_eastus2_dev_ztadevweb01_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin03
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

	vmwin_name = "ztadev-web01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-web01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.ztadev_eastus2_dev_ztadevweb01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

   # ztadevweb01_netinf
    module "ztadev_eastus2_dev_ztadevweb01_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_ztadevweb01_netinf
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

        netinf_name = "ztadevweb01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztadev_eastus2_dev_web_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.42"
        ip_configuration_public_ip_address_id          = module.ztadev_eastus2_dev_appgate_web_publicip.publicip_id
}

    # ztadevweb01_outputs
    output "ztadev_eastus2_dev_ztadevweb01_vmwin_id" {
        value = module.ztadev_eastus2_dev_ztadevweb01_vmwin.vmwin_id
    }
    output "ztadev_eastus2_dev_ztadevweb01_vmwin_name" {
        value = module.ztadev_eastus2_dev_ztadevweb01_vmwin.vmwin_name
    }
    output "ztadev_eastus2_dev_ztadevweb01_vmwin_computer_name" {
        value = module.ztadev_eastus2_dev_ztadevweb01_vmwin.vmwin_computer_name
    }
    output "ztadev_eastus2_dev_ztadevweb01_vmwin_private_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevweb01_vmwin.vmwin_private_ip_address
    }
    output "ztadev_eastus2_dev_ztadevweb01_vmwin_virtual_machine_id" {
        value = module.ztadev_eastus2_dev_ztadevweb01_vmwin.vmwin_virtual_machine_id
    }
    output "ztadev_eastus2_dev_ztadevweb01_vmwin_public_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevweb01_vmwin.vmwin_public_ip_address
    }

    # ztadevweb01_netinf_outputs
	output "ztadev_eastus2_dev_ztadevweb01_netinf_id" {
		value = module.ztadev_eastus2_dev_ztadevweb01_netinf.netinf_id
	}
	output "ztadev_eastus2_dev_ztadevweb01_netinf_name" {
		value = module.ztadev_eastus2_dev_ztadevweb01_netinf.netinf_name
	}
	output "ztadev_eastus2_dev_ztadevweb01_netinf_private_ip_address" {
		value = module.ztadev_eastus2_dev_ztadevweb01_netinf.netinf_private_ip_address
	}
	output "ztadev_eastus2_dev_ztadevweb01_netinf_virtual_machine_id" {
		value = module.ztadev_eastus2_dev_ztadevweb01_netinf.netinf_virtual_machine_id
	}

#########################################################################################

# ztadevsp01
module "ztadev_eastus2_dev_ztadevsp01_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin05
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

	vmwin_name = "ztadev-sp01"
    size                  = "Standard_D4s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-sp01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.ztadev_eastus2_dev_ztadevsp01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # ztadevsp01_netinf
    module "ztadev_eastus2_dev_ztadevsp01_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_ztadevsp01_netinf
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

        netinf_name = "ztadevsp01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztadev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.23"
        ip_configuration_public_ip_address_id          = null # module.ztadev_eastus2_dev_ztadevsp01_publicip.publicip_id
}

    # ztadevsp01_outputs
    output "ztadev_eastus2_dev_ztadevsp01_vmwin_id" {
        value = module.ztadev_eastus2_dev_ztadevsp01_vmwin.vmwin_id
    }
    output "ztadev_eastus2_dev_ztadevsp01_vmwin_name" {
        value = module.ztadev_eastus2_dev_ztadevsp01_vmwin.vmwin_name
    }
    output "ztadev_eastus2_dev_ztadevsp01_vmwin_computer_name" {
        value = module.ztadev_eastus2_dev_ztadevsp01_vmwin.vmwin_computer_name
    }
    output "ztadev_eastus2_dev_ztadevsp01_vmwin_private_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevsp01_vmwin.vmwin_private_ip_address
    }
    output "ztadev_eastus2_dev_ztadevsp01_vmwin_virtual_machine_id" {
        value = module.ztadev_eastus2_dev_ztadevsp01_vmwin.vmwin_virtual_machine_id
    }
    output "ztadev_eastus2_dev_ztadevsp01_vmwin_public_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevsp01_vmwin.vmwin_public_ip_address
    }

	# ztadevsp01_netinf_outputs
	output "ztadev_eastus2_dev_ztadevsp01_netinf_id" {
		value = module.ztadev_eastus2_dev_ztadevsp01_netinf.netinf_id
	}
	output "ztadev_eastus2_dev_ztadevsp01_netinf_name" {
		value = module.ztadev_eastus2_dev_ztadevsp01_netinf.netinf_name
	}
	output "ztadev_eastus2_dev_ztadevsp01_netinf_private_ip_address" {
		value = module.ztadev_eastus2_dev_ztadevsp01_netinf.netinf_private_ip_address
	}
	output "ztadev_eastus2_dev_ztadevsp01_netinf_virtual_machine_id" {
		value = module.ztadev_eastus2_dev_ztadevsp01_netinf.netinf_virtual_machine_id
	}

#########################################################################################

# ztadevex01
module "ztadev_eastus2_dev_ztadevex01_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin06
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

	vmwin_name = "ztadev-ex01"
    size                  = "Standard_D4s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-ex01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.ztadev_eastus2_dev_ztadevex01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # ztadevex01_netinf
    module "ztadev_eastus2_dev_ztadevex01_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_ztadevex01_netinf
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

        netinf_name = "ztadevex01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztadev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.24"
        ip_configuration_public_ip_address_id          = null # module.ztadev_eastus2_dev_ztadevex01_publicip.publicip_id
}

    # ztadevex01_manageddisk
    module "ztadev_eastus2_dev_ztadevex01_mbdatabase_manageddisk" {
        source = "github.com/cantrellcloud/tfaz-manageddisk"
        #to_provision = local.provision_ztadevex01_manageddisk
        rg_location = module.ztadev_eastus2_dev_rg.rg_location
        rg_name = module.ztadev_eastus2_dev_rg.rg_name
        manageddisk_name = "ztadevex01_mbdatabase_manageddisk"

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

    #ztadevex01_datadiskattach
    module "ztadev_eastus2_dev_ztadevex01_mbdatabase_datadiskattach" {
        source = "github.com/cantrellcloud/tfaz-datadiskattach"
        #to_provision = local.provision_ztadevex01_mbdatabase_datadiskattach
        managed_disk_id = module.ztadev_eastus2_dev_ztadevex01_mbdatabase_manageddisk.manageddisk_id
        virtual_machine_id = module.ztadev_eastus2_dev_ztadevex01_vmwin.vmwin_id
        lun = 10
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # ztadevex01_outputs
    output "ztadev_eastus2_dev_ztadevex01_vmwin_id" {
        value = module.ztadev_eastus2_dev_ztadevex01_vmwin.vmwin_id
    }
    output "ztadev_eastus2_dev_ztadevex01_vmwin_name" {
        value = module.ztadev_eastus2_dev_ztadevex01_vmwin.vmwin_name
    }
    output "ztadev_eastus2_dev_ztadevex01_vmwin_computer_name" {
        value = module.ztadev_eastus2_dev_ztadevex01_vmwin.vmwin_computer_name
    }
    output "ztadev_eastus2_dev_ztadevex01_vmwin_private_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevex01_vmwin.vmwin_private_ip_address
    }
    output "ztadev_eastus2_dev_ztadevex01_vmwin_virtual_machine_id" {
        value = module.ztadev_eastus2_dev_ztadevex01_vmwin.vmwin_virtual_machine_id
    }
    output "ztadev_eastus2_dev_ztadevex01_vmwin_public_ip_address" {
        value = module.ztadev_eastus2_dev_ztadevex01_vmwin.vmwin_public_ip_address
    }

	# ztadevex01_netinf_outputs
	output "ztadev_eastus2_dev_ztadevex01_netinf_id" {
		value = module.ztadev_eastus2_dev_ztadevex01_netinf.netinf_id
	}
	output "ztadev_eastus2_dev_ztadevex01_netinf_name" {
		value = module.ztadev_eastus2_dev_ztadevex01_netinf.netinf_name
	}
	output "ztadev_eastus2_dev_ztadevex01_netinf_private_ip_address" {
		value = module.ztadev_eastus2_dev_ztadevex01_netinf.netinf_private_ip_address
	}
	output "ztadev_eastus2_dev_ztadevex01_netinf_virtual_machine_id" {
		value = module.ztadev_eastus2_dev_ztadevex01_netinf.netinf_virtual_machine_id
	}

	# ztadevex01_manageddisk_outputs
	output "ztadev_eastus2_dev_ztadevex01_mbdatabase_manageddisk_id" {
		value = module.ztadev_eastus2_dev_ztadevex01_mbdatabase_manageddisk.manageddisk_id
	}
	output "ztadev_eastus2_dev_ztadevex01_mbdatabase_manageddisk_name" {
		value = module.ztadev_eastus2_dev_ztadevex01_mbdatabase_manageddisk.manageddisk_name
	}

	# ztadevex01_datadiskattach_outputs
    output "ztadev_eastus2_dev_ztadevex01_mbdatabase_datadiskattach_id" {
		value = module.ztadev_eastus2_dev_ztadevex01_mbdatabase_datadiskattach.datadiskattach_id
	}

#########################################################################################

# ztadevwks08
module "ztadev_eastus_dev_ztadevwks08_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin08
	rg_location = module.ztadev_eastus_dev_rg.rg_location
	rg_name = module.ztadev_eastus_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E eastus",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vmwin_name = "ztadev-wks08"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-wks08"
    license_type          = "Windows_Client"
    network_interface_ids = [
        module.ztadev_eastus_dev_ztadevwks08_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsDesktop"
    source_image_reference_offer     = "Windows-10"
    source_image_reference_sku       = "20h2-pro-g2"
    #version   = "latest"
}

    # ztadevwks08_publicip
/*    module "ztadev_eastus_dev_ztadevwks08_publicip" {
        source            = "github.com/cantrellcloud/tfaz-publicip"
        #to_provision     = local.provision_ztadevwks08_publicip
        rg_location       = module.ztadev_eastus_dev_rg.rg_location
        rg_name           = module.ztadev_eastus_dev_rg.rg_name
        publicip_name     = "ztadev_eastus_dev_ztadevwks08_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadev-wks08"
    }
*/
    # ztadevwks08_netinf
    module "ztadev_eastus_dev_ztadevwks08_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_ztadevwks08_netinf
        rg_location = module.ztadev_eastus_dev_rg.rg_location
        rg_name = module.ztadev_eastus_dev_rg.rg_name
    	rg_tags = {
	    	"ManagementGroup" = "MPG A&E EastUS2",
		    "Environment" = "Dev",
    		"AutomatedBy" = "Terraform",
	    	"Note1" = "Do not manually change",
		    "POCName" = "ronc@mindpointgroup.com",
    		"POCPhone" = "843.330.6769",
		    "Project" = "Zero Trust Demo"
	    }

        netinf_name = "ztadevwks08_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztadev_eastus_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.202.5"
        ip_configuration_public_ip_address_id          = null # module.ztadev_eastus_dev_ztadevwks08_publicip.publicip_id
}

    # ztadevwks08_outputs
    output "ztadev_eastus_dev_ztadevwks08_vmwin_id" {
        value = module.ztadev_eastus_dev_ztadevwks08_vmwin.vmwin_id
    }
    output "ztadev_eastus_dev_ztadevwks08_vmwin_name" {
        value = module.ztadev_eastus_dev_ztadevwks08_vmwin.vmwin_name
    }
    output "ztadev_eastus_dev_ztadevwks08_vmwin_computer_name" {
        value = module.ztadev_eastus_dev_ztadevwks08_vmwin.vmwin_computer_name
    }
    output "ztadev_eastus_dev_ztadevwks08_vmwin_private_ip_address" {
        value = module.ztadev_eastus_dev_ztadevwks08_vmwin.vmwin_private_ip_address
    }
    output "ztadev_eastus_dev_ztadevwks08_vmwin_virtual_machine_id" {
        value = module.ztadev_eastus_dev_ztadevwks08_vmwin.vmwin_virtual_machine_id
    }
    output "ztadev_eastus_dev_ztadevwks08_vmwin_public_ip_address" {
        value = module.ztadev_eastus_dev_ztadevwks08_vmwin.vmwin_public_ip_address
    }

	#ztadevwks08_publicip_outputs
/*    output "ztadev_eastus_dev_ztadevwks08_publicip_id" {
        value = module.ztadev_eastus_dev_ztadevwks08_publicip.publicip_id
    }
    output "ztadev_eastus_dev_ztadevwks08_publicip_name" {
        value = module.ztadev_eastus_dev_ztadevwks08_publicip.publicip_name
    }
    output "ztadev_eastus_dev_ztadevwks08_publicip_domain_name_label" {
        value = module.ztadev_eastus_dev_ztadevwks08_publicip.publicip_domain_name_label
    }
*/
    # ztadevwks08_netinf_outputs
	output "ztadev_eastus_dev_ztadevwks08_netinf_id" {
		value = module.ztadev_eastus_dev_ztadevwks08_netinf.netinf_id
	}
	output "ztadev_eastus_dev_ztadevwks08_netinf_name" {
		value = module.ztadev_eastus_dev_ztadevwks08_netinf.netinf_name
	}
	output "ztadev_eastus_dev_ztadevwks08_netinf_private_ip_address" {
		value = module.ztadev_eastus_dev_ztadevwks08_netinf.netinf_private_ip_address
	}
	output "ztadev_eastus_dev_ztadevwks08_netinf_virtual_machine_id" {
		value = module.ztadev_eastus_dev_ztadevwks08_netinf.netinf_virtual_machine_id
	}

#########################################################################################

# ztadevwks09
module "ztadev_westus_dev_ztadevwks09_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin09
	rg_location = module.ztadev_westus_dev_rg.rg_location
	rg_name = module.ztadev_westus_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E WestUS",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vmwin_name = "ztadev-wks09"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-wks09"
    license_type          = "Windows_Client"
    network_interface_ids = [
        module.ztadev_westus_dev_ztadevwks09_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsDesktop"
    source_image_reference_offer     = "Windows-10"
    source_image_reference_sku       = "20h2-pro-g2"
    #version   = "latest"
}

/*
    # ztadevwks09_publicip
    module "ztadev_westus_dev_ztadevwks09_publicip" {
        source            = "github.com/cantrellcloud/tfaz-publicip"
        #to_provision     = local.provision_ztadevwks09_publicip
        rg_location       = module.ztadev_westus_dev_rg.rg_location
        rg_name           = module.ztadev_westus_dev_rg.rg_name
        publicip_name     = "ztadev_westus_dev_ztadevwks09_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadev-wks09"
    }
*/

    # ztadevwks09_netinf
    module "ztadev_westus_dev_ztadevwks09_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_ztadevwks09_netinf
        rg_location = module.ztadev_westus_dev_rg.rg_location
        rg_name = module.ztadev_westus_dev_rg.rg_name
    	rg_tags = {
	    	"ManagementGroup" = "MPG A&E WestUS",
		    "Environment" = "Dev",
    		"AutomatedBy" = "Terraform",
	    	"Note1" = "Do not manually change",
		    "POCName" = "ronc@mindpointgroup.com",
    		"POCPhone" = "843.330.6769",
		    "Project" = "Zero Trust Demo"
	    }

        netinf_name = "ztadevwks09_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztadev_westus_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.204.5"
        ip_configuration_public_ip_address_id          = null # module.ztadev_westus_dev_ztadevwks09_publicip.publicip_id
}

    # ztadevwks09_outputs
    output "ztadev_westus_dev_ztadevwks09_vmwin_id" {
        value = module.ztadev_westus_dev_ztadevwks09_vmwin.vmwin_id
    }
    output "ztadev_westus_dev_ztadevwks09_vmwin_name" {
        value = module.ztadev_westus_dev_ztadevwks09_vmwin.vmwin_name
    }
    output "ztadev_westus_dev_ztadevwks09_vmwin_computer_name" {
        value = module.ztadev_westus_dev_ztadevwks09_vmwin.vmwin_computer_name
    }
    output "ztadev_westus_dev_ztadevwks09_vmwin_private_ip_address" {
        value = module.ztadev_westus_dev_ztadevwks09_vmwin.vmwin_private_ip_address
    }
    output "ztadev_westus_dev_ztadevwks09_vmwin_virtual_machine_id" {
        value = module.ztadev_westus_dev_ztadevwks09_vmwin.vmwin_virtual_machine_id
    }
    output "ztadev_westus_dev_ztadevwks09_vmwin_public_ip_address" {
        value = module.ztadev_westus_dev_ztadevwks09_vmwin.vmwin_public_ip_address
    }

	#ztadevwks09_publicip_outputs
/*    output "ztadev_westus_dev_ztadevwks09_publicip_id" {
        value = module.ztadev_westus_dev_ztadevwks09_publicip.publicip_id
    }
    output "ztadev_westus_dev_ztadevwks09_publicip_name" {
        value = module.ztadev_westus_dev_ztadevwks09_publicip.publicip_name
    }
    output "ztadev_westus_dev_ztadevwks09_publicip_domain_name_label" {
        value = module.ztadev_westus_dev_ztadevwks09_publicip.publicip_domain_name_label
    }
*/
    # ztadevwks09_netinf_outputs
	output "ztadev_westus_dev_ztadevwks09_netinf_id" {
		value = module.ztadev_westus_dev_ztadevwks09_netinf.netinf_id
	}
	output "ztadev_westus_dev_ztadevwks09_netinf_name" {
		value = module.ztadev_westus_dev_ztadevwks09_netinf.netinf_name
	}
	output "ztadev_westus_dev_ztadevwks09_netinf_private_ip_address" {
		value = module.ztadev_westus_dev_ztadevwks09_netinf.netinf_private_ip_address
	}
	output "ztadev_westus_dev_ztadevwks09_netinf_virtual_machine_id" {
		value = module.ztadev_westus_dev_ztadevwks09_netinf.netinf_virtual_machine_id
	}

#########################################################################################

# ztadevwks10
module "ztadev_westus2_dev_ztadevwks10_vmwin" {
	source = "github.com/cantrellcloud/tfaz-vmwin"
	#to_provision = local.provision_vmwin10
	rg_location = module.ztadev_westus2_dev_rg.rg_location
	rg_name = module.ztadev_westus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "MPG A&E WestUS2",
		"Environment" = "Dev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vmwin_name = "ztadev-wks10"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-wks10"
    license_type          = "Windows_Client"
    network_interface_ids = [
        module.ztadev_westus2_dev_ztadevwks10_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsDesktop"
    source_image_reference_offer     = "Windows-10"
    source_image_reference_sku       = "20h2-pro-g2"
    #version   = "latest"
}

/*
    # ztadevwks10_publicip
    module "ztadev_westus2_dev_ztadevwks10_publicip" {
        source            = "github.com/cantrellcloud/tfaz-publicip"
        #to_provision     = local.provision_ztadevwks10_publicip
        rg_location       = module.ztadev_westus2_dev_rg.rg_location
        rg_name           = module.ztadev_westus2_dev_rg.rg_name
        publicip_name     = "ztadev_westus2_dev_ztadevwks10_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadev-wks10"
    }
*/
    # ztadevwks10_netinf
    module "ztadev_westus2_dev_ztadevwks10_netinf" {
        source = "github.com/cantrellcloud/tfaz-netinf"
        #to_provision = local.provision_ztadevwks10_netinf
        rg_location = module.ztadev_westus2_dev_rg.rg_location
        rg_name = module.ztadev_westus2_dev_rg.rg_name
    	rg_tags = {
	    	"ManagementGroup" = "MPG A&E EastUS2",
		    "Environment" = "Dev",
    		"AutomatedBy" = "Terraform",
	    	"Note1" = "Do not manually change",
		    "POCName" = "ronc@mindpointgroup.com",
    		"POCPhone" = "843.330.6769",
		    "Project" = "Zero Trust Demo"
	    }

        netinf_name = "ztadevwks10_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztadev_westus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.206.5"
        ip_configuration_public_ip_address_id          = null # module.ztadev_westus2_dev_ztadevwks10_publicip.publicip_id
}

    # ztadevwks10_outputs
    output "ztadev_westus2_dev_ztadevwks10_vmwin_id" {
        value = module.ztadev_westus2_dev_ztadevwks10_vmwin.vmwin_id
    }
    output "ztadev_westus2_dev_ztadevwks10_vmwin_name" {
        value = module.ztadev_westus2_dev_ztadevwks10_vmwin.vmwin_name
    }
    output "ztadev_westus2_dev_ztadevwks10_vmwin_computer_name" {
        value = module.ztadev_westus2_dev_ztadevwks10_vmwin.vmwin_computer_name
    }
    output "ztadev_westus2_dev_ztadevwks10_vmwin_private_ip_address" {
        value = module.ztadev_westus2_dev_ztadevwks10_vmwin.vmwin_private_ip_address
    }
    output "ztadev_westus2_dev_ztadevwks10_vmwin_virtual_machine_id" {
        value = module.ztadev_westus2_dev_ztadevwks10_vmwin.vmwin_virtual_machine_id
    }
    output "ztadev_westus2_dev_ztadevwks10_vmwin_public_ip_address" {
        value = module.ztadev_westus2_dev_ztadevwks10_vmwin.vmwin_public_ip_address
    }

	#ztadevwks10_publicip_outputs
/*    output "ztadev_westus2_dev_ztadevwks10_publicip_id" {
        value = module.ztadev_westus2_dev_ztadevwks10_publicip.publicip_id
    }
    output "ztadev_westus2_dev_ztadevwks10_publicip_name" {
        value = module.ztadev_westus2_dev_ztadevwks10_publicip.publicip_name
    }
    output "ztadev_westus2_dev_ztadevwks10_publicip_domain_name_label" {
        value = module.ztadev_westus2_dev_ztadevwks10_publicip.publicip_domain_name_label
    }
*/

    # ztadevwks10_netinf_outputs
	output "ztadev_westus2_dev_ztadevwks10_netinf_id" {
		value = module.ztadev_westus2_dev_ztadevwks10_netinf.netinf_id
	}
	output "ztadev_westus2_dev_ztadevwks10_netinf_name" {
		value = module.ztadev_westus2_dev_ztadevwks10_netinf.netinf_name
	}
	output "ztadev_westus2_dev_ztadevwks10_netinf_private_ip_address" {
		value = module.ztadev_westus2_dev_ztadevwks10_netinf.netinf_private_ip_address
	}
	output "ztadev_westus2_dev_ztadevwks10_netinf_virtual_machine_id" {
		value = module.ztadev_westus2_dev_ztadevwks10_netinf.netinf_virtual_machine_id
	}


#########################################################################################

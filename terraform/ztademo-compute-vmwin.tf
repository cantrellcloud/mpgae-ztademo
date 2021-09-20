#================================================================================
#
# ZTADEMO
# COMPUTE-VMWIN.TF
#
#================================================================================
#
# WINDOWS VIRTUAL MACHINES, NETWORK INTERFACES, and PUBLIC IPs

# vmwin01
module "ztademo_eastus2_dev_ztadevdc01_vmwin" {
	source = "github.com/cantrellcloud/tfAzureModules/vmwin"
	#to_provision = local.provision_vmwin01
	rg_location = module.ztademo_eastus2_dev_rg.rg_location
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "A&E 700 R&D",
		"Environment" = "Demo",
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
        module.ztademo_eastus2_dev_ztadevdc01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # ztadevdc01_netinf
    module "ztademo_eastus2_dev_ztadevdc01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_ztadevdc01_netinf
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
        netinf_name = "ztadevdc01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztademo_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.11"
        ip_configuration_public_ip_address_id          = module.ztademo_eastus2_dev_ztadevdc01_publicip.publicip_id
    }

    # ztadevdc01_publicip
    module "ztademo_eastus2_dev_ztadevdc01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_ztadevdc01_publicip
        rg_location       = module.ztademo_eastus2_dev_rg.rg_location
        rg_name           = module.ztademo_eastus2_dev_rg.rg_name
        publicip_name     = "ztademo_eastus2_dev_ztadevdc01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadev-dc01"
    }

    # ztadevdc01_manageddisk
    module "ztademo_eastus2_dev_ztadevdc01_sysvol_manageddisk" {
        source = "github.com/cantrellcloud/tfAzureModules/manageddisk"
        #to_provision = local.provision_ztadevdc01_manageddisk
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
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
    module "ztademo_eastus2_dev_ztadevdc01_sysvol_datadiskattach" {
        source = "github.com/cantrellcloud/tfAzureModules/datadiskattach"
        #to_provision = local.provision_ztadevdc01_sysvol_datadiskattach
        managed_disk_id = module.ztademo_eastus2_dev_ztadevdc01_sysvol_manageddisk.manageddisk_id
        virtual_machine_id = module.ztademo_eastus2_dev_ztadevdc01_vmwin.vmwin_id
        lun = 10
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # ztadevdc01_outputs
    output "ztademo_eastus2_dev_ztadevdc01_vmwin_id" {
        value = module.ztademo_eastus2_dev_ztadevdc01_vmwin.vmwin_id
    }
    output "ztademo_eastus2_dev_ztadevdc01_vmwin_name" {
        value = module.ztademo_eastus2_dev_ztadevdc01_vmwin.vmwin_name
    }
    output "ztademo_eastus2_dev_ztadevdc01_vmwin_computer_name" {
        value = module.ztademo_eastus2_dev_ztadevdc01_vmwin.vmwin_computer_name
    }
    output "ztademo_eastus2_dev_ztadevdc01_vmwin_private_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevdc01_vmwin.vmwin_private_ip_address
    }
    output "ztademo_eastus2_dev_ztadevdc01_vmwin_virtual_machine_id" {
        value = module.ztademo_eastus2_dev_ztadevdc01_vmwin.vmwin_virtual_machine_id
    }
    output "ztademo_eastus2_dev_ztadevdc01_vmwin_public_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevdc01_vmwin.vmwin_public_ip_address
    }

	#ztadevdc01_publicip_outputs
    output "ztademo_eastus2_dev_ztadevdc01_publicip_id" {
        value = module.ztademo_eastus2_dev_ztadevdc01_publicip.publicip_id
    }
    output "ztademo_eastus2_dev_ztadevdc01_publicip_name" {
        value = module.ztademo_eastus2_dev_ztadevdc01_publicip.publicip_name
    }
    output "ztademo_eastus2_dev_ztadevdc01_publicip_domain_name_label" {
        value = module.ztademo_eastus2_dev_ztadevdc01_publicip.publicip_domain_name_label
    }

	# ztadevdc01_netinf_outputs
	output "ztademo_eastus2_dev_ztadevdc01_netinf_id" {
		value = module.ztademo_eastus2_dev_ztadevdc01_netinf.netinf_id
	}
	output "ztademo_eastus2_dev_ztadevdc01_netinf_name" {
		value = module.ztademo_eastus2_dev_ztadevdc01_netinf.netinf_name
	}
	output "ztademo_eastus2_dev_ztadevdc01_netinf_private_ip_address" {
		value = module.ztademo_eastus2_dev_ztadevdc01_netinf.netinf_private_ip_address
	}
	output "ztademo_eastus2_dev_ztadevdc01_netinf_virtual_machine_id" {
		value = module.ztademo_eastus2_dev_ztadevdc01_netinf.netinf_virtual_machine_id
	}

    # ztadevdc01_manageddisk_outputs
	output "ztademo_eastus2_dev_ztadevdc01_sysvol_manageddisk_id" {
		value = module.ztademo_eastus2_dev_ztadevdc01_sysvol_manageddisk.manageddisk_id
	}
	output "ztademo_eastus2_dev_ztadevdc01_sysvol_manageddisk_name" {
		value = module.ztademo_eastus2_dev_ztadevdc01_sysvol_manageddisk.manageddisk_name
	}

	# ztadevdc01_datadiskattach_outputs
    output "ztademo_eastus2_dev_ztadevdc01_sysvol_datadiskattach_id" {
		value = module.ztademo_eastus2_dev_ztadevdc01_sysvol_datadiskattach.datadiskattach_id
	}

# vmwin02
module "ztademo_eastus2_dev_ztadevwks01_vmwin" {
	source = "github.com/cantrellcloud/tfAzureModules/vmwin"
	#to_provision = local.provision_vmwin02
	rg_location = module.ztademo_eastus2_dev_rg.rg_location
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "A&E 700 R&D",
		"Environment" = "Demo",
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
        module.ztademo_eastus2_dev_ztadevwks01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsDesktop"
    source_image_reference_offer     = "Windows-10"
    source_image_reference_sku       = "20h2-pro-g2"
    #version   = "latest"
}

    # ztadevwks01_publicip
    module "ztademo_eastus2_dev_ztadevwks01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_ztadevwks01_publicip
        rg_location       = module.ztademo_eastus2_dev_rg.rg_location
        rg_name           = module.ztademo_eastus2_dev_rg.rg_name
        publicip_name     = "ztademo_eastus2_dev_ztadevwks01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadev-wks01"
    }

    # ztadevwks01_netinf
    module "ztademo_eastus2_dev_ztadevwks01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_ztadevwks01_netinf
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
        netinf_name = "ztadevwks01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztademo_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.5"
        ip_configuration_public_ip_address_id          = module.ztademo_eastus2_dev_ztadevwks01_publicip.publicip_id
}

    # ztadevwks01_outputs
    output "ztademo_eastus2_dev_ztadevwks01_vmwin_id" {
        value = module.ztademo_eastus2_dev_ztadevwks01_vmwin.vmwin_id
    }
    output "ztademo_eastus2_dev_ztadevwks01_vmwin_name" {
        value = module.ztademo_eastus2_dev_ztadevwks01_vmwin.vmwin_name
    }
    output "ztademo_eastus2_dev_ztadevwks01_vmwin_computer_name" {
        value = module.ztademo_eastus2_dev_ztadevwks01_vmwin.vmwin_computer_name
    }
    output "ztademo_eastus2_dev_ztadevwks01_vmwin_private_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevwks01_vmwin.vmwin_private_ip_address
    }
    output "ztademo_eastus2_dev_ztadevwks01_vmwin_virtual_machine_id" {
        value = module.ztademo_eastus2_dev_ztadevwks01_vmwin.vmwin_virtual_machine_id
    }
    output "ztademo_eastus2_dev_ztadevwks01_vmwin_public_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevwks01_vmwin.vmwin_public_ip_address
    }

	#ztadevwks01_publicip_outputs
    output "ztademo_eastus2_dev_ztadevwks01_publicip_id" {
        value = module.ztademo_eastus2_dev_ztadevwks01_publicip.publicip_id
    }
    output "ztademo_eastus2_dev_ztadevwks01_publicip_name" {
        value = module.ztademo_eastus2_dev_ztadevwks01_publicip.publicip_name
    }
    output "ztademo_eastus2_dev_ztadevwks01_publicip_domain_name_label" {
        value = module.ztademo_eastus2_dev_ztadevwks01_publicip.publicip_domain_name_label
    }

    # ztadevwks01_netinf_outputs
	output "ztademo_eastus2_dev_ztadevwks01_netinf_id" {
		value = module.ztademo_eastus2_dev_ztadevwks01_netinf.netinf_id
	}
	output "ztademo_eastus2_dev_ztadevwks01_netinf_name" {
		value = module.ztademo_eastus2_dev_ztadevwks01_netinf.netinf_name
	}
	output "ztademo_eastus2_dev_ztadevwks01_netinf_private_ip_address" {
		value = module.ztademo_eastus2_dev_ztadevwks01_netinf.netinf_private_ip_address
	}
	output "ztademo_eastus2_dev_ztadevwks01_netinf_virtual_machine_id" {
		value = module.ztademo_eastus2_dev_ztadevwks01_netinf.netinf_virtual_machine_id
	}

# vmwin03
module "ztademo_eastus2_dev_ztadevjpc01_vmwin" {
	source = "github.com/cantrellcloud/tfAzureModules/vmwin"
	#to_provision = local.provision_vmwin03
	rg_location = module.ztademo_eastus2_dev_rg.rg_location
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "A&E 700 R&D",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vmwin_name = "ztadev-jpc01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-jpc01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.ztademo_eastus2_dev_ztadevjpc01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # ztadevajpc01_publicip
    module "ztademo_eastus2_dev_ztadevjpc01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_ztadevjpc01_publicip
        rg_location       = module.ztademo_eastus2_dev_rg.rg_location
        rg_name           = module.ztademo_eastus2_dev_rg.rg_name
        publicip_name     = "ztademo_eastus2_dev_ztadevjpc01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadev-jpc01"
    }

   # ztadevjpc01_netinf
    module "ztademo_eastus2_dev_ztadevjpc01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_ztadevjpc01_netinf
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
        netinf_name = "ztadevjpc01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztademo_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.22"
        ip_configuration_public_ip_address_id          = module.ztademo_eastus2_dev_ztadevjpc01_publicip.publicip_id
}

    # ztadevjpc01_outputs
    output "ztademo_eastus2_dev_ztadevjpc01_vmwin_id" {
        value = module.ztademo_eastus2_dev_ztadevjpc01_vmwin.vmwin_id
    }
    output "ztademo_eastus2_dev_ztadevjpc01_vmwin_name" {
        value = module.ztademo_eastus2_dev_ztadevjpc01_vmwin.vmwin_name
    }
    output "ztademo_eastus2_dev_ztadevjpc01_vmwin_computer_name" {
        value = module.ztademo_eastus2_dev_ztadevjpc01_vmwin.vmwin_computer_name
    }
    output "ztademo_eastus2_dev_ztadevjpc01_vmwin_private_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevjpc01_vmwin.vmwin_private_ip_address
    }
    output "ztademo_eastus2_dev_ztadevjpc01_vmwin_virtual_machine_id" {
        value = module.ztademo_eastus2_dev_ztadevjpc01_vmwin.vmwin_virtual_machine_id
    }
    output "ztademo_eastus2_dev_ztadevjpc01_vmwin_public_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevjpc01_vmwin.vmwin_public_ip_address
    }

	#ztadevjpc01_publicip_outputs
    output "ztademo_eastus2_dev_ztadevjpc01_publicip_id" {
        value = module.ztademo_eastus2_dev_ztadevjpc01_publicip.publicip_id
    }
    output "ztademo_eastus2_dev_ztadevjpc01_publicip_name" {
        value = module.ztademo_eastus2_dev_ztadevjpc01_publicip.publicip_name
    }
    output "ztademo_eastus2_dev_ztadevjpc01_publicip_domain_name_label" {
        value = module.ztademo_eastus2_dev_ztadevjpc01_publicip.publicip_domain_name_label
    }

    # ztadevjpc01_netinf_outputs
	output "ztademo_eastus2_dev_ztadevjpc01_netinf_id" {
		value = module.ztademo_eastus2_dev_ztadevjpc01_netinf.netinf_id
	}
	output "ztademo_eastus2_dev_ztadevjpc01_netinf_name" {
		value = module.ztademo_eastus2_dev_ztadevjpc01_netinf.netinf_name
	}
	output "ztademo_eastus2_dev_ztadevjpc01_netinf_private_ip_address" {
		value = module.ztademo_eastus2_dev_ztadevjpc01_netinf.netinf_private_ip_address
	}
	output "ztademo_eastus2_dev_ztadevjpc01_netinf_virtual_machine_id" {
		value = module.ztademo_eastus2_dev_ztadevjpc01_netinf.netinf_virtual_machine_id
	}

# vmwin04
module "ztademo_eastus2_dev_ztadevncc01_vmwin" {
	source = "github.com/cantrellcloud/tfAzureModules/vmwin"
	#to_provision = local.provision_vmwin04
	rg_location = module.ztademo_eastus2_dev_rg.rg_location
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "A&E 700 R&D",
		"Environment" = "Demo",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

	vmwin_name = "ztadev-ncc01"
    size                  = "Standard_D4s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "ztadev-ncc01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.ztademo_eastus2_dev_ztadevncc01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # ztadevancc01_publicip
    module "ztademo_eastus2_dev_ztadevncc01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_ztadevncc01_publicip
        rg_location       = module.ztademo_eastus2_dev_rg.rg_location
        rg_name           = module.ztademo_eastus2_dev_rg.rg_name
        publicip_name     = "ztademo_eastus2_dev_ztadevncc01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadev-ncc01"
    }

    # ztadevncc01_netinf
    module "ztademo_eastus2_dev_ztadevncc01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_ztadevncc01_netinf
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
        netinf_name = "ztadevncc01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztademo_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.20"
        ip_configuration_public_ip_address_id          = module.ztademo_eastus2_dev_ztadevncc01_publicip.publicip_id
}

    # ztadevncc01_outputs
    output "ztademo_eastus2_dev_ztadevncc01_vmwin_id" {
        value = module.ztademo_eastus2_dev_ztadevncc01_vmwin.vmwin_id
    }
    output "ztademo_eastus2_dev_ztadevncc01_vmwin_name" {
        value = module.ztademo_eastus2_dev_ztadevncc01_vmwin.vmwin_name
    }
    output "ztademo_eastus2_dev_ztadevncc01_vmwin_computer_name" {
        value = module.ztademo_eastus2_dev_ztadevncc01_vmwin.vmwin_computer_name
    }
    output "ztademo_eastus2_dev_ztadevncc01_vmwin_private_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevncc01_vmwin.vmwin_private_ip_address
    }
    output "ztademo_eastus2_dev_ztadevncc01_vmwin_virtual_machine_id" {
        value = module.ztademo_eastus2_dev_ztadevncc01_vmwin.vmwin_virtual_machine_id
    }
    output "ztademo_eastus2_dev_ztadevncc01_vmwin_public_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevncc01_vmwin.vmwin_public_ip_address
    }

    #ztadevncc01_publicip_outputs
    output "ztademo_eastus2_dev_ztadevncc01_publicip_id" {
        value = module.ztademo_eastus2_dev_ztadevncc01_publicip.publicip_id
    }
    output "ztademo_eastus2_dev_ztadevncc01_publicip_name" {
        value = module.ztademo_eastus2_dev_ztadevncc01_publicip.publicip_name
    }
    output "ztademo_eastus2_dev_ztadevncc01_publicip_domain_name_label" {
        value = module.ztademo_eastus2_dev_ztadevncc01_publicip.publicip_domain_name_label
    }

	# ztadevncc01_netinf_outputs
	output "ztademo_eastus2_dev_ztadevncc01_netinf_id" {
		value = module.ztademo_eastus2_dev_ztadevncc01_netinf.netinf_id
	}
	output "ztademo_eastus2_dev_ztadevncc01_netinf_name" {
		value = module.ztademo_eastus2_dev_ztadevncc01_netinf.netinf_name
	}
	output "ztademo_eastus2_dev_ztadevncc01_netinf_private_ip_address" {
		value = module.ztademo_eastus2_dev_ztadevncc01_netinf.netinf_private_ip_address
	}
	output "ztademo_eastus2_dev_ztadevncc01_netinf_virtual_machine_id" {
		value = module.ztademo_eastus2_dev_ztadevncc01_netinf.netinf_virtual_machine_id
	}

# vmwin05
module "ztademo_eastus2_dev_ztadevsp01_vmwin" {
	source = "github.com/cantrellcloud/tfAzureModules/vmwin"
	#to_provision = local.provision_vmwin05
	rg_location = module.ztademo_eastus2_dev_rg.rg_location
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "A&E 700 R&D",
		"Environment" = "Demo",
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
        module.ztademo_eastus2_dev_ztadevsp01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # ztadevasp01_publicip
    module "ztademo_eastus2_dev_ztadevsp01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_ztadevsp01_publicip
        rg_location       = module.ztademo_eastus2_dev_rg.rg_location
        rg_name           = module.ztademo_eastus2_dev_rg.rg_name
        publicip_name     = "ztademo_eastus2_dev_ztadevsp01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadev-sp01"
    }

    # ztadevsp01_netinf
    module "ztademo_eastus2_dev_ztadevsp01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_ztadevsp01_netinf
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
        netinf_name = "ztadevsp01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztademo_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.23"
        ip_configuration_public_ip_address_id          = module.ztademo_eastus2_dev_ztadevsp01_publicip.publicip_id
}

    # ztadevsp01_outputs
    output "ztademo_eastus2_dev_ztadevsp01_vmwin_id" {
        value = module.ztademo_eastus2_dev_ztadevsp01_vmwin.vmwin_id
    }
    output "ztademo_eastus2_dev_ztadevsp01_vmwin_name" {
        value = module.ztademo_eastus2_dev_ztadevsp01_vmwin.vmwin_name
    }
    output "ztademo_eastus2_dev_ztadevsp01_vmwin_computer_name" {
        value = module.ztademo_eastus2_dev_ztadevsp01_vmwin.vmwin_computer_name
    }
    output "ztademo_eastus2_dev_ztadevsp01_vmwin_private_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevsp01_vmwin.vmwin_private_ip_address
    }
    output "ztademo_eastus2_dev_ztadevsp01_vmwin_virtual_machine_id" {
        value = module.ztademo_eastus2_dev_ztadevsp01_vmwin.vmwin_virtual_machine_id
    }
    output "ztademo_eastus2_dev_ztadevsp01_vmwin_public_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevsp01_vmwin.vmwin_public_ip_address
    }

    #ztadevsp01_publicip_outputs
    output "ztademo_eastus2_dev_ztadevsp01_publicip_id" {
        value = module.ztademo_eastus2_dev_ztadevsp01_publicip.publicip_id
    }
    output "ztademo_eastus2_dev_ztadevsp01_publicip_name" {
        value = module.ztademo_eastus2_dev_ztadevsp01_publicip.publicip_name
    }
    output "ztademo_eastus2_dev_ztadevsp01_publicip_domain_name_label" {
        value = module.ztademo_eastus2_dev_ztadevsp01_publicip.publicip_domain_name_label
    }

	# ztadevsp01_netinf_outputs
	output "ztademo_eastus2_dev_ztadevsp01_netinf_id" {
		value = module.ztademo_eastus2_dev_ztadevsp01_netinf.netinf_id
	}
	output "ztademo_eastus2_dev_ztadevsp01_netinf_name" {
		value = module.ztademo_eastus2_dev_ztadevsp01_netinf.netinf_name
	}
	output "ztademo_eastus2_dev_ztadevsp01_netinf_private_ip_address" {
		value = module.ztademo_eastus2_dev_ztadevsp01_netinf.netinf_private_ip_address
	}
	output "ztademo_eastus2_dev_ztadevsp01_netinf_virtual_machine_id" {
		value = module.ztademo_eastus2_dev_ztadevsp01_netinf.netinf_virtual_machine_id
	}

# vmwin06
module "ztademo_eastus2_dev_ztadevex01_vmwin" {
	source = "github.com/cantrellcloud/tfAzureModules/vmwin"
	#to_provision = local.provision_vmwin06
	rg_location = module.ztademo_eastus2_dev_rg.rg_location
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "A&E 700 R&D",
		"Environment" = "Demo",
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
        module.ztademo_eastus2_dev_ztadevex01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # ztadevaex01_publicip
    module "ztademo_eastus2_dev_ztadevex01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_ztadevex01_publicip
        rg_location       = module.ztademo_eastus2_dev_rg.rg_location
        rg_name           = module.ztademo_eastus2_dev_rg.rg_name
        publicip_name     = "ztademo_eastus2_dev_ztadevex01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadev-ex01"
    }

    # ztadevex01_netinf
    module "ztademo_eastus2_dev_ztadevex01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_ztadevex01_netinf
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
        netinf_name = "ztadevex01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztademo_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.24"
        ip_configuration_public_ip_address_id          = module.ztademo_eastus2_dev_ztadevex01_publicip.publicip_id
}

    # ztadevex01_manageddisk
    module "ztademo_eastus2_dev_ztadevex01_mbdatabase_manageddisk" {
        source = "github.com/cantrellcloud/tfAzureModules/manageddisk"
        #to_provision = local.provision_ztadevex01_manageddisk
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
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
    module "ztademo_eastus2_dev_ztadevex01_mbdatabase_datadiskattach" {
        source = "github.com/cantrellcloud/tfAzureModules/datadiskattach"
        #to_provision = local.provision_ztadevex01_mbdatabase_datadiskattach
        managed_disk_id = module.ztademo_eastus2_dev_ztadevex01_mbdatabase_manageddisk.manageddisk_id
        virtual_machine_id = module.ztademo_eastus2_dev_ztadevex01_vmwin.vmwin_id
        lun = 10
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # ztadevex01_outputs
    output "ztademo_eastus2_dev_ztadevex01_vmwin_id" {
        value = module.ztademo_eastus2_dev_ztadevex01_vmwin.vmwin_id
    }
    output "ztademo_eastus2_dev_ztadevex01_vmwin_name" {
        value = module.ztademo_eastus2_dev_ztadevex01_vmwin.vmwin_name
    }
    output "ztademo_eastus2_dev_ztadevex01_vmwin_computer_name" {
        value = module.ztademo_eastus2_dev_ztadevex01_vmwin.vmwin_computer_name
    }
    output "ztademo_eastus2_dev_ztadevex01_vmwin_private_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevex01_vmwin.vmwin_private_ip_address
    }
    output "ztademo_eastus2_dev_ztadevex01_vmwin_virtual_machine_id" {
        value = module.ztademo_eastus2_dev_ztadevex01_vmwin.vmwin_virtual_machine_id
    }
    output "ztademo_eastus2_dev_ztadevex01_vmwin_public_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevex01_vmwin.vmwin_public_ip_address
    }

    #ztadevex01_publicip_outputs
    output "ztademo_eastus2_dev_ztadevex01_publicip_id" {
        value = module.ztademo_eastus2_dev_ztadevex01_publicip.publicip_id
    }
    output "ztademo_eastus2_dev_ztadevex01_publicip_name" {
        value = module.ztademo_eastus2_dev_ztadevex01_publicip.publicip_name
    }
    output "ztademo_eastus2_dev_ztadevex01_publicip_domain_name_label" {
        value = module.ztademo_eastus2_dev_ztadevex01_publicip.publicip_domain_name_label
    }

	# ztadevex01_netinf_outputs
	output "ztademo_eastus2_dev_ztadevex01_netinf_id" {
		value = module.ztademo_eastus2_dev_ztadevex01_netinf.netinf_id
	}
	output "ztademo_eastus2_dev_ztadevex01_netinf_name" {
		value = module.ztademo_eastus2_dev_ztadevex01_netinf.netinf_name
	}
	output "ztademo_eastus2_dev_ztadevex01_netinf_private_ip_address" {
		value = module.ztademo_eastus2_dev_ztadevex01_netinf.netinf_private_ip_address
	}
	output "ztademo_eastus2_dev_ztadevex01_netinf_virtual_machine_id" {
		value = module.ztademo_eastus2_dev_ztadevex01_netinf.netinf_virtual_machine_id
	}

	# ztadevex01_manageddisk_outputs
	output "ztademo_eastus2_dev_ztadevex01_mbdatabase_manageddisk_id" {
		value = module.ztademo_eastus2_dev_ztadevex01_mbdatabase_manageddisk.manageddisk_id
	}
	output "ztademo_eastus2_dev_ztadevex01_mbdatabase_manageddisk_name" {
		value = module.ztademo_eastus2_dev_ztadevex01_mbdatabase_manageddisk.manageddisk_name
	}

	# ztadevex01_datadiskattach_outputs
    output "ztademo_eastus2_dev_ztadevex01_mbdatabase_datadiskattach_id" {
		value = module.ztademo_eastus2_dev_ztadevex01_mbdatabase_datadiskattach.datadiskattach_id
	}

# vmwin07
module "ztademo_eastus2_dev_ztadevdc02_vmwin" {
	source = "github.com/cantrellcloud/tfAzureModules/vmwin"
	#to_provision = local.provision_vmwin01
	rg_location = module.ztademo_eastus2_dev_rg.rg_location
	rg_name = module.ztademo_eastus2_dev_rg.rg_name
	rg_tags = {
		"ManagementGroup" = "A&E 700 R&D",
		"Environment" = "Demo",
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
        module.ztademo_eastus2_dev_ztadevdc02_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # ztdemodc02_netinf
    module "ztademo_eastus2_dev_ztadevdc02_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_ztdemodc02_netinf
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
        netinf_name = "ztdemodc02_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.ztademo_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.12"
        ip_configuration_public_ip_address_id          = module.ztademo_eastus2_dev_ztadevdc02_publicip.publicip_id
    }

    # ztdemodc02_publicip
    module "ztademo_eastus2_dev_ztadevdc02_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_ztdemodc02_publicip
        rg_location       = module.ztademo_eastus2_dev_rg.rg_location
        rg_name           = module.ztademo_eastus2_dev_rg.rg_name
        publicip_name     = "ztademo_eastus2_dev_ztadevdc02_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztadev-dc02"
    }

    # ztadevdc02_manageddisk
    module "ztademo_eastus2_dev_ztadevdc02_sysvol_manageddisk" {
        source = "github.com/cantrellcloud/tfAzureModules/manageddisk"
        #to_provision = local.provision_ztadevdc02_manageddisk
        rg_location = module.ztademo_eastus2_dev_rg.rg_location
        rg_name = module.ztademo_eastus2_dev_rg.rg_name
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
    module "ztademo_eastus2_dev_ztadevdc02_sysvol_datadiskattach" {
        source = "github.com/cantrellcloud/tfAzureModules/datadiskattach"
        #to_provision = local.provision_ztadevdc02_sysvol_datadiskattach
        managed_disk_id = module.ztademo_eastus2_dev_ztadevdc02_sysvol_manageddisk.manageddisk_id
        virtual_machine_id = module.ztademo_eastus2_dev_ztadevdc02_vmwin.vmwin_id
        lun = 10
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # ztdemodc02_outputs
    output "ztademo_eastus2_dev_ztadevdc02_vmwin_id" {
        value = module.ztademo_eastus2_dev_ztadevdc02_vmwin.vmwin_id
    }
    output "ztademo_eastus2_dev_ztadevdc02_vmwin_name" {
        value = module.ztademo_eastus2_dev_ztadevdc02_vmwin.vmwin_name
    }
    output "ztademo_eastus2_dev_ztadevdc02_vmwin_computer_name" {
        value = module.ztademo_eastus2_dev_ztadevdc02_vmwin.vmwin_computer_name
    }
    output "ztademo_eastus2_dev_ztadevdc02_vmwin_private_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevdc02_vmwin.vmwin_private_ip_address
    }
    output "ztademo_eastus2_dev_ztadevdc02_vmwin_virtual_machine_id" {
        value = module.ztademo_eastus2_dev_ztadevdc02_vmwin.vmwin_virtual_machine_id
    }
    output "ztademo_eastus2_dev_ztadevdc02_vmwin_public_ip_address" {
        value = module.ztademo_eastus2_dev_ztadevdc02_vmwin.vmwin_public_ip_address
    }

	#ztdemodc02_publicip_outputs
    output "ztademo_eastus2_dev_ztadevdc02_publicip_id" {
        value = module.ztademo_eastus2_dev_ztadevdc02_publicip.publicip_id
    }
    output "ztademo_eastus2_dev_ztadevdc02_publicip_name" {
        value = module.ztademo_eastus2_dev_ztadevdc02_publicip.publicip_name
    }
    output "ztademo_eastus2_dev_ztadevdc02_publicip_domain_name_label" {
        value = module.ztademo_eastus2_dev_ztadevdc02_publicip.publicip_domain_name_label
    }

	# ztdemodc02_netinf_outputs
	output "ztademo_eastus2_dev_ztadevdc02_netinf_id" {
		value = module.ztademo_eastus2_dev_ztadevdc02_netinf.netinf_id
	}
	output "ztademo_eastus2_dev_ztadevdc02_netinf_name" {
		value = module.ztademo_eastus2_dev_ztadevdc02_netinf.netinf_name
	}
	output "ztademo_eastus2_dev_ztadevdc02_netinf_private_ip_address" {
		value = module.ztademo_eastus2_dev_ztadevdc02_netinf.netinf_private_ip_address
	}
	output "ztademo_eastus2_dev_ztadevdc02_netinf_virtual_machine_id" {
		value = module.ztademo_eastus2_dev_ztadevdc02_netinf.netinf_virtual_machine_id
	}

	# ztadevdc02_manageddisk_outputs
	output "ztademo_eastus2_dev_ztadevdc02_sysvol_manageddisk_id" {
		value = module.ztademo_eastus2_dev_ztadevdc02_sysvol_manageddisk.manageddisk_id
	}
	output "ztademo_eastus2_dev_ztadevdc02_sysvol_manageddisk_name" {
		value = module.ztademo_eastus2_dev_ztadevdc02_sysvol_manageddisk.manageddisk_name
	}

	# ztadevdc02_datadiskattach_outputs
    output "ztademo_eastus2_dev_ztadevdc02_sysvol_datadiskattach_id" {
		value = module.ztademo_eastus2_dev_ztadevdc02_sysvol_datadiskattach.datadiskattach_id
	}

#================================================================================
#
# DCEDEMO
# COMPUTE.TF
#
#================================================================================
#
# VIRTUAL MACHINES and NETWORK INTERFACES

# vmwin01
module "kea_dcedemo_eastus_jidcjtodc01_vmwin" {
	source = "github.com/cantrellcloud/tfAzureModules/vmwin"
	#to_provision = local.provision_vmwin01
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vmwin_name = "jidcjto-dc01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jidcjto-dc01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.kea_dcedemo_eastus_jidcjtodc01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # jidcjtodc01_netinf
    module "kea_dcedemo_eastus_jidcjtodc01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_jidcjtodc01_netinf
        rg_location = module.kea_dcedemo_eastus_rg.rg_location
        rg_name = module.kea_dcedemo_eastus_rg.rg_name
        netinf_name = "jidcjtodc01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.kea_dcedemo_eastus_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "10.0.200.11"
        ip_configuration_public_ip_address_id          = module.kea_dcedemo_eastus_jidcjtodc01_publicip.publicip_id
    }

    # jidcjtodc01_publicip
    module "kea_dcedemo_eastus_jidcjtodc01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_jidcjtodc01_publicip
        rg_location       = module.kea_dcedemo_eastus_rg.rg_location
        rg_name           = module.kea_dcedemo_eastus_rg.rg_name
        publicip_name     = "kea_dcedemo_eastus_jidcjtodc01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jidcjto-dc01"
    }

    # jidcjtodc01_outputs
    output "kea_dcedemo_eastus_jidcjtodc01_vmwin_id" {
        value = module.kea_dcedemo_eastus_jidcjtodc01_vmwin.vmwin_id
    }
    output "kea_dcedemo_eastus_jidcjtodc01_vmwin_name" {
        value = module.kea_dcedemo_eastus_jidcjtodc01_vmwin.vmwin_name
    }
    output "kea_dcedemo_eastus_jidcjtodc01_vmwin_computer_name" {
        value = module.kea_dcedemo_eastus_jidcjtodc01_vmwin.vmwin_computer_name
    }
    output "kea_dcedemo_eastus_jidcjtodc01_vmwin_private_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtodc01_vmwin.vmwin_private_ip_address
    }
    output "kea_dcedemo_eastus_jidcjtodc01_vmwin_virtual_machine_id" {
        value = module.kea_dcedemo_eastus_jidcjtodc01_vmwin.vmwin_virtual_machine_id
    }
    output "kea_dcedemo_eastus_jidcjtodc01_vmwin_public_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtodc01_vmwin.vmwin_public_ip_address
    }

	#jidcjtodc01_publicip_outputs
    output "kea_dcedemo_eastus_jidcjtodc01_publicip_id" {
        value = module.kea_dcedemo_eastus_jidcjtodc01_publicip.publicip_id
    }
    output "kea_dcedemo_eastus_jidcjtodc01_publicip_name" {
        value = module.kea_dcedemo_eastus_jidcjtodc01_publicip.publicip_name
    }
    output "kea_dcedemo_eastus_jidcjtodc01_publicip_domain_name_label" {
        value = module.kea_dcedemo_eastus_jidcjtodc01_publicip.publicip_domain_name_label
    }

	# jidcjtodc01_netinf_outputs
	output "kea_dcedemo_eastus_jidcjtodc01_netinf_id" {
		value = module.kea_dcedemo_eastus_jidcjtodc01_netinf.netinf_id
	}
	output "kea_dcedemo_eastus_jidcjtodc01_netinf_name" {
		value = module.kea_dcedemo_eastus_jidcjtodc01_netinf.netinf_name
	}
	output "kea_dcedemo_eastus_jidcjtodc01_netinf_private_ip_address" {
		value = module.kea_dcedemo_eastus_jidcjtodc01_netinf.netinf_private_ip_address
	}
	output "kea_dcedemo_eastus_jidcjtodc01_netinf_virtual_machine_id" {
		value = module.kea_dcedemo_eastus_jidcjtodc01_netinf.netinf_virtual_machine_id
	}

# vmwin02
module "kea_dcedemo_eastus_jidcjtowks01_vmwin" {
	source = "github.com/cantrellcloud/tfAzureModules/vmwin"
	#to_provision = local.provision_vmwin02
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vmwin_name = "jidcjto-wks01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jidcjto-wks01"
    license_type          = "Windows_Client"
    network_interface_ids = [
        module.kea_dcedemo_eastus_jidcjtowks01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsDesktop"
    source_image_reference_offer     = "Windows-10"
    source_image_reference_sku       = "rs5-pro"
    #version   = "latest"
}

    # jidcjtowks01_publicip
    module "kea_dcedemo_eastus_jidcjtowks01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_jidcjtowks01_publicip
        rg_location       = module.kea_dcedemo_eastus_rg.rg_location
        rg_name           = module.kea_dcedemo_eastus_rg.rg_name
        publicip_name     = "kea_dcedemo_eastus_jidcjtowks01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jidcjto-wks01"
    }

    # jidcjtowks01_netinf
    module "kea_dcedemo_eastus_jidcjtowks01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_jidcjtowks01_netinf
        rg_location = module.kea_dcedemo_eastus_rg.rg_location
        rg_name = module.kea_dcedemo_eastus_rg.rg_name
        netinf_name = "jidcjtowks01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.kea_dcedemo_eastus_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "10.0.200.5"
        ip_configuration_public_ip_address_id          = module.kea_dcedemo_eastus_jidcjtowks01_publicip.publicip_id
}

    # jidcjtowks01_outputs
    output "kea_dcedemo_eastus_jidcjtowks01_vmwin_id" {
        value = module.kea_dcedemo_eastus_jidcjtowks01_vmwin.vmwin_id
    }
    output "kea_dcedemo_eastus_jidcjtowks01_vmwin_name" {
        value = module.kea_dcedemo_eastus_jidcjtowks01_vmwin.vmwin_name
    }
    output "kea_dcedemo_eastus_jidcjtowks01_vmwin_computer_name" {
        value = module.kea_dcedemo_eastus_jidcjtowks01_vmwin.vmwin_computer_name
    }
    output "kea_dcedemo_eastus_jidcjtowks01_vmwin_private_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtowks01_vmwin.vmwin_private_ip_address
    }
    output "kea_dcedemo_eastus_jidcjtowks01_vmwin_virtual_machine_id" {
        value = module.kea_dcedemo_eastus_jidcjtowks01_vmwin.vmwin_virtual_machine_id
    }
    output "kea_dcedemo_eastus_jidcjtowks01_vmwin_public_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtowks01_vmwin.vmwin_public_ip_address
    }

	#jidcjtowks01_publicip_outputs
    output "kea_dcedemo_eastus_jidcjtowks01_publicip_id" {
        value = module.kea_dcedemo_eastus_jidcjtowks01_publicip.publicip_id
    }
    output "kea_dcedemo_eastus_jidcjtowks01_publicip_name" {
        value = module.kea_dcedemo_eastus_jidcjtowks01_publicip.publicip_name
    }
    output "kea_dcedemo_eastus_jidcjtowks01_publicip_domain_name_label" {
        value = module.kea_dcedemo_eastus_jidcjtowks01_publicip.publicip_domain_name_label
    }

    # jidcjtowks01_netinf_outputs
	output "kea_dcedemo_eastus_jidcjtowks01_netinf_id" {
		value = module.kea_dcedemo_eastus_jidcjtowks01_netinf.netinf_id
	}
	output "kea_dcedemo_eastus_jidcjtowks01_netinf_name" {
		value = module.kea_dcedemo_eastus_jidcjtowks01_netinf.netinf_name
	}
	output "kea_dcedemo_eastus_jidcjtowks01_netinf_private_ip_address" {
		value = module.kea_dcedemo_eastus_jidcjtowks01_netinf.netinf_private_ip_address
	}
	output "kea_dcedemo_eastus_jidcjtowks01_netinf_virtual_machine_id" {
		value = module.kea_dcedemo_eastus_jidcjtowks01_netinf.netinf_virtual_machine_id
	}

# vmwin03
module "kea_dcedemo_eastus_jidcjtojpc01_vmwin" {
	source = "github.com/cantrellcloud/tfAzureModules/vmwin"
	#to_provision = local.provision_vmwin03
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vmwin_name = "jidcjto-jpc01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jidcjto-jpc01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.kea_dcedemo_eastus_jidcjtojpc01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # jidcjtoajpc01_publicip
    module "kea_dcedemo_eastus_jidcjtojpc01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_jidcjtojpc01_publicip
        rg_location       = module.kea_dcedemo_eastus_rg.rg_location
        rg_name           = module.kea_dcedemo_eastus_rg.rg_name
        publicip_name     = "kea_dcedemo_eastus_jidcjtojpc01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jidcjto-jpc01"
    }

   # jidcjtojpc01_netinf
    module "kea_dcedemo_eastus_jidcjtojpc01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_jidcjtojpc01_netinf
        rg_location = module.kea_dcedemo_eastus_rg.rg_location
        rg_name = module.kea_dcedemo_eastus_rg.rg_name
        netinf_name = "jidcjtojpc01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.kea_dcedemo_eastus_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "10.0.200.22"
        ip_configuration_public_ip_address_id          = module.kea_dcedemo_eastus_jidcjtojpc01_publicip.publicip_id
}

    # jidcjtojpc01_outputs
    output "kea_dcedemo_eastus_jidcjtojpc01_vmwin_id" {
        value = module.kea_dcedemo_eastus_jidcjtojpc01_vmwin.vmwin_id
    }
    output "kea_dcedemo_eastus_jidcjtojpc01_vmwin_name" {
        value = module.kea_dcedemo_eastus_jidcjtojpc01_vmwin.vmwin_name
    }
    output "kea_dcedemo_eastus_jidcjtojpc01_vmwin_computer_name" {
        value = module.kea_dcedemo_eastus_jidcjtojpc01_vmwin.vmwin_computer_name
    }
    output "kea_dcedemo_eastus_jidcjtojpc01_vmwin_private_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtojpc01_vmwin.vmwin_private_ip_address
    }
    output "kea_dcedemo_eastus_jidcjtojpc01_vmwin_virtual_machine_id" {
        value = module.kea_dcedemo_eastus_jidcjtojpc01_vmwin.vmwin_virtual_machine_id
    }
    output "kea_dcedemo_eastus_jidcjtojpc01_vmwin_public_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtojpc01_vmwin.vmwin_public_ip_address
    }

	#jidcjtojpc01_publicip_outputs
    output "kea_dcedemo_eastus_jidcjtojpc01_publicip_id" {
        value = module.kea_dcedemo_eastus_jidcjtojpc01_publicip.publicip_id
    }
    output "kea_dcedemo_eastus_jidcjtojpc01_publicip_name" {
        value = module.kea_dcedemo_eastus_jidcjtojpc01_publicip.publicip_name
    }
    output "kea_dcedemo_eastus_jidcjtojpc01_publicip_domain_name_label" {
        value = module.kea_dcedemo_eastus_jidcjtojpc01_publicip.publicip_domain_name_label
    }

    # jidcjtojpc01_netinf_outputs
	output "kea_dcedemo_eastus_jidcjtojpc01_netinf_id" {
		value = module.kea_dcedemo_eastus_jidcjtojpc01_netinf.netinf_id
	}
	output "kea_dcedemo_eastus_jidcjtojpc01_netinf_name" {
		value = module.kea_dcedemo_eastus_jidcjtojpc01_netinf.netinf_name
	}
	output "kea_dcedemo_eastus_jidcjtojpc01_netinf_private_ip_address" {
		value = module.kea_dcedemo_eastus_jidcjtojpc01_netinf.netinf_private_ip_address
	}
	output "kea_dcedemo_eastus_jidcjtojpc01_netinf_virtual_machine_id" {
		value = module.kea_dcedemo_eastus_jidcjtojpc01_netinf.netinf_virtual_machine_id
	}

# vmwin04
module "kea_dcedemo_eastus_jidcjtoncc01_vmwin" {
	source = "github.com/cantrellcloud/tfAzureModules/vmwin"
	#to_provision = local.provision_vmwin04
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vmwin_name = "jidcjto-ncc01"
    size                  = "Standard_D4s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jidcjto-ncc01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.kea_dcedemo_eastus_jidcjtoncc01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # jidcjtoancc01_publicip
    module "kea_dcedemo_eastus_jidcjtoncc01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_jidcjtoncc01_publicip
        rg_location       = module.kea_dcedemo_eastus_rg.rg_location
        rg_name           = module.kea_dcedemo_eastus_rg.rg_name
        publicip_name     = "kea_dcedemo_eastus_jidcjtoncc01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jidcjto-ncc01"
    }

    # jidcjtoncc01_netinf
    module "kea_dcedemo_eastus_jidcjtoncc01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_jidcjtoncc01_netinf
        rg_location = module.kea_dcedemo_eastus_rg.rg_location
        rg_name = module.kea_dcedemo_eastus_rg.rg_name
        netinf_name = "jidcjtoncc01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.kea_dcedemo_eastus_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "10.0.200.20"
        ip_configuration_public_ip_address_id          = module.kea_dcedemo_eastus_jidcjtoncc01_publicip.publicip_id
}

    # jidcjtoncc01_outputs
    output "kea_dcedemo_eastus_jidcjtoncc01_vmwin_id" {
        value = module.kea_dcedemo_eastus_jidcjtoncc01_vmwin.vmwin_id
    }
    output "kea_dcedemo_eastus_jidcjtoncc01_vmwin_name" {
        value = module.kea_dcedemo_eastus_jidcjtoncc01_vmwin.vmwin_name
    }
    output "kea_dcedemo_eastus_jidcjtoncc01_vmwin_computer_name" {
        value = module.kea_dcedemo_eastus_jidcjtoncc01_vmwin.vmwin_computer_name
    }
    output "kea_dcedemo_eastus_jidcjtoncc01_vmwin_private_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtoncc01_vmwin.vmwin_private_ip_address
    }
    output "kea_dcedemo_eastus_jidcjtoncc01_vmwin_virtual_machine_id" {
        value = module.kea_dcedemo_eastus_jidcjtoncc01_vmwin.vmwin_virtual_machine_id
    }
    output "kea_dcedemo_eastus_jidcjtoncc01_vmwin_public_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtoncc01_vmwin.vmwin_public_ip_address
    }

    #jidcjtoncc01_publicip_outputs
    output "kea_dcedemo_eastus_jidcjtoncc01_publicip_id" {
        value = module.kea_dcedemo_eastus_jidcjtoncc01_publicip.publicip_id
    }
    output "kea_dcedemo_eastus_jidcjtoncc01_publicip_name" {
        value = module.kea_dcedemo_eastus_jidcjtoncc01_publicip.publicip_name
    }
    output "kea_dcedemo_eastus_jidcjtoncc01_publicip_domain_name_label" {
        value = module.kea_dcedemo_eastus_jidcjtoncc01_publicip.publicip_domain_name_label
    }

	# jidcjtoncc01_netinf_outputs
	output "kea_dcedemo_eastus_jidcjtoncc01_netinf_id" {
		value = module.kea_dcedemo_eastus_jidcjtoncc01_netinf.netinf_id
	}
	output "kea_dcedemo_eastus_jidcjtoncc01_netinf_name" {
		value = module.kea_dcedemo_eastus_jidcjtoncc01_netinf.netinf_name
	}
	output "kea_dcedemo_eastus_jidcjtoncc01_netinf_private_ip_address" {
		value = module.kea_dcedemo_eastus_jidcjtoncc01_netinf.netinf_private_ip_address
	}
	output "kea_dcedemo_eastus_jidcjtoncc01_netinf_virtual_machine_id" {
		value = module.kea_dcedemo_eastus_jidcjtoncc01_netinf.netinf_virtual_machine_id
	}

# vmwin05
module "kea_dcedemo_eastus_jidcjtosp01_vmwin" {
	source = "github.com/cantrellcloud/tfAzureModules/vmwin"
	#to_provision = local.provision_vmwin05
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vmwin_name = "jidcjto-sp01"
    size                  = "Standard_D4s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jidcjto-sp01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.kea_dcedemo_eastus_jidcjtosp01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # jidcjtoasp01_publicip
    module "kea_dcedemo_eastus_jidcjtosp01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_jidcjtosp01_publicip
        rg_location       = module.kea_dcedemo_eastus_rg.rg_location
        rg_name           = module.kea_dcedemo_eastus_rg.rg_name
        publicip_name     = "kea_dcedemo_eastus_jidcjtosp01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jidcjto-sp01"
    }

    # jidcjtosp01_netinf
    module "kea_dcedemo_eastus_jidcjtosp01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_jidcjtosp01_netinf
        rg_location = module.kea_dcedemo_eastus_rg.rg_location
        rg_name = module.kea_dcedemo_eastus_rg.rg_name
        netinf_name = "jidcjtosp01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.kea_dcedemo_eastus_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "10.0.200.23"
        ip_configuration_public_ip_address_id          = module.kea_dcedemo_eastus_jidcjtosp01_publicip.publicip_id
}

    # jidcjtosp01_outputs
    output "kea_dcedemo_eastus_jidcjtosp01_vmwin_id" {
        value = module.kea_dcedemo_eastus_jidcjtosp01_vmwin.vmwin_id
    }
    output "kea_dcedemo_eastus_jidcjtosp01_vmwin_name" {
        value = module.kea_dcedemo_eastus_jidcjtosp01_vmwin.vmwin_name
    }
    output "kea_dcedemo_eastus_jidcjtosp01_vmwin_computer_name" {
        value = module.kea_dcedemo_eastus_jidcjtosp01_vmwin.vmwin_computer_name
    }
    output "kea_dcedemo_eastus_jidcjtosp01_vmwin_private_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtosp01_vmwin.vmwin_private_ip_address
    }
    output "kea_dcedemo_eastus_jidcjtosp01_vmwin_virtual_machine_id" {
        value = module.kea_dcedemo_eastus_jidcjtosp01_vmwin.vmwin_virtual_machine_id
    }
    output "kea_dcedemo_eastus_jidcjtosp01_vmwin_public_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtosp01_vmwin.vmwin_public_ip_address
    }

    #jidcjtosp01_publicip_outputs
    output "kea_dcedemo_eastus_jidcjtosp01_publicip_id" {
        value = module.kea_dcedemo_eastus_jidcjtosp01_publicip.publicip_id
    }
    output "kea_dcedemo_eastus_jidcjtosp01_publicip_name" {
        value = module.kea_dcedemo_eastus_jidcjtosp01_publicip.publicip_name
    }
    output "kea_dcedemo_eastus_jidcjtosp01_publicip_domain_name_label" {
        value = module.kea_dcedemo_eastus_jidcjtosp01_publicip.publicip_domain_name_label
    }

	# jidcjtosp01_netinf_outputs
	output "kea_dcedemo_eastus_jidcjtosp01_netinf_id" {
		value = module.kea_dcedemo_eastus_jidcjtosp01_netinf.netinf_id
	}
	output "kea_dcedemo_eastus_jidcjtosp01_netinf_name" {
		value = module.kea_dcedemo_eastus_jidcjtosp01_netinf.netinf_name
	}
	output "kea_dcedemo_eastus_jidcjtosp01_netinf_private_ip_address" {
		value = module.kea_dcedemo_eastus_jidcjtosp01_netinf.netinf_private_ip_address
	}
	output "kea_dcedemo_eastus_jidcjtosp01_netinf_virtual_machine_id" {
		value = module.kea_dcedemo_eastus_jidcjtosp01_netinf.netinf_virtual_machine_id
	}

# vmwin06
module "kea_dcedemo_eastus_jidcjtoex01_vmwin" {
	source = "github.com/cantrellcloud/tfAzureModules/vmwin"
	#to_provision = local.provision_vmwin06
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vmwin_name = "jidcjto-ex01"
    size                  = "Standard_D4s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jidcjto-ex01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.kea_dcedemo_eastus_jidcjtoex01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # jidcjtoaex01_publicip
    module "kea_dcedemo_eastus_jidcjtoex01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_jidcjtoex01_publicip
        rg_location       = module.kea_dcedemo_eastus_rg.rg_location
        rg_name           = module.kea_dcedemo_eastus_rg.rg_name
        publicip_name     = "kea_dcedemo_eastus_jidcjtoex01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jidcjto-ex01"
    }

    # jidcjtoex01_netinf
    module "kea_dcedemo_eastus_jidcjtoex01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_jidcjtoex01_netinf
        rg_location = module.kea_dcedemo_eastus_rg.rg_location
        rg_name = module.kea_dcedemo_eastus_rg.rg_name
        netinf_name = "jidcjtoex01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.kea_dcedemo_eastus_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "10.0.200.24"
        ip_configuration_public_ip_address_id          = module.kea_dcedemo_eastus_jidcjtoex01_publicip.publicip_id
}

    # jidcjtoex01_manageddisk
    module "kea_dcedemo_eastus_jidcjtoex01_mbdatabase_manageddisk" {
        source = "github.com/cantrellcloud/tfAzureModules/manageddisk"
        #to_provision = local.provision_jidcjtoex01_manageddisk
        rg_location = module.kea_dcedemo_eastus_rg.rg_location
        rg_name = module.kea_dcedemo_eastus_rg.rg_name
        manageddisk_name = "jidcjtoex01_mbdatabase_manageddisk"

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

    #jidcjtoex01_datadiskattach
    module "kea_dcedemo_eastus_jidcjtoex01_mbdatabase_datadiskattach" {
        source = "github.com/cantrellcloud/tfAzureModules/datadiskattach"
        #to_provision = local.provision_jidcjtoex01_mbdatabase_datadiskattach
        managed_disk_id = module.kea_dcedemo_eastus_jidcjtoex01_mbdatabase_manageddisk.manageddisk_id
        virtual_machine_id = module.kea_dcedemo_eastus_jidcjtoex01_vmwin.vmwin_id
        lun = 10
        caching = "ReadWrite"
        create_option   = "Attach"
        write_accelerator_enabled = "false"
    }

    # jidcjtoex01_outputs
    output "kea_dcedemo_eastus_jidcjtoex01_vmwin_id" {
        value = module.kea_dcedemo_eastus_jidcjtoex01_vmwin.vmwin_id
    }
    output "kea_dcedemo_eastus_jidcjtoex01_vmwin_name" {
        value = module.kea_dcedemo_eastus_jidcjtoex01_vmwin.vmwin_name
    }
    output "kea_dcedemo_eastus_jidcjtoex01_vmwin_computer_name" {
        value = module.kea_dcedemo_eastus_jidcjtoex01_vmwin.vmwin_computer_name
    }
    output "kea_dcedemo_eastus_jidcjtoex01_vmwin_private_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtoex01_vmwin.vmwin_private_ip_address
    }
    output "kea_dcedemo_eastus_jidcjtoex01_vmwin_virtual_machine_id" {
        value = module.kea_dcedemo_eastus_jidcjtoex01_vmwin.vmwin_virtual_machine_id
    }
    output "kea_dcedemo_eastus_jidcjtoex01_vmwin_public_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtoex01_vmwin.vmwin_public_ip_address
    }

    #jidcjtoex01_publicip_outputs
    output "kea_dcedemo_eastus_jidcjtoex01_publicip_id" {
        value = module.kea_dcedemo_eastus_jidcjtoex01_publicip.publicip_id
    }
    output "kea_dcedemo_eastus_jidcjtoex01_publicip_name" {
        value = module.kea_dcedemo_eastus_jidcjtoex01_publicip.publicip_name
    }
    output "kea_dcedemo_eastus_jidcjtoex01_publicip_domain_name_label" {
        value = module.kea_dcedemo_eastus_jidcjtoex01_publicip.publicip_domain_name_label
    }

	# jidcjtoex01_netinf_outputs
	output "kea_dcedemo_eastus_jidcjtoex01_netinf_id" {
		value = module.kea_dcedemo_eastus_jidcjtoex01_netinf.netinf_id
	}
	output "kea_dcedemo_eastus_jidcjtoex01_netinf_name" {
		value = module.kea_dcedemo_eastus_jidcjtoex01_netinf.netinf_name
	}
	output "kea_dcedemo_eastus_jidcjtoex01_netinf_private_ip_address" {
		value = module.kea_dcedemo_eastus_jidcjtoex01_netinf.netinf_private_ip_address
	}
	output "kea_dcedemo_eastus_jidcjtoex01_netinf_virtual_machine_id" {
		value = module.kea_dcedemo_eastus_jidcjtoex01_netinf.netinf_virtual_machine_id
	}

	# jidcjtoex01_manageddisk_outputs
	output "kea_dcedemo_eastus_jidcjtoex01_mbdatabase_manageddisk_id" {
		value = module.kea_dcedemo_eastus_jidcjtoex01_mbdatabase_manageddisk.manageddisk_id
	}
	output "kea_dcedemo_eastus_jidcjtoex01_mbdatabase_manageddisk_name" {
		value = module.kea_dcedemo_eastus_jidcjtoex01_mbdatabase_manageddisk.manageddisk_name
	}

	# jidcjtoex01_datadiskattach_outputs
    output "kea_dcedemo_eastus_jidcjtoex01_mbdatabase_datadiskattach_id" {
		value = module.kea_dcedemo_eastus_jidcjtoex01_mbdatabase_datadiskattach.datadiskattach_id
	}

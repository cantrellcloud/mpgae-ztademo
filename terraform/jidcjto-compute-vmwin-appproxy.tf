#================================================================================
#
# ZTADEV
# Compute - Windows - Azure App Proxy
#
#================================================================================
#
# WINDOWS VIRTUAL MACHINES, NETWORK INTERFACES, and PUBLIC IPs
#
# jtodevproxy01
module "jtodev_eastus2_dev_jtodevproxy01_vmwin" {
	source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-vmwin"
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

	vmwin_name = "jtodev-prox01"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-prox01"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevproxy01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # jtodevproxy01_netinf
    module "jtodev_eastus2_dev_jtodevproxy01_netinf" {
        source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-netinf"
        #to_provision = local.provision_jtodevproxy01_netinf
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

        netinf_name = "jtodevproxy01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_edge_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.71"
        ip_configuration_public_ip_address_id          = null # module.jtodev_eastus2_dev_jtodevproxy01_publicip.publicip_id
    }

    # jtodevproxy01_outputs
    output "jtodev_eastus2_dev_jtodevproxy01_vmwin_id" {
        value = module.jtodev_eastus2_dev_jtodevproxy01_vmwin.vmwin_id
    }
    output "jtodev_eastus2_dev_jtodevproxy01_vmwin_name" {
        value = module.jtodev_eastus2_dev_jtodevproxy01_vmwin.vmwin_name
    }
    output "jtodev_eastus2_dev_jtodevproxy01_vmwin_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevproxy01_vmwin.vmwin_computer_name
    }
    output "jtodev_eastus2_dev_jtodevproxy01_vmwin_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevproxy01_vmwin.vmwin_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevproxy01_vmwin_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevproxy01_vmwin.vmwin_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevproxy01_vmwin_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevproxy01_vmwin.vmwin_public_ip_address
    }

	# jtodevproxy01_netinf_outputs
	output "jtodev_eastus2_dev_jtodevproxy01_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevproxy01_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevproxy01_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevproxy01_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevproxy01_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevproxy01_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevproxy01_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevproxy01_netinf.netinf_virtual_machine_id
	}

#########################################################################################

# jtodevproxy02
module "jtodev_eastus2_dev_jtodevproxy02_vmwin" {
	source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-vmwin"
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

	vmwin_name = "jtodev-prox02"
    size                  = "Standard_D2s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-prox02"
    license_type          = "Windows_Server"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevproxy02_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_sku       = "2019-Datacenter"
    #version   = "latest"
}

    # jtodevproxy02_netinf
    module "jtodev_eastus2_dev_jtodevproxy02_netinf" {
        source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-netinf"
        #to_provision = local.provision_jtodevproxy02_netinf
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

        netinf_name = "jtodevproxy02_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_edge_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.72"
        ip_configuration_public_ip_address_id          = null # module.jtodev_eastus2_dev_jtodevproxy02_publicip.publicip_id
    }

    # jtodevproxy02_outputs
    output "jtodev_eastus2_dev_jtodevproxy02_vmwin_id" {
        value = module.jtodev_eastus2_dev_jtodevproxy02_vmwin.vmwin_id
    }
    output "jtodev_eastus2_dev_jtodevproxy02_vmwin_name" {
        value = module.jtodev_eastus2_dev_jtodevproxy02_vmwin.vmwin_name
    }
    output "jtodev_eastus2_dev_jtodevproxy02_vmwin_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevproxy02_vmwin.vmwin_computer_name
    }
    output "jtodev_eastus2_dev_jtodevproxy02_vmwin_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevproxy02_vmwin.vmwin_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevproxy02_vmwin_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevproxy02_vmwin.vmwin_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevproxy02_vmwin_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevproxy02_vmwin.vmwin_public_ip_address
    }

	# jtodevproxy02_netinf_outputs
	output "jtodev_eastus2_dev_jtodevproxy02_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevproxy02_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevproxy02_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevproxy02_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevproxy02_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevproxy02_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevproxy02_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevproxy02_netinf.netinf_virtual_machine_id
	}

#########################################################################################

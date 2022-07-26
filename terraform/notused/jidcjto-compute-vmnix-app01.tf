#================================================================================
#
# ZTADEV
#
# abac-compute-vmnix-app01.tf
#
#================================================================================
#
# VIRTUAL MACHINES and NETWORK INTERFACES

# vmnix01
module "jtodev_eastus2_dev_jtodevapp01_vmnix" {
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

	vmnix_name = "jtodev-app01"
    size                  = "Standard_D4s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jtodev-app01"
    network_interface_ids = [
        module.jtodev_eastus2_dev_jtodevapp01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "UbuntuServer"
    source_image_reference_sku       = "18.04-LTS"
    #version   = "latest"
}

    # jtodevapp01_publicip
    module "jtodev_eastus2_dev_jtodevapp01_publicip" {
        source            = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-publicip"
        #to_provision     = local.provision_jtodevapp01_publicip
        rg_location       = module.jtodev_eastus2_dev_rg.rg_location
        rg_name           = module.jtodev_eastus2_dev_rg.rg_name
        rg_tags = {
            "ManagementGroup" = "MPG A&E EastUS2",
            "Environment" = "JTODev",
            "AutomatedBy" = "Terraform",
            "Note1" = "Do not manually change",
            "POCName" = "ronc@mindpointgroup.com",
            "POCPhone" = "843.330.6769",
            "Project" = "Zero Trust Demo"
        }

        publicip_name              = "jtodev_eastus2_dev_jtodevapp01_publicip"
        publicip_allocation_method = "Static"
        publicip_sku               = "Standard"
        publicip_domain_name_label = "jtodev-app01"
    }

    # jtodevapp01_netinf
    module "jtodev_eastus2_dev_jtodevapp01_netinf" {
        source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-netinf"
        #to_provision = local.provision_jtodevapp01_netinf
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

        netinf_name = "jtodevapp01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "172.16.200.25"
        ip_configuration_public_ip_address_id          = module.jtodev_eastus2_dev_jtodevapp01_publicip.publicip_id
}

    # jtodevapp01_outputs
    output "jtodev_eastus2_dev_jtodevapp01_vmnix_id" {
        value = module.jtodev_eastus2_dev_jtodevapp01_vmnix.vmnix_id
    }
    output "jtodev_eastus2_dev_jtodevapp01_vmnix_name" {
        value = module.jtodev_eastus2_dev_jtodevapp01_vmnix.vmnix_name
    }
    output "jtodev_eastus2_dev_jtodevapp01_vmnix_computer_name" {
        value = module.jtodev_eastus2_dev_jtodevapp01_vmnix.vmnix_computer_name
    }
    output "jtodev_eastus2_dev_jtodevapp01_vmnix_private_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevapp01_vmnix.vmnix_private_ip_address
    }
    output "jtodev_eastus2_dev_jtodevapp01_vmnix_virtual_machine_id" {
        value = module.jtodev_eastus2_dev_jtodevapp01_vmnix.vmnix_virtual_machine_id
    }
    output "jtodev_eastus2_dev_jtodevapp01_vmnix_public_ip_address" {
        value = module.jtodev_eastus2_dev_jtodevapp01_vmnix.vmnix_public_ip_address
    }

    #jtodevapp01_publicip
    output "jtodev_eastus2_dev_jtodevapp01_publicip_id" {
        value = module.jtodev_eastus2_dev_jtodevapp01_publicip.publicip_id
    }
    output "jtodev_eastus2_dev_jtodevapp01_publicip_name" {
        value = module.jtodev_eastus2_dev_jtodevapp01_publicip.publicip_name
    }
    output "jtodev_eastus2_dev_jtodevapp01_publicip_domain_name_label" {
        value = module.jtodev_eastus2_dev_jtodevapp01_publicip.publicip_domain_name_label
    }

	# jtodevapp01_netinf_outputs
	output "jtodev_eastus2_dev_jtodevapp01_netinf_id" {
		value = module.jtodev_eastus2_dev_jtodevapp01_netinf.netinf_id
	}
	output "jtodev_eastus2_dev_jtodevapp01_netinf_name" {
		value = module.jtodev_eastus2_dev_jtodevapp01_netinf.netinf_name
	}
	output "jtodev_eastus2_dev_jtodevapp01_netinf_private_ip_address" {
		value = module.jtodev_eastus2_dev_jtodevapp01_netinf.netinf_private_ip_address
	}
	output "jtodev_eastus2_dev_jtodevapp01_netinf_virtual_machine_id" {
		value = module.jtodev_eastus2_dev_jtodevapp01_netinf.netinf_virtual_machine_id
	}

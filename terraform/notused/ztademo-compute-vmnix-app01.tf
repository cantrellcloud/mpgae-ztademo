#================================================================================
#
# DCEDEMO
#
# abac-compute-vmnix-app01.tf
#
#================================================================================
#
# VIRTUAL MACHINES and NETWORK INTERFACES

# vmnix01
module "kea_dcedemo_eastus_jidcjtoapp01_vmnix" {
	source = "github.com/cantrellcloud/tfAzureModules/vmnix"
	#to_provision = local.provision_vmnix01
	rg_location = module.kea_dcedemo_eastus_rg.rg_location
	rg_name = module.kea_dcedemo_eastus_rg.rg_name

	vmnix_name = "jidcjto-app01"
    size                  = "Standard_D4s_v3"
    admin_username        = "adminlocal"
    admin_password        = "Password#1Password#1"

    computer_name         = "jidcjto-app01"
    network_interface_ids = [
        module.kea_dcedemo_eastus_jidcjtoapp01_netinf.netinf_id,
    ]

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "UbuntuServer"
    source_image_reference_sku       = "18.04-LTS"
    #version   = "latest"
}

    # jidcjtoapp01_publicip
    module "kea_dcedemo_eastus_jidcjtoapp01_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_jidcjtoapp01_publicip
        rg_location       = module.kea_dcedemo_eastus_rg.rg_location
        rg_name           = module.kea_dcedemo_eastus_rg.rg_name
        publicip_name     = "kea_dcedemo_eastus_jidcjtoapp01_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "jidcjto-app01"
    }

    # jidcjtoapp01_netinf
    module "kea_dcedemo_eastus_jidcjtoapp01_netinf" {
        source = "github.com/cantrellcloud/tfAzureModules/netinf"
        #to_provision = local.provision_jidcjtoapp01_netinf
        rg_location = module.kea_dcedemo_eastus_rg.rg_location
        rg_name = module.kea_dcedemo_eastus_rg.rg_name
        netinf_name = "jidcjtoapp01_netinf"

        ip_configuration_name                          = "ipconfig01"
        ip_configuration_private_ip_address_version    = "IPv4"
        ip_configuration_subnet_id                     = module.kea_dcedemo_eastus_prod_subnet.subnet_id
        ip_configuration_private_ip_address_allocation = "Static"
        ip_configuration_private_ip_address            = "10.0.200.25"
        ip_configuration_public_ip_address_id          = module.kea_dcedemo_eastus_jidcjtoapp01_publicip.publicip_id
}

    # jidcjtoapp01_outputs
    output "kea_dcedemo_eastus_jidcjtoapp01_vmnix_id" {
        value = module.kea_dcedemo_eastus_jidcjtoapp01_vmnix.vmnix_id
    }
    output "kea_dcedemo_eastus_jidcjtoapp01_vmnix_name" {
        value = module.kea_dcedemo_eastus_jidcjtoapp01_vmnix.vmnix_name
    }
    output "kea_dcedemo_eastus_jidcjtoapp01_vmnix_computer_name" {
        value = module.kea_dcedemo_eastus_jidcjtoapp01_vmnix.vmnix_computer_name
    }
    output "kea_dcedemo_eastus_jidcjtoapp01_vmnix_private_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtoapp01_vmnix.vmnix_private_ip_address
    }
    output "kea_dcedemo_eastus_jidcjtoapp01_vmnix_virtual_machine_id" {
        value = module.kea_dcedemo_eastus_jidcjtoapp01_vmnix.vmnix_virtual_machine_id
    }
    output "kea_dcedemo_eastus_jidcjtoapp01_vmnix_public_ip_address" {
        value = module.kea_dcedemo_eastus_jidcjtoapp01_vmnix.vmnix_public_ip_address
    }

    #jidcjtoapp01_publicip
    output "kea_dcedemo_eastus_jidcjtoapp01_publicip_id" {
        value = module.kea_dcedemo_eastus_jidcjtoapp01_publicip.publicip_id
    }
    output "kea_dcedemo_eastus_jidcjtoapp01_publicip_name" {
        value = module.kea_dcedemo_eastus_jidcjtoapp01_publicip.publicip_name
    }
    output "kea_dcedemo_eastus_jidcjtoapp01_publicip_domain_name_label" {
        value = module.kea_dcedemo_eastus_jidcjtoapp01_publicip.publicip_domain_name_label
    }

	# jidcjtoapp01_netinf_outputs
	output "kea_dcedemo_eastus_jidcjtoapp01_netinf_id" {
		value = module.kea_dcedemo_eastus_jidcjtoapp01_netinf.netinf_id
	}
	output "kea_dcedemo_eastus_jidcjtoapp01_netinf_name" {
		value = module.kea_dcedemo_eastus_jidcjtoapp01_netinf.netinf_name
	}
	output "kea_dcedemo_eastus_jidcjtoapp01_netinf_private_ip_address" {
		value = module.kea_dcedemo_eastus_jidcjtoapp01_netinf.netinf_private_ip_address
	}
	output "kea_dcedemo_eastus_jidcjtoapp01_netinf_virtual_machine_id" {
		value = module.kea_dcedemo_eastus_jidcjtoapp01_netinf.netinf_virtual_machine_id
	}

#================================================================================
#
# LOAD BALANCERS
#
# ZTCONTROLLER PRIVATE LB

# lb01
module "kea_dcedemo_eastus_ztcontroller_private_lb" {
	source            = "github.com/cantrellcloud/tfAzureModules/lb"
	#to_provision     = local.provision_lb01
	rg_location       = module.kea_dcedemo_eastus_rg.rg_location
	rg_name           = module.kea_dcedemo_eastus_rg.rg_name
	lb_name           = "kea_dcedemo_eastus_ztcontroller_private_lb"
	lb_sku            = "Standard"

	#frontend_ip_configuration
	lb_frontend_ip_configuration_name = "kea_dcedemo_eastus_ztcontroller_private_lb_frontend_ip_configuration"
	lb_frontend_ip_configuration_subnet_id = module.kea_dcedemo_eastus_ztcontroller_subnet.subnet_id
	lb_frontend_ip_configuration_private_ip_address = "10.0.200.40"
	lb_frontend_ip_configuration_private_ip_address_allocation = "Static"
	lb_frontend_ip_configuration_private_ip_address_version = "IPv4"
	lb_frontend_ip_configuration_public_ip_address_id = null	#module.kea_dcedemo_eastus_ztcontroller_private_lb_publicip.publicip_id
}

	#lb01_outputs
	output "kea_dcedemo_eastus_ztcontroller_private_lb_id" {
		value = module.kea_dcedemo_eastus_ztcontroller_private_lb.lb_id
	}
	output "kea_dcedemo_eastus_ztcontroller_private_lb_name" {
		value = module.kea_dcedemo_eastus_ztcontroller_private_lb.lb_name
	}
	output "kea_dcedemo_eastus_ztcontroller_private_lb_frontend_ip_configuration_name" {
		value = module.kea_dcedemo_eastus_ztcontroller_private_lb.lb_frontend_ip_configuration_name
	}
	output "kea_dcedemo_eastus_ztcontroller_private_lb_frontend_ip_configuration" {
		value = module.kea_dcedemo_eastus_ztcontroller_private_lb.lb_frontend_ip_configuration
	}
	output "kea_dcedemo_eastus_ztcontroller_private_lb_frontend_private_ip_address" {
		value = module.kea_dcedemo_eastus_ztcontroller_private_lb.lb_frontend_private_ip_address
	}

	#lbbackendaddresspool01
	module "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private" {
		source                     = "github.com/cantrellcloud/tfAzureModules/lbbackendaddresspool"
		#to_provision              = local.provision_lbbackendaddresspool01
		lbbackendaddresspool_lb_id = module.kea_dcedemo_eastus_ztcontroller_private_lb.lb_id
		lbbackendaddresspool_name  = "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private"
	}

		#lbbackendaddresspool01_outputs
		output "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private_id" {
			value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private.lbbackendaddresspool_id
		}
		output "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private_name" {
			value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private.lbbackendaddresspool_name
		}
		output "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private_backend_ip_configurations" {
			value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private.lbbackendaddresspool_backend_ip_configurations
		}
		output "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private_load_balancing_rules" {
			value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private.lbbackendaddresspool_load_balancing_rules
		}
		/*output "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private_outbound_rules" {
			value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private.lbbackendaddresspool_outbound_rules
		}*/

		#lbbackendaddresspooladdress01
		module "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_01" {
			source        = "github.com/cantrellcloud/tfAzureModules/lbbackendaddresspooladdress"
			#to_provis ion = local.provision_lbbackendaddresspooladdress01
			lb_backendaddresspooladdress_backend_address_pool_id = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private.lbbackendaddresspool_id
			lb_backendaddresspooladdress_name  = "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_01"
			lb_backendaddresspooladdress_virtual_network_id = module.kea_dcedemo_eastus_prod_vnet.vnet_id
			lb_backendaddresspooladdress_ip_address = "10.0.200.41"
		}

			#lbbackendaddresspooladdress01_outputs
			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_01_id" {
				value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_01.lbbackendaddresspooladdress_id
			}

			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_01_name" {
				value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_01.lbbackendaddresspooladdress_name
			}

		#lbbackendaddresspooladdress02
		module "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_02" {
			source        = "github.com/cantrellcloud/tfAzureModules/lbbackendaddresspooladdress"
			#to_provis ion = local.provision_lbbackendaddresspooladdress02
			lb_backendaddresspooladdress_backend_address_pool_id = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private.lbbackendaddresspool_id
			lb_backendaddresspooladdress_name  = "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_02"
			lb_backendaddresspooladdress_virtual_network_id = module.kea_dcedemo_eastus_prod_vnet.vnet_id
			lb_backendaddresspooladdress_ip_address = "10.0.200.42"
		}

			#lbbackendaddresspooladdress02_outputs
			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_02_id" {
				value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_02.lbbackendaddresspooladdress_id
			}

			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_02_name" {
				value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_02.lbbackendaddresspooladdress_name
			}

		#lbbackendaddresspooladdress03
		module "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_03" {
			source        = "github.com/cantrellcloud/tfAzureModules/lbbackendaddresspooladdress"
			#to_provis ion = local.provision_lbbackendaddresspooladdress03
			lb_backendaddresspooladdress_backend_address_pool_id = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private.lbbackendaddresspool_id
			lb_backendaddresspooladdress_name  = "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_03"
			lb_backendaddresspooladdress_virtual_network_id = module.kea_dcedemo_eastus_prod_vnet.vnet_id
			lb_backendaddresspooladdress_ip_address = "10.0.200.43"
		}

			#lbbackendaddresspooladdress03_outputs
			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_03_id" {
				value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_03.lbbackendaddresspooladdress_id
			}

			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_03_name" {
				value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspooladdress_03.lbbackendaddresspooladdress_name
			}

		#lbprobe01
		module "kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_8080" {
			source               = "github.com/cantrellcloud/tfAzureModules/lbprobe"
			#to_provision        = local.provision_lbprobe01
			rg_name              = module.kea_dcedemo_eastus_rg.rg_name
			lbprobe_lb_id        = module.kea_dcedemo_eastus_ztcontroller_private_lb.lb_id
			lbprobe_name         = "kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_8080"
			lbprobe_protocol     = "Tcp"
			lbprobe_port         = "8080"
			lbprobe_request_path = null
		}

			#lbprobe01_outputs
			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_8080_id" {
				value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_8080.lbprobe_id
			}

			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_8080_name" {
				value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_8080.lbprobe_name
			}

		#lbrule01
		module "kea_dcedemo_eastus_ztcontroller_private_lb_lbrule_8080" {
			source                                = "github.com/cantrellcloud/tfAzureModules/lbrule"
			#to_provision                         = local.provision_lbrule01
			rg_name                               = module.kea_dcedemo_eastus_rg.rg_name
			lbrule_name                           = "kea_dcedemo_eastus_ztcontroller_private_lb_lbrule_8080"
			lb_id                                 = module.kea_dcedemo_eastus_ztcontroller_private_lb.lb_id
			lbrule_protocol                       = "Tcp"
			lbrule_frontend_port                  = 8080
			lbrule_backend_port                   = 8080
			lbrule_frontend_ip_configuration_name = module.kea_dcedemo_eastus_ztcontroller_private_lb.lb_frontend_ip_configuration_name
			lbrule_backend_address_pool_id        = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private.lbbackendaddresspool_id
			lbrule_probe_id                       = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_8080.lbprobe_id
		}

			#lbrule01_outputs
			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbrule_8080_id" {
			value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbrule_8080.lbrule_id
			}

			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbrule_8080_name" {
			value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbrule_8080.lbrule_name
			}

		#lbprobe02
		module "kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_58080" {
			source               = "github.com/cantrellcloud/tfAzureModules/lbprobe"
			#to_provision        = local.provision_lbprobe02
			rg_name              = module.kea_dcedemo_eastus_rg.rg_name
			lbprobe_lb_id        = module.kea_dcedemo_eastus_ztcontroller_private_lb.lb_id
			lbprobe_name         = "kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_58080"
			lbprobe_protocol     = "Tcp"
			lbprobe_port         = "58080"
			lbprobe_request_path = null
		}

			#lbprobe02_outputs
			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_58080_id" {
				value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_58080.lbprobe_id
			}

			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_58080_name" {
				value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_58080.lbprobe_name
			}

		#lbrule02
		module "kea_dcedemo_eastus_ztcontroller_private_lb_lbrule_58080" {
			source                                = "github.com/cantrellcloud/tfAzureModules/lbrule"
			#to_provision                         = local.provision_lbrule02
			rg_name                               = module.kea_dcedemo_eastus_rg.rg_name
			lbrule_name                           = "kea_dcedemo_eastus_ztcontroller_private_lb_lbrule_58080"
			lb_id                                 = module.kea_dcedemo_eastus_ztcontroller_private_lb.lb_id
			lbrule_protocol                       = "Tcp"
			lbrule_frontend_port                  = 58080
			lbrule_backend_port                   = 58080
			lbrule_frontend_ip_configuration_name = module.kea_dcedemo_eastus_ztcontroller_private_lb.lb_frontend_ip_configuration_name
			lbrule_backend_address_pool_id        = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbbackendaddresspool_private.lbbackendaddresspool_id
			lbrule_probe_id                       = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbprobe_58080.lbprobe_id
		}

			#lbrule02_outputs
			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbrule_58080_id" {
			value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbrule_58080.lbrule_id
			}

			output "kea_dcedemo_eastus_ztcontroller_private_lb_lbrule_58080_name" {
			value = module.kea_dcedemo_eastus_ztcontroller_private_lb_lbrule_58080.lbrule_name
			}

##########################
# ZTCONTROLLER PUBLIC LB

# lb02
module "kea_dcedemo_eastus_ztcontroller_public_lb" {
	source            = "github.com/cantrellcloud/tfAzureModules/lb"
	#to_provision     = local.provision_lb02
	rg_location       = module.kea_dcedemo_eastus_rg.rg_location
	rg_name           = module.kea_dcedemo_eastus_rg.rg_name
	lb_name           = "kea_dcedemo_eastus_ztcontroller_public_lb"
	lb_sku            = "Standard"

	#frontend_ip_configuration
	lb_frontend_ip_configuration_name = "kea_dcedemo_eastus_ztcontroller_public_lb_frontend_ip_configuration"
	lb_frontend_ip_configuration_subnet_id = null	#module.kea_dcedemo_eastus_ztcontroller_subnet.subnet_id
	lb_frontend_ip_configuration_private_ip_address = null	# "10.0.200.40"
	lb_frontend_ip_configuration_private_ip_address_allocation = null	#"Static"
	lb_frontend_ip_configuration_private_ip_address_version = null	#"IPv4"
	lb_frontend_ip_configuration_public_ip_address_id = module.kea_dcedemo_eastus_ztcontroller_public_lb_publicip.publicip_id
}

	#lb02_outputs
	output "kea_dcedemo_eastus_ztcontroller_public_lb_id" {
		value = module.kea_dcedemo_eastus_ztcontroller_public_lb.lb_id
	}
	output "kea_dcedemo_eastus_ztcontroller_public_lb_name" {
		value = module.kea_dcedemo_eastus_ztcontroller_public_lb.lb_name
	}
	output "kea_dcedemo_eastus_ztcontroller_public_lb_frontend_ip_configuration_name" {
		value = module.kea_dcedemo_eastus_ztcontroller_public_lb.lb_frontend_ip_configuration_name
	}
	output "kea_dcedemo_eastus_ztcontroller_public_lb_frontend_ip_configuration" {
		value = module.kea_dcedemo_eastus_ztcontroller_public_lb.lb_frontend_ip_configuration
	}
	output "kea_dcedemo_eastus_ztcontroller_public_lb_frontend_private_ip_address" {
		value = module.kea_dcedemo_eastus_ztcontroller_public_lb.lb_frontend_private_ip_address
	}

    # lb02_publicip
    module "kea_dcedemo_eastus_ztcontroller_public_lb_publicip" {
        source            = "github.com/cantrellcloud/tfAzureModules/publicip"
        #to_provision     = local.provision_publicip01
        rg_location       = module.kea_dcedemo_eastus_rg.rg_location
        rg_name           = module.kea_dcedemo_eastus_rg.rg_name
        publicip_name     = "kea_dcedemo_eastus_ztcontroller_public_lb_publicip"
        allocation_method = "Static"
        sku               = "Standard"
        domain_name_label = "ztpc"
    }

        #lb02_publicip_outputs
        output "kea_dcedemo_eastus_ztcontroller_public_lb_publicip_id" {
            value = module.kea_dcedemo_eastus_ztcontroller_public_lb_publicip.publicip_id
        }
        output "kea_dcedemo_eastus_ztcontroller_public_lb_publicip_name" {
            value = module.kea_dcedemo_eastus_ztcontroller_public_lb_publicip.publicip_name
        }
        output "kea_dcedemo_eastus_ztcontroller_public_lb_publicip_domain_name_label" {
            value = module.kea_dcedemo_eastus_ztcontroller_public_lb_publicip.publicip_domain_name_label
        }

	#lbbackendaddresspool01
	module "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool" {
		source                     = "github.com/cantrellcloud/tfAzureModules/lbbackendaddresspool"
		#to_provision              = local.provision_lbbackendaddresspool01
		lbbackendaddresspool_lb_id = module.kea_dcedemo_eastus_ztcontroller_public_lb.lb_id
		lbbackendaddresspool_name  = "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool"
	}

		#lbbackendaddresspool01_outputs
		output "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool_id" {
			value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool.lbbackendaddresspool_id
		}
		output "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool_name" {
			value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool.lbbackendaddresspool_name
		}
		output "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool_backend_ip_configurations" {
			value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool.lbbackendaddresspool_backend_ip_configurations
		}
		output "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool_load_balancing_rules" {
			value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool.lbbackendaddresspool_load_balancing_rules
		}
		/*output "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool_outbound_rules" {
			value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool.lbbackendaddresspool_outbound_rules
		}*/

		#lbbackendaddresspooladdress01
		module "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_01" {
			source        = "github.com/cantrellcloud/tfAzureModules/lbbackendaddresspooladdress"
			#to_provis ion = local.provision_lbbackendaddresspooladdress01
			lb_backendaddresspooladdress_backend_address_pool_id = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool.lbbackendaddresspool_id
			lb_backendaddresspooladdress_name  = "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_01"
			lb_backendaddresspooladdress_virtual_network_id = module.kea_dcedemo_eastus_prod_vnet.vnet_id
			lb_backendaddresspooladdress_ip_address = "10.0.200.41"
		}

			#lbbackendaddresspooladdress01_outputs
			output "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_01_id" {
				value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_01.lbbackendaddresspooladdress_id
			}

			output "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_01_name" {
				value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_01.lbbackendaddresspooladdress_name
			}

		#lbbackendaddresspooladdress02
		module "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_02" {
			source        = "github.com/cantrellcloud/tfAzureModules/lbbackendaddresspooladdress"
			#to_provis ion = local.provision_lbbackendaddresspooladdress02
			lb_backendaddresspooladdress_backend_address_pool_id = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool.lbbackendaddresspool_id
			lb_backendaddresspooladdress_name  = "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_02"
			lb_backendaddresspooladdress_virtual_network_id = module.kea_dcedemo_eastus_prod_vnet.vnet_id
			lb_backendaddresspooladdress_ip_address = "10.0.200.42"
		}

			#lbbackendaddresspooladdress02_outputs
			output "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_02_id" {
				value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_02.lbbackendaddresspooladdress_id
			}

			output "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_02_name" {
				value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_02.lbbackendaddresspooladdress_name
			}

		#lbbackendaddresspooladdress03
		module "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_03" {
			source        = "github.com/cantrellcloud/tfAzureModules/lbbackendaddresspooladdress"
			#to_provis ion = local.provision_lbbackendaddresspooladdress03
			lb_backendaddresspooladdress_backend_address_pool_id = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool.lbbackendaddresspool_id
			lb_backendaddresspooladdress_name  = "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_03"
			lb_backendaddresspooladdress_virtual_network_id = module.kea_dcedemo_eastus_prod_vnet.vnet_id
			lb_backendaddresspooladdress_ip_address = "10.0.200.43"
		}

			#lbbackendaddresspooladdress03_outputs
			output "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_03_id" {
				value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_03.lbbackendaddresspooladdress_id
			}

			output "kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_03_name" {
				value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspooladdress_03.lbbackendaddresspooladdress_name
			}

		#lbprobe01
		module "kea_dcedemo_eastus_ztcontroller_public_lb_lbprobe_8080" {
			source               = "github.com/cantrellcloud/tfAzureModules/lbprobe"
			#to_provision        = local.provision_lbprobe01
			rg_name              = module.kea_dcedemo_eastus_rg.rg_name
			lbprobe_lb_id        = module.kea_dcedemo_eastus_ztcontroller_public_lb.lb_id
			lbprobe_name         = "kea_dcedemo_eastus_ztcontroller_public_lb_lbprobe_8080"
			lbprobe_protocol     = "Tcp"
			lbprobe_port         = "8080"
			lbprobe_request_path = null
		}

			#lbprobe01_outputs
			output "kea_dcedemo_eastus_ztcontroller_public_lb_lbprobe_8080_id" {
				value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbprobe_8080.lbprobe_id
			}

			output "kea_dcedemo_eastus_ztcontroller_public_lb_lbprobe_8080_name" {
				value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbprobe_8080.lbprobe_name
			}

		#lbrule01
		module "kea_dcedemo_eastus_ztcontroller_public_lb_lbrule_8080" {
			source                                = "github.com/cantrellcloud/tfAzureModules/lbrule"
			#to_provision                         = local.provision_lbrule01
			rg_name                               = module.kea_dcedemo_eastus_rg.rg_name
			lbrule_name                           = "kea_dcedemo_eastus_ztcontroller_public_lb_lbrule_8080"
			lb_id                                 = module.kea_dcedemo_eastus_ztcontroller_public_lb.lb_id
			lbrule_protocol                       = "Tcp"
			lbrule_frontend_port                  = 8080
			lbrule_backend_port                   = 8080
			lbrule_frontend_ip_configuration_name = module.kea_dcedemo_eastus_ztcontroller_public_lb.lb_frontend_ip_configuration_name
			lbrule_backend_address_pool_id        = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool.lbbackendaddresspool_id
			lbrule_probe_id                       = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbprobe_8080.lbprobe_id
		}

			#lbrule01_outputs
			output "kea_dcedemo_eastus_ztcontroller_public_lb_lbrule_8080_id" {
			value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbrule_8080.lbrule_id
			}

			output "kea_dcedemo_eastus_ztcontroller_public_lb_lbrule_8080_name" {
			value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbrule_8080.lbrule_name
			}

		#lbprobe02
		module "kea_dcedemo_eastus_ztcontroller_public_lbprobe_58080" {
			source               = "github.com/cantrellcloud/tfAzureModules/lbprobe"
			#to_provision        = local.provision_lbprobe02
			rg_name              = module.kea_dcedemo_eastus_rg.rg_name
			lbprobe_lb_id        = module.kea_dcedemo_eastus_ztcontroller_public_lb.lb_id
			lbprobe_name         = "kea_dcedemo_eastus_ztcontroller_public_lbprobe_58080"
			lbprobe_protocol     = "Tcp"
			lbprobe_port         = "58080"
			lbprobe_request_path = null
		}

			#lbprobe02_outputs
			output "kea_dcedemo_eastus_ztcontroller_public_lbprobe_58080_id" {
				value = module.kea_dcedemo_eastus_ztcontroller_public_lbprobe_58080.lbprobe_id
			}

			output "kea_dcedemo_eastus_ztcontroller_public_lbprobe_58080_name" {
				value = module.kea_dcedemo_eastus_ztcontroller_public_lbprobe_58080.lbprobe_name
			}

		#lbrule02
		module "kea_dcedemo_eastus_ztcontroller_public_lb_lbrule_58080" {
			source                                = "github.com/cantrellcloud/tfAzureModules/lbrule"
			#to_provision                         = local.provision_lbrule02
			rg_name                               = module.kea_dcedemo_eastus_rg.rg_name
			lbrule_name                           = "kea_dcedemo_eastus_ztcontroller_public_lb_lbrule_58080"
			lb_id                                 = module.kea_dcedemo_eastus_ztcontroller_public_lb.lb_id
			lbrule_protocol                       = "Tcp"
			lbrule_frontend_port                  = 58080
			lbrule_backend_port                   = 58080
			lbrule_frontend_ip_configuration_name = module.kea_dcedemo_eastus_ztcontroller_public_lb.lb_frontend_ip_configuration_name
			lbrule_backend_address_pool_id        = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbbackendaddresspool.lbbackendaddresspool_id
			lbrule_probe_id                       = module.kea_dcedemo_eastus_ztcontroller_public_lbprobe_58080.lbprobe_id
		}

			#lbrule02_outputs
			output "kea_dcedemo_eastus_ztcontroller_public_lb_lbrule_58080_id" {
			value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbrule_58080.lbrule_id
			}

			output "kea_dcedemo_eastus_ztcontroller_public_lb_lbrule_58080_name" {
			value = module.kea_dcedemo_eastus_ztcontroller_public_lb_lbrule_58080.lbrule_name
			}

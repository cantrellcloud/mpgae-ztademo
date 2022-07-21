#================================================================================
#
# # Azure App Service Plan
#-----------------------
# ztaconfig     # JTODEv ZTA Config UI
# jtodevzta     # JTODev Web Site
# jtoweb        # JTO Web Site
#
# jtodev_appsvcplan01
module "jtodev_eastus2_dev_appsvcplan01" {
	source = "github.com/cantrellcloud/tfaz-appsvcplan"
	#to_provision = local.provision_appsvcplan01
	rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
	rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name

	appsvcplan_name = "jtodev_eastus2_dev_appsvcplan01"
    kind = "Linux"
    reserved = true
    is_xenon = false

    #sku
        sku_tier = "Standard"
        sku_size = "S1"
        #sku_capacity = 4
}

   #appsvcplan01_outputs
   output "jtodev_eastus2_dev_appsvcplan01_id" {
        value = module.jtodev_eastus2_dev_appsvcplan01.appsvcplan_id
    }
    output "jtodev_eastus2_dev_appsvcplan01_name" {
        value = module.jtodev_eastus2_dev_appsvcplan01.appsvcplan_name
    }
    output "jtodev_eastus2_dev_appsvcplan01_kind" {
        value = module.jtodev_eastus2_dev_appsvcplan01.appsvcplan_kind
    }
    output "jtodev_eastus2_dev_appsvcplan01_appsvcplan01_maximum_number_of_workers" {
        value = module.jtodev_eastus2_dev_appsvcplan01.appsvcplan_maximum_number_of_workers
    }

/*    #ztaconfig    # JTODEv ZTA Config UI
    module "jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc" {
        source = "github.com/cantrellcloud/tfaz-appsvc"
        #to_provision = local.provision_ztaconfig
        rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
        rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name
        appsvc_name = "ztaconfig"
        appsvcplan_id = module.jtodev_eastus2_dev_appsvcplan01.appsvcplan_id

        #site_config
        site_config_always_on                   = true
        site_config_dotnet_framework_version    = "v4.0"
        site_config_ftps_state                  = "FtpsOnly"
        site_config_http2_enabled               = false
        #site_config_ip_restriction              = 
        site_config_linux_fx_version            = "DOTNETCORE|6.0"
        #site_config_windows_fx_version            = "TOMCAT|8.5-jre8"
        site_config_local_mysql_enabled         = true
        #site_config_managed_pipeline_mode       = 
        #site_config_min_tls_version             = 
        #site_config_number_of_workers           = 
        site_config_remote_debugging_enabled    = false
        #site_config_remote_debugging_version     = 
        #site_config_scm_ip_restriction          = 
        site_config_scm_type                    = "LocalGit"
        #site_config_scm_use_main_ip_restriction = false
        site_config_websockets_enabled          = true

        #connection_string
        connection_string_name  = "ztaconfigdb"
        connection_string_type  = "MySQL"
        connection_string_value = "Server=ztaconfigdb;Integrated Security=SSPI"
    }

        #ztaconfig_outputs
        output "jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc_id" {
            value = module.jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc.appsvc_id
        }
        output "jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc_name" {
            value = module.jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc.appsvc_name
        }
        output "jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc_default_site_hostname" {
            value = module.jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc.appsvc_default_site_hostname
        }
        output "jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc_custom_domain_verification_id" {
            value = module.jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc.appsvc_custom_domain_verification_id
        }
        output "jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc_source_control" {
            value = module.jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc.appsvc_source_control
        }
        output "jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc_site_credential" {
            value = module.jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc.appsvc_site_credential
        }
        output "jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc_identity" {
            value = module.jtodev_eastus2_dev_appsvcplan01_ztaconfig_appsvc.appsvc_identity
        }
*/
    #jtodevzta    # JTODev Web Site
    module "jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc" {
        source = "github.com/cantrellcloud/tfaz-appsvc"
        #to_provision = local.provision_jtodevzta
        rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
        rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name
        appsvc_name = "jtodevzta"
        appsvcplan_id = module.jtodev_eastus2_dev_appsvcplan01.appsvcplan_id

        #site_config
        site_config_always_on                   = true
        site_config_dotnet_framework_version    = "v4.0"
        site_config_ftps_state                  = "FtpsOnly"
        site_config_http2_enabled               = false
        #site_config_ip_restriction              = 
        site_config_linux_fx_version            = "DOTNETCORE|6.0"
        site_config_local_mysql_enabled         = true
        #site_config_managed_pipeline_mode       = 
        #site_config_min_tls_version             = 
        #site_config_number_of_workers           = 
        site_config_remote_debugging_enabled    = false
        #site_config_remote_debugging_version    = 
        #site_config_scm_ip_restriction          = 
        site_config_scm_type                    = "LocalGit"
        #site_config_scm_use_main_ip_restriction = false
        site_config_websockets_enabled          = true

        #connection_string
        connection_string_name  = "jtodevztadb"
        connection_string_type  = "MySQL"
        connection_string_value = "Server=jtodevztadb;Integrated Security=SSPI"
    }

        #jtodevzta_outputs
        output "jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc_id" {
            value = module.jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc.appsvc_id
        }
        output "jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc_name" {
            value = module.jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc.appsvc_name
        }
        output "jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc_default_site_hostname" {
            value = module.jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc.appsvc_default_site_hostname
        }
        output "jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc_custom_domain_verification_id" {
            value = module.jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc.appsvc_custom_domain_verification_id
        }
        output "jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc_source_control" {
            value = module.jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc.appsvc_source_control
        }
        output "jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc_site_credential" {
            value = module.jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc.appsvc_site_credential
        }
        output "jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc_identity" {
            value = module.jtodev_eastus2_dev_appsvcplan01_jtodevzta_appsvc.appsvc_identity
        }

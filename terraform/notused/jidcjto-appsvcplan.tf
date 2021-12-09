#================================================================================
#
# POLICY ENFORCEMENT POINT : POLICY CONTROLLER
#
# Policy Enforcement Point for __________ application.
# Used in a DataCentric Environment built on the principal of Attribute Based
# Access Control and Zero-Trust methodologies.
#
# This application was developed using the Policy Controller for Java and
# Nextlabs Java SDK.  In addition, the Policy Controller for Java is only
# compatible with the NextLabs Java SDK
#
# Java/Tomcat 8.5 Web Application Service
# Azure App Service Plan
#-----------------------
# ztaappsvc01
# ztaappsvc02
#

# appsvcplan01
module "jtodev_eastus2_dev_appsvcplan" {
	source = "github.com/cantrellcloud/tfaz-appsvcplan"
	#to_provision = local.provision_appsvcplan01
	rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
	rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name

	appsvcplan_name = "jtodev_eastus2_dev_appsvcplan"
    kind = "Linux"
    reserved = true
    is_xenon = false

    #sku
        sku_tier = "Basic"
        sku_size = "B2"
        #sku_capacity = 4
}

   #appsvcplan01_outputs
   output "jtodev_eastus2_dev_appsvcplan_id" {
        value = module.jtodev_eastus2_dev_appsvcplan.appsvcplan_id
    }
    output "jtodev_eastus2_dev_appsvcplan_name" {
        value = module.jtodev_eastus2_dev_appsvcplan.appsvcplan_name
    }
    output "jtodev_eastus2_dev_appsvcplan_kind" {
        value = module.jtodev_eastus2_dev_appsvcplan.appsvcplan_kind
    }
    output "jtodev_eastus2_dev_appsvcplan_appsvcplan_maximum_number_of_workers" {
        value = module.jtodev_eastus2_dev_appsvcplan.appsvcplan_maximum_number_of_workers
    }

    #ztaappsvc01
    module "jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc" {
        source = "github.com/cantrellcloud/tfaz-appsvc"
        #to_provision = local.provision_ztaappsvc01
        rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
        rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name
        appsvc_name = "ztaappsvc01"
        appsvcplan_id = module.jtodev_eastus2_dev_appsvcplan.appsvcplan_id

        #site_config
        site_config_always_on                   = true
        site_config_dotnet_framework_version    = "v4.0"
        site_config_ftps_state                  = "FtpsOnly"
        site_config_http2_enabled               = false
        #site_config_ip_restriction              = 
        site_config_linux_fx_version            = "TOMCAT|8.5-jre8"
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
        connection_string_name  = "ztaappsvc01db"
        connection_string_type  = "MySQL"
        connection_string_value = "Server=ztaappsvc01db;Integrated Security=SSPI"
    }

        #ztaappsvc01_outputs
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc_id" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc.appsvc_id
        }
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc_name" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc.appsvc_name
        }
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc_default_site_hostname" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc.appsvc_default_site_hostname
        }
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc_custom_domain_verification_id" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc.appsvc_custom_domain_verification_id
        }
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc_source_control" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc.appsvc_source_control
        }
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc_site_credential" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc.appsvc_site_credential
        }
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc_identity" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc01_appsvc.appsvc_identity
        }

    #ztaappsvc02
    module "jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc" {
        source = "github.com/cantrellcloud/tfaz-appsvc"
        #to_provision = local.provision_ztaappsvc02
        rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
        rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name
        appsvc_name = "ztaappsvc02"
        appsvcplan_id = module.jtodev_eastus2_dev_appsvcplan.appsvcplan_id

        #site_config
        site_config_always_on                   = true
        site_config_dotnet_framework_version    = "v4.0"
        site_config_ftps_state                  = "FtpsOnly"
        site_config_http2_enabled               = false
        #site_config_ip_restriction              = 
        site_config_linux_fx_version            = "TOMCAT|8.5-jre8"
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
        connection_string_name  = "ztaappsvc02db"
        connection_string_type  = "MySQL"
        connection_string_value = "Server=ztaappsvc02db;Integrated Security=SSPI"
    }

        #ztaappsvc02_outputs
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc_id" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc.appsvc_id
        }
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc_name" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc.appsvc_name
        }
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc_default_site_hostname" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc.appsvc_default_site_hostname
        }
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc_custom_domain_verification_id" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc.appsvc_custom_domain_verification_id
        }
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc_source_control" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc.appsvc_source_control
        }
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc_site_credential" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc.appsvc_site_credential
        }
        output "jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc_identity" {
            value = module.jtodev_eastus2_dev_appsvcplan_ztaappsvc02_appsvc.appsvc_identity
        }

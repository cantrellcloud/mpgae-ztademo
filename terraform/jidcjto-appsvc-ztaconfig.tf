# ztaconfig     # JTODEv ZTA Config UI
module "jtodev_eastus2_dev_appsvc_ztaconfig" {
    source = "github.com/cantrellcloud/tfaz-appsvc"
    #to_provision = local.provision_ztaconfig
    rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
    rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name
    appsvc_name = "ztaconfig"
    appsvcplan_id = module.jtodev_eastus2_dev_appsvcplan_ztaconfig.appsvcplan_id

    #site_config
    site_config_always_on                    = true
    site_config_dotnet_framework_version     = "v4.0"
    site_config_ftps_state                   = "FtpsOnly"
    site_config_http2_enabled                = false
    #site_config_ip_restriction              = 
    #site_config_linux_fx_version            = "DOTNETCORE|6.0"
    site_config_windows_fx_version           = "DOTNETCORE|6.0"
    site_config_local_mysql_enabled          = true
    #site_config_managed_pipeline_mode       = 
    #site_config_min_tls_version             = 
    #site_config_number_of_workers           = 
    site_config_remote_debugging_enabled     = false
    #site_config_remote_debugging_version    = 
    #site_config_scm_ip_restriction          = 
    site_config_scm_type                     = "LocalGit"
    #site_config_scm_use_main_ip_restriction = false
    site_config_websockets_enabled           = true
    #site_config_default_documents           = "hostingstart.html"

    #source_control
    #source_control_repo_url = null
    #source_control_branch   = null

    appsvc_app_settings = {
        "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"/*,
        "MICROSOFT_PROVIDER_AUTHENTICATION_SECRET" = "OJv8Q~bjNVa4DsecIDvg7bseR-Y4JyluAOMeNc2z"*/
    }

    #connection_string
    connection_string_name  = "ztaconfigdb"
    connection_string_type  = "MySqL"
    connection_string_value = "Server=ztaconfigdb;Integrated Security=SSPI"
}

    #ztaconfig_outputs
    output "jtodev_eastus2_dev_appsvc_ztaconfig_id" {
        value = module.jtodev_eastus2_dev_appsvc_ztaconfig.appsvc_id
    }
    output "jtodev_eastus2_dev_appsvc_ztaconfig_name" {
        value = module.jtodev_eastus2_dev_appsvc_ztaconfig.appsvc_name
    }
    output "jtodev_eastus2_dev_appsvc_ztaconfig_default_site_hostname" {
        value = module.jtodev_eastus2_dev_appsvc_ztaconfig.appsvc_default_site_hostname
    }
    output "jtodev_eastus2_dev_appsvc_ztaconfig_custom_domain_verification_id" {
        value = module.jtodev_eastus2_dev_appsvc_ztaconfig.appsvc_custom_domain_verification_id
    }
    output "jtodev_eastus2_dev_appsvc_ztaconfig_source_control" {
        value = module.jtodev_eastus2_dev_appsvc_ztaconfig.appsvc_source_control
    }
    output "jtodev_eastus2_dev_appsvc_ztaconfig_site_credential" {
        value = module.jtodev_eastus2_dev_appsvc_ztaconfig.appsvc_site_credential
    }
    output "jtodev_eastus2_dev_appsvc_ztaconfig_identity" {
        value = module.jtodev_eastus2_dev_appsvc_ztaconfig.appsvc_identity
    }

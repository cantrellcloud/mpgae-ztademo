# jtodevzta     # JTODev ZTA Home
module "jtodev_eastus2_dev_appsvc_jtodevzta" {
    source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-appsvc"
    #to_provision = local.provision_jtodevzta
    rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
    rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name
    appsvc_name = "jtodevzta"
    appsvcplan_id = module.jtodev_eastus2_dev_appsvcplan_jtodevzta.appsvcplan_id

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
        "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    }

    identity_type = "SystemAssigned"

    #connection_string
    connection_string_name  = "jtodevztadb"
    connection_string_type  = "MySQL"
    connection_string_value = "Server=jtodevztadb;Integrated Security=SSPI"
}

    #jtodevzta_outputs
    output "jtodev_eastus2_dev_appsvc_jtodevzta_id" {
        value = module.jtodev_eastus2_dev_appsvc_jtodevzta.appsvc_id
    }
    output "jtodev_eastus2_dev_appsvc_jtodevzta_name" {
        value = module.jtodev_eastus2_dev_appsvc_jtodevzta.appsvc_name
    }
    output "jtodev_eastus2_dev_appsvc_jtodevzta_default_site_hostname" {
        value = module.jtodev_eastus2_dev_appsvc_jtodevzta.appsvc_default_site_hostname
    }
    output "jtodev_eastus2_dev_appsvc_jtodevzta_custom_domain_verification_id" {
        value = module.jtodev_eastus2_dev_appsvc_jtodevzta.appsvc_custom_domain_verification_id
    }
    output "jtodev_eastus2_dev_appsvc_jtodevzta_source_control" {
        value = module.jtodev_eastus2_dev_appsvc_jtodevzta.appsvc_source_control
    }
    output "jtodev_eastus2_dev_appsvc_jtodevzta_site_credential" {
        value = module.jtodev_eastus2_dev_appsvc_jtodevzta.appsvc_site_credential
    }
    output "jtodev_eastus2_dev_appsvc_jtodevzta_identity" {
        value = module.jtodev_eastus2_dev_appsvc_jtodevzta.appsvc_identity
    }

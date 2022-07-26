# staticsite_onboardsdp     # JTODev ZTA Onboard SDP site
module "jtodev_eastus2_dev_staticsite_onboardsdp" {
    source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-staticsite"
    #to_provision = local.provision_staticsite_onboardsdp
    rg_location = module.jtodev_eastus2_dev_appsvcplan_rg.rg_location
    rg_name = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name
    rg_tags = {
        "Management Group" = "MPG A&E EastUS2",
		"Environment" = "JTODev",
		"AutomatedBy" = "Terraform",
		"Note1" = "Do not manually change",
		"POCName" = "ronc@mindpointgroup.com",
		"POCPhone" = "843.330.6769",
		"Project" = "Zero Trust Demo"
	}

    staticsite_name = "onboardsdp"
    staticsite_sku_size = "Standard"
    staticsite_sku_tier = "Standard"
    staticsite_identity_type = "SystemAssigned"
}

    #staticsite_onboardsdp_outputs
    output "jtodev_eastus2_dev_staticsite_onboardsdp_id" {
        value = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_id
    }
    output "jtodev_eastus2_dev_staticsite_onboardsdp_name" {
        value = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_name
    }
    output "jtodev_eastus2_dev_staticsite_onboardsdp_api_key" {
        value = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_api_key
    }
    output "jtodev_eastus2_dev_staticsite_onboardsdp_staticsite_default_host_name" {
        value = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_default_host_name
    }
    output "jtodev_eastus2_dev_staticsite_onboardsdp_staticsite_identity" {
        value = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_identity
    }

# staticsitecustomdomain_jidcjto_com     # jidcjto.com static site custom domain
module "jtodev_eastus2_dev_staticsitecustomdomain_jidcjto_com" {
    source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-staticsitecustomdomain"
    #to_provision = local.provision_staticsitecustomdomain_jidcjto_com
    staticsitecustomdomain_domain_name = "onboardsdp.${module.jtodev_eastus2_dev_dnszone_jidcjto_com.dnszone_name}"
    staticsitecustomdomain_static_site_id = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_id
}
    #staticsitecustomdomain_jidcjto_com_outputs
    output "jtodev_eastus2_dev_staticsitecustomdomain_jidcjto_com_id" {
        value = module.jtodev_eastus2_dev_staticsitecustomdomain_jidcjto_com.staticsitecustomdomain_id
    }

# dnscnamerecord_onboardsdp
module "jtodev_eastus2_dev_dnscnamerecord_onboardsdp" {
    source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-dnscnamerecord"
    #to_provision = local.provision_dnscnamerecord_onboardsdp
    dnscnamerecord_name      = "onboardsdp"
    dnscnamerecord_zone_name = module.jtodev_eastus2_dev_dnszone_jidcjto_com.dnszone_name
    rg_name                  = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name
    dnscnamerecord_ttl       = 600
    dnscnamerecord_record    = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_default_host_name
}

# dnstxtrecord_onboardsdp
module "jtodev_eastus2_dev_dnstxtrecord_onboardsdp" {
    source = "github.com/MindPointGroup/mpgae-tf-azurerm-modules/tfaz-dnstxtrecord"
    #to_provision = local.provision_dnstxtrecord_onboardsdp
    dnstxtrecord_name      = "_dnsauth.onboardsdp"
    dnstxtrecord_zone_name = module.jtodev_eastus2_dev_dnszone_jidcjto_com.dnszone_name
    rg_name                = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name
    dnstxtrecord_ttl       = 600
    dnstxtrecord_record    = module.jtodev_eastus2_dev_staticsitecustomdomain_jidcjto_com.staticsitecustomdomain_validation_token
}

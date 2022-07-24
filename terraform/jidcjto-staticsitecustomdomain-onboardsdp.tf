# staticsitecustomdomain_jidcjto_com     # jidcjto.com static site custom domain
module "jtodev_eastus2_dev_staticsitecustomdomain_jidcjto_com" {
    source = "github.com/cantrellcloud/tfaz-staticsitecustomdomain"
    #to_provision = local.provision_staticsitecustomdomain_jidcjto_com
    staticsitecustomdomain_domain_name = "jidcjto.com"
    staticsitecustomdomain_static_site_id = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_id
}
    #staticsitecustomdomain_jidcjto_com_outputs
    output "jtodev_eastus2_dev_staticsitecustomdomain_jidcjto_com_id" {
        value = module.jtodev_eastus2_dev_staticsitecustomdomain_jidcjto_com.staticsitecustomdomain_id
    }

# dnscnamerecord_onboardsdp
module "jtodev_eastus2_dev_dnscnamerecord_onboardsdp" {
    source = "github.com/cantrellcloud/tfaz-dnscnamerecord"
    #to_provision = local.provision_dnscnamerecord_onboardsdp
    dnscnamerecord_name      = "onboardsdp"
    dnscnamerecord_zone_name = module.jtodev_eastus2_dev_dnszone_jidcjto_com.dnszone_name
    rg_name                  = module.jtodev_eastus2_dev_appsvcplan_rg.rg_name
    dnscnamerecord_ttl       = 600
    dnscnamerecord_record    = module.jtodev_eastus2_dev_staticsite_onboardsdp.staticsite_default_host_name
}

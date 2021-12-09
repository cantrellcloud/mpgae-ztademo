#================================================================================
#
# VPN GATEWAY

# vpngw01
module "jtodev_eastus2_dev_vnetgw" {
	source                = "github.com/cantrellcloud/tfaz-vnetgw"
    rg_location           = module.jtodev_eastus2_dev_rg.rg_location
    rg_name               = module.jtodev_eastus2_dev_rg.rg_name
	rg_tags               = {
		"ManagementGroup" = "MPG A&E EastUS2",
		"Environment"     = "Dev",
		"AutomatedBy"     = "Terraform",
		"Note1"           = "Do not manually change",
		"POCName"         = "ronc@mindpointgroup.com",
		"POCPhone"        = "843.330.6769",
		"Project"         = "Zero Trust Demo"
	}

	vnetgw_name                             = "jtodev_eastus2_dev_vnetgw"
	vnetgw_type                             = "Vpn"
	vnetgw_vpn_type                         = "RouteBased"
	vnetgw_active_active                    = false
	vnetgw_enable_bgp                       = false
	vnetgw_sku                              = "VpnGw1"

	#ip_configuration
		vnetgw_ip_configuration_name                          = "default"
		vnetgw_ip_configuration_public_ip_address_id          = module.jtodev_eastus2_dev_vnetgw_publicip.publicip_id
		vnetgw_ip_configuration_private_ip_address_allocation = "Dynamic"
		vnetgw_ip_configuration_subnet_id                     = module.jtodev_eastus2_dev_subnetgw_subnet.subnet_id

	#vpn_client_configuration
		vnetgw_vpn_client_configuration_address_space = [
			"172.16.200.240/29"
		]
		vnetgw_vpn_client_configuration_vpn_client_protocols = [
			"SSTP",
			"IKEv2"
		]
		#root_certificate
		vnetgw_root_certificate_name = "COCLOUD-ROOTCantrell_Cloud_Certificate_Authority"
		vnetgw_root_certificate_public_cert_data = <<EOF
			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
			q4APpksHhg==
		EOF

		#root_certificate 
		/*vnetgw_root_certificate_name = "COCLOUD-SUBCA01Cantrell_Cloud_Issuing_Certificate_Authority"
		vnetgw_root_certificate_public_cert_data = <<EOF
			MIIG2jCCBMKgAwIBAgITUAAAAAJIfok5jdWaHgAAAAAAAjANBgkqhkiG9w0BAQsF
			ADAvMS0wKwYDVQQDEyRDYW50cmVsbCBDbG91ZCBDZXJ0aWZpY2F0ZSBBdXRob3Jp
			dHkwHhcNMjAwNTA5MDU1MjA0WhcNMzAwNTA5MDYwMjA0WjBuMRUwEwYKCZImiZPy
			LGQBGRYFY2xvdWQxHjAcBgoJkiaJk/IsZAEZFg5jYW50cmVsbG9mZmljZTE1MDMG
			A1UEAxMsQ2FudHJlbGwgQ2xvdWQgSXNzdWluZyBDZXJ0aWZpY2F0ZSBBdXRob3Jp
			dHkwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDCfdrH6UouB3ZqFfho
			i6SJjq9t2jwnXupAXWWyr5ndoa+MDkYvRsV18ZWLnp4564HWGkX1mVZaTlpfrnTF
			flMFmB4kf2rvcr5wXCUdu+ZoL67Y2PZDQcu9Hy/kBKydH1R8iC8qSsoWeh6DkUSi
			xnFef9eJ3/zEOago9RngPgjN9EAAWMxytYvEAIapNLtJb1SC+Ya335iCtevAOyoi
			cQ2aBaSszYdCGD1Qse/y7wZYQ9TQhqrtbxUU2MQP9PyK7nPBx7fvPJdRDDMxPEk2
			64Gh+1m/nKzlNIIA2fBsIM9fcFh2eOEk/iZbHj54NpX+na9IIdTvozYxH2TnFEYb
			HA2AfZb4E0QbezPLT2gQ3/X9BHOYp9AjahTQXzEQl446Vr5eXD95c5sbO8f1EzgO
			fhFbYx3jziY2ug6AgmGfJYm8cVCj52qiOxmP1PhC/CxsEqRTQ8k41sU7v7zwl+Tq
			INvlVVQIdtVKdSTf4NtTTQ8FHbDnDDAi0eoG+jF0ew4uX9MTTqfxhtxfK57+96h6
			wlhUzTI3ALjyF/mBB/vK4cXHmQg325nC3loCMmX4g54JZktD27rti4PcsKICM4fU
			uIUDZ2ugmxnFv1a3S9JvjCwlpwU29TTPmdqFr8Rr0OP2A9PHLrNHccMvxGC5hVB8
			tdOtN9oi6eFqSWsC2X0STJc3VQIDAQABo4IBrjCCAaowEAYJKwYBBAGCNxUBBAMC
			AQAwHQYDVR0OBBYEFO1aZQgkPZ3qqOUQZbzyUFIFF6fDMGYGA1UdIARfMF0wWwYj
			KoZIhvcUAb5Ak3qC+RKCyTiD3keBgUWC9mCDmXWDjAqDoxgwNDAyBggrBgEFBQcC
			ARYmaHR0cDovL3BraS5jYW50cmVsbC5jbG91ZC9wa2kvY3BzLmh0bWwwGQYJKwYB
			BAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1UdEwEB/wQFMAMB
			Af8wHwYDVR0jBBgwFoAU5Hr6njA57b8rpCYDGaNz9/J+fMYwPwYDVR0fBDgwNjA0
			oDKgMIYuaHR0cDovL3BraS5jYW50cmVsbC5jbG91ZC9wa2kvQ09DTE9VRC1ST09U
			LmNybDB0BggrBgEFBQcBAQRoMGYwZAYIKwYBBQUHMAKGWGh0dHA6Ly9wa2kuY2Fu
			dHJlbGwuY2xvdWQvcGtpL0NPQ0xPVUQtUk9PVENhbnRyZWxsJTIwQ2xvdWQlMjBD
			ZXJ0aWZpY2F0ZSUyMEF1dGhvcml0eS5jcnQwDQYJKoZIhvcNAQELBQADggIBAHRn
			kXwasWvRO6o4mHQSaE5owemQzHrZRvyGwHZp6FqYPBmEg2K22O7+79Z/1+a2vyvy
			3TnxBFTT437QfTwAwiklhHvvgkXWJ55hFSDrUinr/COHEy7Zw85v+khPdVq0BqWJ
			AZa52ss1AvZRUfqYTklU8p6geZtWt3FgMIjwEXewRhfwbsloBlxMmh/FG/8ORkW1
			RyZa7V/zM7f5IcElSxdFEQ6NC+PAdjrxrODgTL10DvV4bELXVpQYxaQkK/FCio5l
			EAA/rbQwHo8jovlgR26NucqFFNGs1Tp/Lug1wYiat4bL/UJlGkElpErNrZjoB0Uj
			8uylVcpiNopQNvW0Z2oXKp92jcF3bii9qVDEF6xK7rdeGDSvRXGaTt1WPbFqyNA5
			0a4tAK3IrTrsQ1mjb/9i9nbGtvHW08l9AP0ezY1NLNyNrhSA2Eh7MlvJGpsY4pQE
			9SbxHRddGrUKzq7prbWd7E3/XlVK9vLAqa69BVqn3HAgCxCN3LXnPxuIOO9ri0kJ
			nOUX7KwLRw7fkp9Gd5dStxPVby15KCmO4EzlvRtBK+5IvUcxxCKUUUYIo1dTSFPr
			1LH/nb6wv/3Aeb/1eP/MQo5rClyl14v8VaMSsqMN1KX61OAOV2Y+CKNy2SFloQq3
			19/v8gaG3N9mtGslz7oLWKz6BuW6t/ugOIQgOn5I
		EOF
*/
	#bgp_settings
		vnetgw_bgp_settings_asn = 65515
		vnetgw_bgp_settings_peer_weight = 0
		vnetgw_bgp_settings_peering_addresses = "172.16.200.254"
		 
}

# vnetgw01_outputs
    output "jtodev_eastus2_dev_vnetgw_id" {
        value = module.jtodev_eastus2_dev_vnetgw.vnetgw_id
    }
    output "jtodev_eastus2_dev_vnetgw_name" {
        value = module.jtodev_eastus2_dev_vnetgw.vnetgw_name
    }

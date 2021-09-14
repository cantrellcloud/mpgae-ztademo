# CCES - Virtual Network Connections

resource "azurerm_virtual_network_gateway_connection" "itproductioneastuscotpa-vpnconn" {
	name = "it_production_eastus-cotpa"
	location = azurerm_resource_group.itproductioneastus-rg.location
	resource_group_name = azurerm_resource_group.itproductioneastus-rg.name
	tags = {
		ManagementGroup = "IT"
		Location = "EastUS"
		Environment = "Production"
		ManagedBy = "Terraform"
	}
	authorization_key = null
	connection_protocol = "IKEv2"
	dpd_timeout_seconds = 0
	enable_bgp = false
	express_route_circuit_id = null
	express_route_gateway_bypass = false
	local_azure_ip_address_enabled = false
	local_network_gateway_id = azurerm_local_network_gateway.itproductioneastuscotpa-localgw.id
	peer_virtual_network_gateway_id = null
	routing_weight = 0
	shared_key = "RD#v\u002696f7@\u0026FA^vBouxG"
	type = "IPsec"
	use_policy_based_traffic_selectors = false
	virtual_network_gateway_id = azurerm_virtual_network_gateway.itproductioneastus-vnetgw.id
}
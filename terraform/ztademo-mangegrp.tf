#================================================================================
#
# ZTADEMO
# Management Groups
#
#================================================================================
#
data "azurerm_subscription" "mpgae" {
	subscription_id = "e881dd00-1c8f-4a37-a621-1172a91700b5"
}

resource "azurerm_management_group" "mpgae_mgtgrp" {
	display_name = "MPG A&E"
	name = "mpgae_mgtgrp"
	subscription_ids = [
		"e881dd00-1c8f-4a37-a621-1172a91700b5",
	]
}

resource "azurerm_management_group" "mpgaeeastus_mgtgrp" {
	display_name = "MPG A&E EastUS"
	name = "mpgae_eastus_mgtgrp"
	parent_management_group_id = azurerm_management_group.mpgae_mgtgrp.id
}

resource "azurerm_management_group" "mpgaeeastus2_mgtgrp" {
	display_name = "MPG A&E EastUS2"
	name = "mpgae_eastus2_mgtgrp"
	parent_management_group_id = azurerm_management_group.mpgae_mgtgrp.id
}

resource "azurerm_management_group" "mpgaewestus_mgtgrp" {
	display_name = "MPG A&E WestUS"
	name = "mpgae_westus_mgtgrp"
	parent_management_group_id = azurerm_management_group.mpgae_mgtgrp.id
}
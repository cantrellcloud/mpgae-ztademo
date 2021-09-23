#================================================================================
#
# ZTADEMO
# Management Groups
#
#================================================================================
#
data "azurerm_subscription" "mpgae" {
	subscription_id = "919946d0-8cae-4e2d-9430-e33602bddf9c"
}

resource "azurerm_management_group" "mpgae_mgtgrp" {
	display_name = "MPG A&E"
	name = "mpgae_mgtgrp"
	subscription_ids = [
		"919946d0-8cae-4e2d-9430-e33602bddf9c",
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
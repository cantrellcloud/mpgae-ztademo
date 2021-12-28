#================================================================================
#
# ZTADEV
# Management Groups
#
#================================================================================
#
data "azurerm_subscription" "ztadev" {
	subscription_id = "e881dd00-1c8f-4a37-a621-1172a91700b5"
}

resource "azurerm_management_group" "ztadev_mgtgrp" {
	display_name = "MPG A&E ZTA Dev"
	name = "ztadev_mgtgrp"
	/*subscription_ids = [
		"e881dd00-1c8f-4a37-a621-1172a91700b5",
	]*/
}

resource "azurerm_management_group" "ztadev_eastus_mgtgrp" {
	display_name = "MPG A&E ZTA Dev EastUS"
	name = "ztadev_eastus_mgtgrp"
	parent_management_group_id = azurerm_management_group.ztadev_mgtgrp.id
}

resource "azurerm_management_group" "ztadev_eastus2_mgtgrp" {
	display_name = "MPG A&E ZTA Dev EastUS2"
	name = "ztadev_eastus2_mgtgrp"
	parent_management_group_id = azurerm_management_group.ztadev_mgtgrp.id
}

resource "azurerm_management_group" "ztadev_westus_mgtgrp" {
	display_name = "MPG A&E ZTA Dev WestUS"
	name = "ztadev_westus_mgtgrp"
	parent_management_group_id = azurerm_management_group.ztadev_mgtgrp.id
}

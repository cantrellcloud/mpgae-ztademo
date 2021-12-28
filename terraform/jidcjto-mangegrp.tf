#================================================================================
#
# ZTADEV
# Management Groups
#
#================================================================================
#
data "azurerm_subscription" "jtodev" {
	subscription_id = "e881dd00-1c8f-4a37-a621-1172a91700b5"
}

resource "azurerm_management_group" "jtodev_mgtgrp" {
	display_name = "MPG A&E ZTA Dev"
	name = "jtodev_mgtgrp"
	/*subscription_ids = [
		"e881dd00-1c8f-4a37-a621-1172a91700b5",
	]*/
}

resource "azurerm_management_group" "jtodev_eastus_mgtgrp" {
	display_name = "MPG A&E ZTA Dev EastUS"
	name = "jtodev_eastus_mgtgrp"
	parent_management_group_id = azurerm_management_group.jtodev_mgtgrp.id
}

resource "azurerm_management_group" "jtodev_eastus2_mgtgrp" {
	display_name = "MPG A&E ZTA Dev EastUS2"
	name = "jtodev_eastus2_mgtgrp"
	parent_management_group_id = azurerm_management_group.jtodev_mgtgrp.id
}

resource "azurerm_management_group" "jtodev_westus_mgtgrp" {
	display_name = "MPG A&E ZTA Dev WestUS"
	name = "jtodev_westus_mgtgrp"
	parent_management_group_id = azurerm_management_group.jtodev_mgtgrp.id
}

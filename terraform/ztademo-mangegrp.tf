#================================================================================
#
# ZTADEMO
# Management Groups
#
#================================================================================
#
data "azurerm_subscription" "ae700rd" {
	subscription_id = "919946d0-8cae-4e2d-9430-e33602bddf9c"
}

resource "azurerm_management_group" "ae700rd_mgtgrp" {
	display_name = "A&E 700 R&D"
	name = "ae700rd_mgtgrp"
	/*subscription_ids = [
		"919946d0-8cae-4e2d-9430-e33602bddf9c",
	]*/
}

resource "azurerm_management_group" "ae700rdeastus_mgtgrp" {
	display_name = "A&E 700 R&D EastUS"
	name = "ae700rd_eastus_mgtgrp"
	parent_management_group_id = azurerm_management_group.ae700rd_mgtgrp.id
}

resource "azurerm_management_group" "ae700rdeastus2_mgtgrp" {
	display_name = "A&E 700 R&D EastUS2"
	name = "ae700rd_eastus2_mgtgrp"
	parent_management_group_id = azurerm_management_group.ae700rd_mgtgrp.id
}

resource "azurerm_management_group" "ae700rdwestus_mgtgrp" {
	display_name = "A&E 700 R&D WestUS"
	name = "ae700rd_westus_mgtgrp"
	parent_management_group_id = azurerm_management_group.ae700rd_mgtgrp.id
}
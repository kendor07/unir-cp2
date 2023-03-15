#terraform script meant to create an acr repository for casopractico2
###
# geo replications is convinient for production but not for 
# a lab environment, commented to reduce posible costs
###

resource "azurerm_container_registry" "acr" {
  name                = var.container_registry["name"]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.container_registry["sku"]
  admin_enabled       = var.container_registry["admin_enabled"]
  #georeplications {
  #  location                = "East US"
  #  zone_redundancy_enabled = true
  #  tags                    = {}
  #}
  #georeplications {
  #  location                = "North Europe"
  #  zone_redundancy_enabled = true
  #  tags                    = {}
  #}
}
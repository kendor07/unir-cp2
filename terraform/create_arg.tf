#terraform script meant to create the rg in azure for casopractico2
#rg is shared by many resources

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group["name"]
  location = var.resource_group["location"]
}

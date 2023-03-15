#terraform script meant to create a kubernetes cluster for casopractico2

resource "azurerm_kubernetes_cluster" "aks-cp2" {
  name                = var.kubernetes_cluster["name"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.kubernetes_cluster["dns_prefix"]

  default_node_pool {
    name       = var.kubernetes_cluster["pool_name"]
    node_count = var.kubernetes_cluster["node_count"]
    vm_size    = var.kubernetes_cluster["vm_size"]
  }

  identity {
    type = var.kubernetes_cluster["identity_type"]
  }

  tags = {
    Environment = var.kubernetes_cluster["environment"]
  }
}

resource "azurerm_role_assignment" "aks-acs-role" {
  principal_id                     = azurerm_kubernetes_cluster.aks-cp2.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks-cp2.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks-cp2.kube_config_raw
  sensitive = true
}
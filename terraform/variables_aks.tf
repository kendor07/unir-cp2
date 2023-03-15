# From this file we configure the variables that terraform will use 
# to create the aks cluster

variable "kubernetes_cluster" {
  description = "Configuring the resoruce group for CasoPractico2"
  type = object({
    name          = string
    dns_prefix    = string
    pool_name     = string
    node_count    = number
    vm_size       = string
    identity_type = string
    environment   = string
  })
  default = {
    name          = "cp2-aks1-001"
    dns_prefix    = "cp2aks1"
    pool_name     = "default"
    node_count    = 1
    vm_size       = "Standard_D2_v2"
    identity_type = "SystemAssigned"
    environment   = "Development"
  }
}

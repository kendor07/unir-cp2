# From this file we configure the variables that terraform will use 
# to create the container registry

variable "container_registry" {
  description = "Configuring the container regisry for CasoPractico2"
  type = object({
    name          = string
    sku           = string
    admin_enabled = bool
  })
  default = {
    name          = "containerRegistryCP2Test001"
    sku           = "Standard"
    admin_enabled = true
  }
}

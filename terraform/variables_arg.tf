# From this file we configure the variables that terraform will use 
# to create the resoruce group

variable "resource_group" {
  description = "Configuring the resoruce group for CasoPractico2"
  type = object({
    name     = string
    location = string
  })
  default = {
    name     = "rg-casopractico-test001"
    location = "uksouth"
  }
}

# From this file we configure the variables that terraform will use 
# to create the infrastructure

variable "vm_network" {
  description = "Configuring the network of the VM for CasoPractico2"
  type = object({
    network_name            = string
    subnet_name             = string
    vnet_address_space      = list(string)
    subnet_address_prefixes = list(string)
  })
  default = {
    network_name            = "vnet1"
    subnet_name             = "subnet1"
    vnet_address_space      = ["10.0.0.0/16"]
    subnet_address_prefixes = ["10.0.2.0/24"]
  }
}

variable "vm_nic" {
  description = "Configuring the nic of the VM for CasoPractico2"
  type = object({
    name                          = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
  })
  default = {
    name                          = "vnic-cp2"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"
  }
}

variable "vm_instance" {
  description = "Configuring the VM instance for CasoPractico2"
  type = object({
    name                       = string
    size                       = string
    admin_username             = string
    public_key_location        = string
    disk                       = string
    storage_account_type       = string
    os_name                    = string
    os_publisher               = string
    os_version                 = string
    public_ip_name             = string
    public_ip_allocation_metod = string
  })
  default = {
    name                       = "vm-cp2"
    size                       = "Standard_F2"
    admin_username             = "azureuser"
    public_key_location        = "~/perm/azure/keys-azure-test-cli-001.pub"
    disk                       = "ReadWrite"
    storage_account_type       = "Standard_LRS"
    os_name                    = "centos-8-stream-free"
    os_publisher               = "cognosys"
    os_version                 = "22.03.28"
    public_ip_name             = "public_ip_cp2"
    public_ip_allocation_metod = "Dynamic"
  }
}

variable "vm_network_security_group" {
  description = "Configuring the VM nw security group for CasoPractico2"
  type = object({
    name                            = string
    rule_name                       = string
    rule_priority                   = number
    rule_direction                  = string
    rule_access                     = string
    rule_protocol                   = string
    rule_source_port_range          = string
    rule_destination_port_range     = string
    rule_source_address_prefix      = string
    rule_destination_address_prefix = string
  })
  default = {
    name                            = "securitygroup"
    rule_name                       = "sshrule"
    rule_priority                   = 1001
    rule_direction                  = "Inbound"
    rule_access                     = "Allow"
    rule_protocol                   = "Tcp"
    rule_source_port_range          = "*"
    rule_destination_port_range     = "22"
    rule_source_address_prefix      = "*"
    rule_destination_address_prefix = "*"
  }
}

variable "vm_network_security_rule" {
  description = "Configuring the VM nw security rules for CasoPractico2"
  type = object({
    rule_name                       = string
    rule_priority                   = number
    rule_direction                  = string
    rule_access                     = string
    rule_protocol                   = string
    rule_source_port_range          = string
    rule_destination_port_range     = string
    rule_source_address_prefix      = string
    rule_destination_address_prefix = string
  })
  default = {
    rule_name                       = "http"
    rule_priority                   = 1002
    rule_direction                  = "Inbound"
    rule_access                     = "Allow"
    rule_protocol                   = "Tcp"
    rule_source_port_range          = "*"
    rule_destination_port_range     = "8080"
    rule_source_address_prefix      = "*"
    rule_destination_address_prefix = "*"
  }
}


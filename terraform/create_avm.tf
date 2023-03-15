#terraform script meant to create a vm for casopractico2

resource "azurerm_virtual_network" "vnet" {
  name                = var.vm_network["network_name"]
  address_space       = var.vm_network["vnet_address_space"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.vm_network["subnet_name"]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.vm_network["subnet_address_prefixes"]
}

resource "azurerm_network_interface" "nic" {
  name                = var.vm_nic["name"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.vm_nic["ip_configuration_name"]
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.vm_nic["private_ip_address_allocation"]
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_instance["name"]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.vm_instance["size"]
  admin_username      = var.vm_instance["admin_username"]
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = var.vm_instance["admin_username"]
    public_key = file(var.vm_instance["public_key_location"])
  }

  os_disk {
    caching              = var.vm_instance["disk"]
    storage_account_type = var.vm_instance["storage_account_type"]
  }

  plan {
    name      = var.vm_instance["os_name"]
    product   = var.vm_instance["os_name"]
    publisher = var.vm_instance["os_publisher"]
  }


  source_image_reference {
    publisher = var.vm_instance["os_publisher"]
    offer     = var.vm_instance["os_name"]
    sku       = var.vm_instance["os_name"]
    version   = var.vm_instance["os_version"]
  }
}

resource "azurerm_network_security_group" "nsg1" {
  name                = var.vm_network_security_group["name"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = var.vm_network_security_group["rule_name"]
    priority                   = var.vm_network_security_group["rule_priority"]
    direction                  = var.vm_network_security_group["rule_direction"]
    access                     = var.vm_network_security_group["rule_access"]
    protocol                   = var.vm_network_security_group["rule_protocol"]
    source_port_range          = var.vm_network_security_group["rule_source_port_range"]
    destination_port_range     = var.vm_network_security_group["rule_destination_port_range"]
    source_address_prefix      = var.vm_network_security_group["rule_source_address_prefix"]
    destination_address_prefix = var.vm_network_security_group["rule_destination_address_prefix"]
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg-link" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

resource "azurerm_network_security_rule" "http" {
  name                        = var.vm_network_security_rule["rule_name"]
  priority                    = var.vm_network_security_rule["rule_priority"]
  direction                   = var.vm_network_security_rule["rule_direction"]
  access                      = var.vm_network_security_rule["rule_access"]
  protocol                    = var.vm_network_security_rule["rule_protocol"]
  source_port_range           = var.vm_network_security_rule["rule_source_port_range"]
  destination_port_range      = var.vm_network_security_rule["rule_destination_port_range"]
  source_address_prefix       = var.vm_network_security_rule["rule_source_address_prefix"]
  destination_address_prefix  = var.vm_network_security_rule["rule_destination_address_prefix"]
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg1.name
}

resource "azurerm_public_ip" "pip" {
  name                = var.vm_instance["public_ip_name"]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = var.vm_instance["public_ip_allocation_metod"]
}





# From this file we configure the output that the console will display after 
# executing terraform

# printing the id of the resource group
output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

# printing the vm machine id
output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

# printing the public ip of the vm
output "pip" {
  value = azurerm_public_ip.pip.ip_address
}


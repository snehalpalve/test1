output "network_name" {
  value = azurerm_virtual_network.vnet01.name
  description = "Name of the Virtual network"
}

output "web_subnet_id" {
  value = azurerm_subnet.websubnet.id
  description = "Id of websubnet in the network"
}

output "app_subnet_id" {
  value = azurerm_subnet.appsubnet.id
  description = "Id of appsubnet in the network"
}
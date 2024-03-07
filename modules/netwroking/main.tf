resource "azurerm_virtual_network" "vnet01" {
  name                = "vnet01"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet]
}

resource "azurerm_subnet" "web-subnet" {
  name                 = "web-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name = var.resource_group_name
  address_prefixes     = [var.websubnet]
}

resource "azurerm_subnet" "app-subnet" {
  name                 = "app-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name = var.resource_group_name
  address_prefixes     = [var.appsubnet]
}
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet]
}

resource "azurerm_subnet" "websubnet" {
  name                 = var.websubnet
  virtual_network_name = var.vnet
  resource_group_name = var.resource_group_name
  address_prefixes     = [var.websubnet]
}

resource "azurerm_subnet" "appsubnet" {
  name                 = var.appsubnet
  virtual_network_name = var.vnet
  resource_group_name = var.resource_group_name
  address_prefixes     = [var.appsubnet]
}
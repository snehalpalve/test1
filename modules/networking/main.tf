resource "azurerm_virtual_network" "vnet01" {
  name                = "vnet01"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnetcidr]
}

resource "azurerm_subnet" "websubnet" {
  name                 = "websubnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name = var.resource_group_name
  address_prefixes     = [var.websubnetcidr]
}

resource "azurerm_subnet" "appsubnet" {
  name                 = "appsubnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name = var.resource_group_name
  address_prefixes     = [var.appsubnetcidr]
}

resource "azurerm_subnet" "dbsubnet" {
  name                 = "dbsubnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = [var.dbsubnetcidr]
}
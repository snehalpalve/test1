resource "azurerm_availability_set" "web_availability_set" {
  name                = "web_availability_set_dev"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface" "web-net-interface" {
  name                = "web-network"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.web_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "VM-DEV-WEB" {
  name                  = "VM-DEV-WEB"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_F2"
  admin_username      = var.web_admin_username
  admin_password      = var.web_admin_password
  network_interface_ids = [azurerm_network_interface.web-net-interface.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_availability_set" "app_availability_set" {
  name                = "app_availability_set_dev"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface" "app-net-interface" {
  name                = "app-network"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.app_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "VM-DEV-APP" {
  name                  = "VM-DEV-APP"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_F2"
  admin_username      = var.app_admin_username
  admin_password      = var.app_admin_password
  network_interface_ids = [azurerm_network_interface.app-net-interface.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
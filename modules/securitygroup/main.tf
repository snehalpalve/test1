resource "azurerm_network_security_group" "web-nsg" {
  name                = "web-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  
  security_rule {
    name                       = "ssh-rule-1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "3389"
  }
}

resource "azurerm_subnet_network_security_group_association" "web-nsg-subnet" {
  subnet_id                 = var.web_subnet_id
  network_security_group_id = azurerm_network_security_group.web-nsg.id
}


resource "azurerm_network_security_group" "app-nsg" {
    name = "app-nsg"
    location = var.location
    resource_group_name = var.resource_group_name

    security_rule {
        name = "ssh-rule-1"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.1.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "80"
    }
    
    security_rule {
        name = "ssh-rule-2"
        priority = 101
        direction = "Outbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.1.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "*"
    }
}

resource "azurerm_subnet_network_security_group_association" "app-nsg-subnet" {
  subnet_id                 = var.app_subnet_id
  network_security_group_id = azurerm_network_security_group.app-nsg.id
}
output "resource_group_name" {
    value = azurerm_resource_group.KPMG.name
    description = "Name of the resource group."
}

output "location_id" {
    value = azurerm_resource_group.KPMG.location
    description = "Location id of the resource group"
}
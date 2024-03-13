terraform {
  backend "azurerm" {
    resource_group_name  = "KPMG"
    storage_account_name = "storagefostateallenv123"
    container_name       = "tfstatefile"
    key                  = "qa.terraform.tfstate"
  }
}
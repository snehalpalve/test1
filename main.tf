module "resourcegroup" {
  source = "./modules/resourcegroup"
  resource_group_name = var.resource_group_name
  location = var.location
}

module "networking" {
  source         = "./modules/networking"
  location       = module.resourcegroup.location_id
  resource_group_name = module.resourcegroup.resource_group_name
  vnetcidr       = var.vnetcidr
  websubnetcidr  = var.websubnetcidr
  appsubnetcidr  = var.appsubnetcidr
  dbsubnetcidr   = var.dbsubnetcidr
}

module "securitygroup" {
  source         = "./modules/securitygroup"
  location       = module.resourcegroup.location_id
  resource_group_name = module.resourcegroup.resource_group_name 
  web_subnet_id  = module.networking.web_subnet_id
  app_subnet_id  = module.networking.app_subnet_id
  db_subnet_id   = module.networking.db_subnet_id
}

module "compute" {
  source         = "./modules/compute"
  location = module.resourcegroup.location_id
  resource_group_name = module.resourcegroup.resource_group_name
  web_subnet_id = module.networking.web_subnet_id
  app_subnet_id = module.networking.app_subnet_id
  web_admin_username = var.web_admin_username
  web_admin_password = var.web_admin_password
  app_admin_username = var.app_admin_username
  app_admin_password = var.app_admin_password

}

module "database" {
  source = "./modules/database"
  location = module.resourcegroup.location_id
  resource_group_name = module.resourcegroup.resource_group_name
  primary_database = var.primary_database
  primary_database_version = var.primary_database_version
  primary_database_admin = var.primary_database_admin
  primary_database_password = var.primary_database_password
}

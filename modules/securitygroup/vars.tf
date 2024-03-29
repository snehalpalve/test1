variable "location" {}
variable "resource_group_name" {}
variable "web_subnet_id" {}
variable "app_subnet_id" {}
variable "db_subnet_id" {
  description = "ID of the subnet associated with the database"
  type        = string
}
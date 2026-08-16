variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "prefix" { type = string }
variable "db_subnet_id" { type = string }
variable "sql_admin_login" { type = string }
variable "sql_admin_password" { 
  type = string
  sensitive = true
}
variable "tags" { type = map(string) }

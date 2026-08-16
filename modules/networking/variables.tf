variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "prefix" { type = string }
variable "address_space" { type = list(string) }
variable "aks_subnet_prefix" { type = string }
variable "agw_subnet_prefix" { type = string }
variable "db_subnet_prefix" { type = string }
variable "tags" { type = map(string) }

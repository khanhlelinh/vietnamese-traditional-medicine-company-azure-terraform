variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "prefix" { type = string }
variable "vnet_subnet_id" { type = string }
variable "node_count" { 
  type = number
  default = 3
}
variable "tags" { type = map(string) }

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "Southeast Asia"
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "vtmc-staging"
}

variable "tenant_id" { type = string }

variable "vnet_address_space" { type = list(string) }
variable "aks_subnet_prefix" { type = string }
variable "agw_subnet_prefix" { type = string }
variable "db_subnet_prefix" { type = string }

variable "aks_node_count" { type = number }

variable "sql_admin_login" { type = string }
variable "sql_admin_password" { 
  type = string
  sensitive = true 
}

variable "tags" {
  type = map(string)
  default = {
    CostCenter  = "Vietnamese-Traditional-Medicine-Company-IT"
    Environment = "Staging"
    Project     = "Cloud-Migration"
  }
}

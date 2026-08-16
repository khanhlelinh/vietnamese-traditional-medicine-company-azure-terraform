variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "prefix" { type = string }
variable "tenant_id" { type = string }
variable "aks_ingress_fqdn" { type = string }
variable "tags" { type = map(string) }

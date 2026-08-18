# Networking

Module for provisioning networking resources.

## Usage

```hcl
module "networking" {
  source = "../../modules/networking"
  # ... example variables
}
```

## Requirements

| Name | Version |
|------|--------|
| terraform | >= 1.5.0 |
| azurerm | ~> 3.100 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| resource_group_name | - | string | - | yes |
| location | - | string | - | yes |
| prefix | - | string | - | yes |
| address_space | - | list(string) | - | yes |
| aks_subnet_prefix | - | string | - | yes |
| agw_subnet_prefix | - | string | - | yes |
| db_subnet_prefix | - | string | - | yes |
| tags | - | map(string) | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| vnet_id | - |
| aks_subnet_id | - |
| agw_subnet_id | - |
| db_subnet_id | - |

## Resources

| Name | Type |
|------|------|
| azurerm_virtual_network.vnet | azurerm_virtual_network |
| azurerm_subnet.aks | azurerm_subnet |
| azurerm_subnet.agw | azurerm_subnet |
| azurerm_subnet.db | azurerm_subnet |

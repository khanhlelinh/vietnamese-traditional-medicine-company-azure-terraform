# Databases

Module for provisioning databases resources.

## Usage

```hcl
module "databases" {
  source = "../../modules/databases"
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
| db_subnet_id | - | string | - | yes |
| sql_admin_login | - | string | - | yes |
| sql_admin_password | - | string | - | yes |
| tags | - | map(string) | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| sqlmi_id | - |
| sqlmi_fqdn | - |
| cosmos_id | - |
| cosmos_endpoint | - |

## Resources

| Name | Type |
|------|------|
| azurerm_mssql_managed_instance.mi | azurerm_mssql_managed_instance |
| azurerm_cosmosdb_account.cosmos | azurerm_cosmosdb_account |

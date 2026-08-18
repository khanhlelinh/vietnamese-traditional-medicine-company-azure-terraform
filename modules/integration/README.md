# Integration

Module for provisioning integration resources.

## Usage

```hcl
module "integration" {
  source = "../../modules/integration"
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
| tags | - | map(string) | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| apim_id | - |
| apim_gateway_url | - |
| servicebus_id | - |
| eventhub_namespace_id | - |

## Resources

| Name | Type |
|------|------|
| azurerm_api_management.apim | azurerm_api_management |
| azurerm_servicebus_namespace.sb | azurerm_servicebus_namespace |
| azurerm_eventhub_namespace.eh | azurerm_eventhub_namespace |

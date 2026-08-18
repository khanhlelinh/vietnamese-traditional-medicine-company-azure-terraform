# Monitoring

Module for provisioning monitoring resources.

## Usage

```hcl
module "monitoring" {
  source = "../../modules/monitoring"
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
| log_analytics_id | - |
| app_insights_instrumentation_key | - |
| app_insights_connection_string | - |

## Resources

| Name | Type |
|------|------|
| azurerm_log_analytics_workspace.law | azurerm_log_analytics_workspace |
| azurerm_application_insights.app_insights | azurerm_application_insights |

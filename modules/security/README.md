# Security

Module for provisioning security resources.

## Usage

```hcl
module "security" {
  source = "../../modules/security"
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
| tenant_id | - | string | - | yes |
| aks_ingress_fqdn | - | string | - | yes |
| tags | - | map(string) | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| frontdoor_id | - |
| frontdoor_fqdn | - |
| key_vault_id | - |
| key_vault_uri | - |

## Resources

| Name | Type |
|------|------|
| azurerm_frontdoor.fd | azurerm_frontdoor |
| azurerm_frontdoor_firewall_policy.waf | azurerm_frontdoor_firewall_policy |
| azurerm_key_vault.kv | azurerm_key_vault |

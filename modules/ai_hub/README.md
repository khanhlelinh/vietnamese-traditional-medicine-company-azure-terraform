# Ai Hub

Module for provisioning ai hub resources.

## Usage

```hcl
module "ai_hub" {
  source = "../../modules/ai_hub"
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
| openai_endpoint | - |
| face_endpoint | - |
| search_id | - |

## Resources

| Name | Type |
|------|------|
| azurerm_cognitive_account.openai | azurerm_cognitive_account |
| azurerm_cognitive_account.face | azurerm_cognitive_account |
| azurerm_search_service.search | azurerm_search_service |

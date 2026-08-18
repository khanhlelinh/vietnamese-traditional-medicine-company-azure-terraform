# Compute Aks

Module for provisioning compute aks resources.

## Usage

```hcl
module "compute_aks" {
  source = "../../modules/compute_aks"
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
| vnet_subnet_id | - | string | - | yes |
| node_count | - | number | 3 | no |
| tags | - | map(string) | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| aks_id | - |
| kube_config | - |
| aks_fqdn | - |

## Resources

| Name | Type |
|------|------|
| azurerm_kubernetes_cluster.aks | azurerm_kubernetes_cluster |

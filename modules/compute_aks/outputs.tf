output "aks_id" { value = azurerm_kubernetes_cluster.aks.id }
output "kube_config" { 
  value = azurerm_kubernetes_cluster.aks.kube_config_raw 
  sensitive = true
}
output "aks_fqdn" { value = azurerm_kubernetes_cluster.aks.fqdn }

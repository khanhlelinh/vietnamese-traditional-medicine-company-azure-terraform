output "aks_kube_config" {
  value     = module.compute_aks.kube_config
  sensitive = true
}

output "frontdoor_url" {
  value = module.security.frontdoor_fqdn
}

output "api_management_url" {
  value = module.integration.apim_gateway_url
}

output "frontdoor_id" { value = azurerm_frontdoor.fd.id }
output "frontdoor_fqdn" { value = azurerm_frontdoor.fd.frontend_endpoint[0].host_name }
output "key_vault_id" { value = azurerm_key_vault.kv.id }
output "key_vault_uri" { value = azurerm_key_vault.kv.vault_uri }

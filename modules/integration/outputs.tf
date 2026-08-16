output "apim_id" { value = azurerm_api_management.apim.id }
output "apim_gateway_url" { value = azurerm_api_management.apim.gateway_url }
output "servicebus_id" { value = azurerm_servicebus_namespace.sb.id }
output "eventhub_namespace_id" { value = azurerm_eventhub_namespace.eh.id }

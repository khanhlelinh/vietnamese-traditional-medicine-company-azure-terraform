output "sqlmi_id" { value = azurerm_mssql_managed_instance.mi.id }
output "sqlmi_fqdn" { value = azurerm_mssql_managed_instance.mi.fqdn }
output "cosmos_id" { value = azurerm_cosmosdb_account.cosmos.id }
output "cosmos_endpoint" { value = azurerm_cosmosdb_account.cosmos.endpoint }

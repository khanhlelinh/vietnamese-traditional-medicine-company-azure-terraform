output "log_analytics_id" { value = azurerm_log_analytics_workspace.law.id }
output "app_insights_instrumentation_key" { 
  value = azurerm_application_insights.app_insights.instrumentation_key 
  sensitive = true
}
output "app_insights_connection_string" {
  value = azurerm_application_insights.app_insights.connection_string
  sensitive = true
}

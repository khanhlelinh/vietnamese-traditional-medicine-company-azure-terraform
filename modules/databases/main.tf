resource "azurerm_mssql_managed_instance" "mi" {
  name                         = "${var.prefix}-sqlmi"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password
  license_type                 = "LicenseIncluded"
  sku_name                     = "GP_Gen5"
  vcores                       = 4
  storage_size_in_gb           = 256
  subnet_id                    = var.db_subnet_id
  
  tags = var.tags
}

resource "azurerm_cosmosdb_account" "cosmos" {
  name                = "${var.prefix}-cosmos"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "MongoDB"

  consistency_policy {
    consistency_level       = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  tags = var.tags
}

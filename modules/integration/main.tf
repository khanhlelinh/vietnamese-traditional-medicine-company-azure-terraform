resource "azurerm_api_management" "apim" {
  name                = "${var.prefix}-apim"
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = "VTMC IT"
  publisher_email     = "it@vtmc.com.vn"

  sku_name = "Developer_1"
  tags     = var.tags
}

resource "azurerm_servicebus_namespace" "sb" {
  name                = "${var.prefix}-sb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_eventhub_namespace" "eh" {
  name                = "${var.prefix}-eh"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  capacity            = 1
  tags                = var.tags
}
